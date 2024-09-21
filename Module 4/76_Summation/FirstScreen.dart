import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'AnswerScreen.dart';

class Firstscreen extends StatefulWidget
{
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirsState();
}

class _FirsState extends State<Firstscreen>
{
  TextEditingController no1 = TextEditingController();
  TextEditingController no2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summation App')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: no1,
                  decoration:  InputDecoration(
                      hintText: "Enter a First number",
                      labelText: "Second number",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(20)
                      ),
                    focusedBorder: OutlineInputBorder
                      (
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorBorder: OutlineInputBorder
                      (
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                      ),
                  keyboardType: TextInputType.number,
                ),


                const SizedBox(height: 20),
                TextFormField(
                  controller: no2,
                  decoration:  InputDecoration(
                      hintText: "Enter a Second number",
                      labelText: "Second number",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(20)
                      ),
                    focusedBorder: OutlineInputBorder
                      (
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorBorder: OutlineInputBorder
                      (
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),

               ElevatedButton(onPressed: ()
               {
                 if(no1.text.isNotEmpty && no2.text.isNotEmpty)
                   {
                     int add = int.parse(no1.text)+ int.parse(no2.text);

                     var data = add.toString();
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> Secondscreen(result: data)));
                   }
                  else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please Enter Both Number...')),
                      );
                    }

               }, child: Text("Enter"))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
