import 'package:flutter/material.dart';

class ContextMenu extends StatefulWidget
{
  @override
  _edit_menuState createState() => _edit_menuState();
}

class _edit_menuState extends State<ContextMenu>
{

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
        title: Text("Contry List"),
      ),
      body: ListView.builder(
        itemCount: country.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide())),
            child: ListTile(
              title: Text(country[index],style: TextStyle(color: Colors.blue)),
              trailing: PopupMenuButton<String>(
                onSelected: (String action) {
                  _handleMenuAction(action, index);
                },
                itemBuilder: (BuildContext context) {
                  return ['View', 'Edit', 'Delete'].map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ),
          );
        },
      ),
    );
  }

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

  void _viewItem(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Country is ${country[index]}"),
          title: Row(
            children: [
              Icon(
                Icons.info,
                color: Colors.blue,
              ),
              SizedBox(
                width: 5,
              ),
              Text('Info')
            ],
          ),
        );
      },
    );
  }

  void _editItem(int index) {
    TextEditingController _controller =
    TextEditingController(text: country[index]);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Item"),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), // Rounded border
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), // Rounded border
                borderSide: BorderSide(
                  color: Colors.lightBlue,
                  width: 2,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12), // Rounded border
                borderSide: BorderSide(
                  color: Colors.grey,
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
                  foregroundColor: Colors.white, backgroundColor: Colors.blue),
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(int index) {
    setState(() {
      country.removeAt(index);
    });
  }
}