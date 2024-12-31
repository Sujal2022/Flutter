import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'main_activity.dart';

class SplashScreen extends StatefulWidget {
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
    Timer(Duration(seconds: 4), ()
    {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MainActivity()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child:Lottie.asset('assets/animation.json'),
      ),
    );
  }
}
