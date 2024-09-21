import 'package:flutter/material.dart';

class Secondscreen extends StatefulWidget
{

  String result;
  Secondscreen({required  this.result});

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Result"),backgroundColor: Colors.green,),
      body: Center
        (
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.shade300,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: const Offset(3.0, 3.0),
              ),
            ],
          ),

          child: Column(
            children: [
              Text
                (
                    "Sum is:${widget.result}",
                    style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    letterSpacing: 2.0,
              ),
              ),
              SizedBox(height: 500,),
              ElevatedButton(onPressed: ()
              {
                Navigator.pop(context);
              }, child: Text("Go Back")),
            ],
          ),


      ),
      )
    );
  }
}
