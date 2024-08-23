import 'package:flutter/material.dart';
import 'package:increase_decrease_fontsize_54/secondscreen.dart';

void main() {
  runApp(MaterialApp(home: FontSizeScreen(),debugShowCheckedModeBanner: false,));
}


class FontSizeScreen extends StatefulWidget
{
  @override
  _FontSizeScreenState createState() => _FontSizeScreenState();
}

class _FontSizeScreenState extends State<FontSizeScreen>
{
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Increase Decrease Font',),backgroundColor: Colors.redAccent,
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
                  builder: (context) => SecondScreen(text: _controller.text),
                ),
              );

            }, child: Text("Go"))

          ],

        ),
      ),
    );
  }
}
