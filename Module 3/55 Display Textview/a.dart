import 'package:flutter/material.dart';



class CheckboxTextScreen extends StatefulWidget
{
  final String text;

  CheckboxTextScreen({required this.text});

  @override
  _CheckboxTextScreenState createState() => _CheckboxTextScreenState();
}

class _CheckboxTextScreenState extends State<CheckboxTextScreen> {
  bool _isChecked = false; // To keep track of the checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Visibility Is'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false; // Update the checkbox state
                    });
                  },
                ),
                Text('Show Text'),
              ],
            ),
            SizedBox(height: 20),
            _isChecked // Conditional rendering of the Text widget
                ? Text(
                widget.text,
              style: TextStyle(fontSize: 20),
            )
                : Container(), // Empty container when the checkbox is not checked
          ],
        ),
      ),
    );
  }
}
