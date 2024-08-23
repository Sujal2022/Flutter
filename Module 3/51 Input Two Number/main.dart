import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:input_two_number_51/secondscreen.dart';

void main()
{
    runApp(MaterialApp(home: Numberinputscreen(),debugShowCheckedModeBanner: false,));
}

class Numberinputscreen extends StatefulWidget {
  const Numberinputscreen({super.key});

  @override
  State<Numberinputscreen> createState() => _NumberinputscreenState();
}

class _NumberinputscreenState extends State<Numberinputscreen>
{
  TextEditingController startnumber = TextEditingController();
  TextEditingController endnumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
          appBar: AppBar(title: Text("Number Range App",style: TextStyle(color: CupertinoColors.white),),backgroundColor: Colors.green,),

        body: SingleChildScrollView(

          child: Center(

            child: Column(
              children: [

                SizedBox(height: 16,),

              TextField
                (
                controller: startnumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Start Number",
                  border: OutlineInputBorder(),
                ),
              ),

                SizedBox(height: 16,),

                TextField(
                  controller: endnumber,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "End Number",
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 16,),

              ElevatedButton(onPressed: ()
              {
                  int start = int.parse(startnumber.text);
                  int end = int.parse(endnumber.text);

                  if(start > end)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Start number must be less than end number'),
                        ),
                      );
                    }
                  else
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Numberrange(start: start, end: end)),);
                    }
              }, child: Text("Show Number"))









              ],
            ),
          ),
        ),
    );
  }
}
