
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'a.dart';



void main()
{
  runApp(MaterialApp(home: checkboxex(),));
}

class checkboxex extends StatefulWidget
{
  const checkboxex({super.key});

  @override
  State<checkboxex> createState() => _checkboxexState();
}

class _checkboxexState extends State<checkboxex>
{
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Text Visibility',),backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(

          children:
          [
            SizedBox(height: 50,),
            TextField
              (
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter some text',
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(onPressed: ()
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckboxTextScreen(text: _controller.text),
                ),
              );

            }, child: Text("Go"))

          ],

        ),
      ),
    );
  }
}
