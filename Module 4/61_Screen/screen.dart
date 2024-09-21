import 'package:flutter/material.dart';

class Screenex extends StatefulWidget
{
  const Screenex({super.key});

  @override
  State<Screenex> createState() => _ScreenexState();
}

class _ScreenexState extends State<Screenex>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
               Icon(Icons.search,color: Colors.grey,),
               Icon(Icons.filter_alt_rounded,color: Colors.grey,),
              ],
            ),

        ),
      ),
      body: SingleChildScrollView
        (
          child: Padding(
            padding: EdgeInsets.all(16.0),

            child: Column(

              children: [

              ],
            ),

          ),


        ),

    );
  }
}
