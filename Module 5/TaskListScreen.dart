import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:module_5_assigment1/taskmodel.dart';
import 'db_helper.dart';
import 'task_form_screen.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> _taskList = [];
  List<Task> _filteredTaskList = [];
  String _searchQuery = '';

  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final tasks = await DatabaseHelper.instance.getTasks();
    setState(() {
      _taskList = tasks;
      _filteredTaskList = tasks;
    });
  }

  void _searchTasks(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredTaskList = _taskList;
      });
    } else {
      final filteredTasks = _taskList.where((task) {
        return task.name.toLowerCase().contains(query.toLowerCase());
      }).toList();

      setState(() {
        _filteredTaskList = filteredTasks;
      });
    }
  }

  void _clearSearch() {
    _searchController.clear();
    _searchTasks('');
    _searchFocusNode.unfocus();
  }

  void _deleteTask(Task task) async {
    await DatabaseHelper.instance.deleteTask(task.id!);
    _loadTasks();
  }

  void _markTaskComplete(Task task) async {
    final updatedTask = task.copyWith(isCompleted: true);
    await DatabaseHelper.instance.updateTask(updatedTask);
    _loadTasks();
  }

  void _editTask(Task task) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskFormScreen(task: task),
      ),
    ).then((_) => _loadTasks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0, // Remove shadow to give a cleaner appearance
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            controller: _searchController,
            focusNode: _searchFocusNode,
            onChanged: _searchTasks,
            decoration: InputDecoration(
              hintText: 'Search tasks...',
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.search, color: Colors.teal),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                icon: Icon(Icons.clear, color: Colors.teal),
                onPressed: _clearSearch,
              )
                  : null,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(color: Colors.grey[600]),
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100], // Light background to make tasks stand out
        ),
        child: _filteredTaskList.isEmpty
            ? Center(
          child: Text(
            'No tasks found, add new tasks!',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        )
            : Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: _filteredTaskList.length,
            itemBuilder: (context, index) {
              final task = _filteredTaskList[index];
              return Card(
                elevation: 5, // Higher elevation for more emphasis
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  title: Row(
                    children: [
                      Icon(
                        task.isCompleted
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: task.isCompleted
                            ? Colors.grey
                            : Colors.teal,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          task.name,
                          style: TextStyle(
                            decoration: task.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: task.isCompleted
                                ? Colors.grey
                                : _getPriorityColor(task.priority),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      DateFormat('EEE, MMM d, yyyy – hh:mm a')
                          .format(task.dateTime),
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'Complete') {
                        _markTaskComplete(task);
                      } else if (value == 'Edit') {
                        _editTask(task);
                      } else if (value == 'Delete') {
                        _deleteTask(task);
                      }
                    },
                    itemBuilder: (context) {
                      List<PopupMenuItem<String>> menuItems = [];

                      if (!task.isCompleted) {
                        menuItems.add(PopupMenuItem(
                          value: 'Complete',
                          child: Text('Complete the Task'),
                        ));
                        menuItems.add(PopupMenuItem(
                          value: 'Edit',
                          child: Text('Edit Task'),
                        ));
                      }

                      menuItems.add(PopupMenuItem(
                        value: 'Delete',
                        child: Text('Delete Task'),
                      ));

                      return menuItems;
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskFormScreen()),
          ).then((_) => _loadTasks());
        },
        backgroundColor: Colors.teal,
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.red;
      case 'Average':
        return Colors.orange;
      case 'Low':
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}
