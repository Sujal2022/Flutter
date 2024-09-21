

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget
{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{

  @override
  void initState()
  {
    // TODO: implement initState
    // super.initState();
    Timer(Duration(seconds: 3), ()
    {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => firstscreen()));
    });

  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      body: Center
        (
        //child:Image.network("https://yt3.googleusercontent.com/tWt6Z524G85N6RuHk2IHy05wso5CZ3YA2uK7Fzs4UO2i815uO_66j2s4aayp0eIj0jSAmCna1w=s900-c-k-c0x00ffffff-no-rj")
        child:Lottie.asset('assets/animation.json'),

      ),
    );
  }
}

class firstscreen extends StatefulWidget {


  @override
  State<firstscreen> createState() => _State();
}

class _State extends State<firstscreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("Splash Screen Example"),),

      body: Center(

        child: Column(

          children: [

            Text("Welcome"),
          ],
        ),
      ),

    );
  }
}
