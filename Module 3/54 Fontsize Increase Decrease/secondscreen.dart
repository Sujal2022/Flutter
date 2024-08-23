import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final String text;

  SecondScreen({required this.text});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  double _fontSize = 16.0;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar
        (
        title: Text('Your Font Is'),backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyle(fontSize: _fontSize),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _fontSize += 2.0;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      _fontSize -= 2.0;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()
            {
                Navigator.pop(context);
            }, child: Text("Go Back")),
          ],
        ),
      ),
    );
  }
}
