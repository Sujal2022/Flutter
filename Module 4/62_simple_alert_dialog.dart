import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Myhomepage extends StatefulWidget
{


  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(
          title: Text("Simple Alert Button"),
        ),

      body: Center(

        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            ElevatedButton(onPressed: ()
            {
              showDialog(context: context,
              builder: (BuildContext Context){
                    return Advancedalertex();
              });

            }, child: Text('Alert Button'))
          ],
        ),
      ),
      );
  }
}

class Advancedalertex extends StatelessWidget
{
  const Advancedalertex({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog
      (

      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children:
        [
          Container(
            height: 250,
            child: Padding(
              padding:  EdgeInsets.fromLTRB(10, 70, 10, 10),
              child: Column(
                children:
                [
                  Text('Warming !!!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 5,),
                  Text('This is the alert dialog description',style: TextStyle(fontSize: 20),textAlign: TextAlign.center ,),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: ()
                  {
                          Navigator.of(context).pop();
                  }, child: Text('OK',style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,),)

                ],
              ),
            ),
          ),
          Positioned(child: CircleAvatar(

            backgroundColor: Colors.redAccent,
            radius: 50,
            child: Icon(Icons.info,size: 50,color: Colors.white,),
          ),
            top: -40,
          )

        ],
      ),


    );
  }
}


