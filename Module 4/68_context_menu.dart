import 'package:flutter/material.dart';

class ContextMenu extends StatefulWidget {
  @override
  _edit_menuState createState() => _edit_menuState();
}

class _edit_menuState extends State<ContextMenu> {
  List<String> country = [
    "India",
    "Malaysia",
    "Australia",
    "Canada",
    "Russia",
    "France",
    "Switzerland",
    "Germany",
    "Italy",
    "Turkey",
    "Thailand",
    "Spain",
    "Saudi Arabia",
    "Cuba",
    "Oman",
    "North German Union",
    "Nepal",
    "Niger",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country List"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: country.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onLongPressStart: (LongPressStartDetails details) {
                  _showContextMenu(context, details.globalPosition, index);
                },
                child: ListTile(
                  title: Text(
                    country[index],
                    style: TextStyle(
                      color: Colors.teal[700],
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  /*trailing: Icon(
                    Icons.more_vert,
                    color: Colors.teal[400],
                  ),*/
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Show context menu at the long press position
  void _showContextMenu(BuildContext context, Offset position, int index) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx,
        position.dy,
      ),
      items: [
        PopupMenuItem<String>(
          value: 'View',
          child: ListTile(
            leading: Icon(Icons.visibility, color: Colors.blue),
            title: Text('View'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Edit',
          child: ListTile(
            leading: Icon(Icons.edit, color: Colors.orange),
            title: Text('Edit'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'Delete',
          child: ListTile(
            leading: Icon(Icons.delete, color: Colors.red),
            title: Text('Delete'),
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        _handleMenuAction(value, index);
      }
    });
  }

  // Handle actions: View, Edit, Delete
  void _handleMenuAction(String action, int index) {
    setState(() {
      switch (action) {
        case 'View':
          _viewItem(index);
          break;
        case 'Edit':
          _editItem(index);
          break;
        case 'Delete':
          _deleteItem(index);
          break;
      }
    });
  }

  // View country
  void _viewItem(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                Icons.info,
                color: Colors.blue,
              ),
              SizedBox(width: 10),
              Text('Country Info'),
            ],
          ),
          content: Text(
            "Country: ${country[index]}",
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        );
      },
    );
  }

  // Edit country
  void _editItem(int index) {
    TextEditingController _controller =
    TextEditingController(text: country[index]);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Country"),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Country Name',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.lightBlue,
                  width: 2,
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  country[index] = _controller.text;
                });
                Navigator.of(context).pop();
              },
              child: Text("Save"),
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        );
      },
    );
  }

  // Delete country
  void _deleteItem(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Country"),
          content: Text(
            "Are you sure you want to delete ${country[index]}?",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  country.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text("Delete"),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        );
      },
    );
  }
}
