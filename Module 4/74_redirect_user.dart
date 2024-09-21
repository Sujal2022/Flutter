import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: const Text('First Screen'),
       // automaticallyImplyLeading: true,
      ),
      body: Center(

        child: Column(

          children: [

            SizedBox(height: 250,),

            const Text(
              "Welcome to First Screen",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, wordSpacing: 5.0),
            ),

            const SizedBox(height: 20,),

            ElevatedButton(onPressed: ()
            {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Screen2()));

            }, child: Text("Go to Second Screen",style: TextStyle(fontWeight: FontWeight.bold),),)
          ],
        ),
      ),

      );
  }
}


class Screen2 extends StatefulWidget
{
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold
      (
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Second Screen'),
        automaticallyImplyLeading: true,
      ),
      body: Center(


        child: Column(

          children: [

            SizedBox(height: 250,),


            const Text(
              "Welcome to Second Screen",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, wordSpacing: 5.0),
            ),

            const SizedBox(height: 20,),

            ElevatedButton(onPressed: ()
            {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Screen1()));

            }, child: Text("Go to previous page",style: TextStyle(fontWeight: FontWeight.bold),),)
          ],
        ),
      ),
    );
  }
}

