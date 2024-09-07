import 'package:flutter/material.dart';



class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(

          child: Column(

            children: [
              // Red Box
              Container(
                color: Colors.red,
                height: 200,
                margin: EdgeInsets.only(bottom: 4.0), // space between red and blue boxes
              ),

              // Blue Boxes (two rows of two)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      height: 150,
                      margin: EdgeInsets.all(4.0), // spacing between blue boxes
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      height: 150,
                      margin: EdgeInsets.all(4.0),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      height: 150,
                      margin: EdgeInsets.all(4.0),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      height: 150,
                      margin: EdgeInsets.all(4.0),
                    ),
                  ),
                ],
              ),

              // Yellow Boxes (three boxes)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      height: 100,
                      margin: EdgeInsets.all(4.0),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      height: 100,
                      margin: EdgeInsets.all(4.0),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      height: 100,
                      margin: EdgeInsets.all(4.0),
                    ),
                  ),
                ],
              ),

              // Yellow Boxes (three boxes)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      height: 100,
                      margin: EdgeInsets.all(4.0),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      height: 100,
                      margin: EdgeInsets.all(4.0),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      height: 100,
                      margin: EdgeInsets.all(4.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
