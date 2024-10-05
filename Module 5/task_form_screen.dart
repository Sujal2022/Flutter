import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:module_5_assigment1/taskmodel.dart';
import 'db_helper.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? task;

  TaskFormScreen({this.task});

  @override
  _TaskFormScreenState createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Initialize variables with default values
  late String _name;
  late String _description;
  late DateTime _dateTime;
  late TimeOfDay _time;
  String _priority = 'Low';

  @override
  void initState() {
    super.initState();

    // If task is passed, initialize values with the task's data
    if (widget.task != null) {
      _name = widget.task!.name;
      _description = widget.task!.description;
      _dateTime = widget.task!.dateTime;
      _time = TimeOfDay.fromDateTime(widget.task!.dateTime); // Extract time from DateTime
      _priority = widget.task!.priority;
    } else {
      // For new tasks, set default values
      _name = '';
      _description = '';
      _dateTime = DateTime.now();
      _time = TimeOfDay.now(); // Set the current time for new tasks
    }
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Combine selected date and time into a single DateTime object
      final newDateTime = DateTime(
        _dateTime.year,
        _dateTime.month,
        _dateTime.day,
        _time.hour,
        _time.minute,
      );

      if (widget.task != null) {
        // Use copyWith to update only the fields that were changed
        final updatedTask = widget.task!.copyWith(
          name: _name,
          description: _description,
          dateTime: newDateTime,
          priority: _priority,
        );
        await DatabaseHelper.instance.updateTask(updatedTask);
      } else {
        // Create a new task
        final newTask = Task(
          name: _name,
          description: _description,
          dateTime: newDateTime,
          priority: _priority,
        );
        await DatabaseHelper.instance.insertTask(newTask);
      }
      Navigator.pop(context);  // Close the form
    }
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.teal,
            hintColor: Colors.teal,
            colorScheme: ColorScheme.light(primary: Colors.teal),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        _dateTime = pickedDate;
      });
    }
  }

  Future<void> _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (pickedTime != null) {
      setState(() {
        _time = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Updated AppBar with elevation and custom style
        title: Text(
          widget.task != null ? 'Edit Task' : 'New Task',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(
                  labelText: 'Task Name',
                  labelStyle: TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                onSaved: (value) => _name = value!,
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter a task name';
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                onSaved: (value) => _description = value!,
                validator: (value) {
                  if (value!.isEmpty) return 'Please enter a description';
                  return null;
                },
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text('Due Date: ${DateFormat('yyyy-MM-dd').format(_dateTime)}'),
                trailing: Icon(Icons.calendar_today, color: Colors.teal),
                onTap: _pickDate,
              ),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text('Time: ${_time.format(context)}'),
                trailing: Icon(Icons.access_time, color: Colors.teal),
                onTap: _pickTime,
              ),
              DropdownButtonFormField<String>(
                value: _priority,
                items: ['Low', 'Average', 'High'].map((String priority) {
                  return DropdownMenuItem<String>(
                    value: priority,
                    child: Text(priority),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _priority = newValue!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Priority',
                  labelStyle: TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Customized Button
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  widget.task != null ? 'Update Task' : 'Save Task',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
