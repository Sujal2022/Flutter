import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> _items = [];
  String _selectedItem = "";

  // To track selected index for editing purposes
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crud Operation'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextField(),
            SizedBox(height: 10),
            _buildAddUpdateButton(),
            SizedBox(height: 20),
            Expanded(
              child: _buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Enter Name',
        labelStyle: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.w600,
        ),
        hintText: 'Type a name...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.indigoAccent,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.indigo,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.indigoAccent,
            width: 2.0,
          ),
        ),
        prefixIcon: Icon(Icons.person, color: Colors.indigoAccent),
      ),
      cursorColor: Colors.indigo,
      style: TextStyle(
        color: Colors.indigo,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildAddUpdateButton() {
    return ElevatedButton(
      onPressed: () {
        if (_controller.text.isNotEmpty) {
          if (_selectedIndex == null) {
            // Add new item
            setState(() {
              _items.add(_controller.text);
              _controller.clear();
            });
          } else {
            // Edit existing item
            setState(() {
              _items[_selectedIndex!] = _controller.text;
              _controller.clear();
              _selectedIndex = null; // Reset selection after edit
            });
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigoAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      child: Text(
        _selectedIndex == null ? 'Add Name' : 'Update Name',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Show dialog with item info
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Item Selected'),
                  content: Text('You selected: ${_items[index]}'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          onLongPress: () {
            // Show context menu (edit, delete, exit)
            _showContextMenu(context, index);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 6.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.indigo[50],
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.indigoAccent,
                width: 1.5,
              ),
            ),
            child: Text(
              _items[index],
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.indigo,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }

  void _showContextMenu(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.edit, color: Colors.blueAccent),
              title: Text('Edit Item'),
              onTap: () {
                Navigator.of(context).pop();
                _editItem(index);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.redAccent),
              title: Text('Delete Item'),
              onTap: () {
                Navigator.of(context).pop();
                _confirmDeleteItem(context, index);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.grey),
              title: Text('Exit'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteItem(BuildContext context, int index)
  {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Item'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _items.removeAt(index); // Remove item from list
                });
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _editItem(int index)
  {
    // Set the text field to the selected item's text and mark it for editing
    setState(() {
      _controller.text = _items[index];
      _selectedIndex = index;
    });
  }
}