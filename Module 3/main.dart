import 'package:flutter/material.dart';

import '49_1_screen1.dart';
import '49_2_screen2.dart';
import '50_reverse_number.dart';
import '54_increase_decrease_fontsize.dart';
import '51_input_two_number.dart';
import '52_radio_button.dart';
import '53_background_change.dart';
import '55_display_textview_checkbox.dart';
import '56_textview_around_images.dart';
import '57_display_screen_color.dart';
import '59_login_registration_screen.dart';
import '60_1_Screen1.dart';


void main()
{
  runApp(MaterialApp(home: AllScreenbutton(),debugShowCheckedModeBanner: false,),);
}


class AllScreenbutton extends StatefulWidget
{
  const AllScreenbutton({super.key});

  @override
  State<AllScreenbutton> createState() => _AllScreenbuttonState();
}

class _AllScreenbuttonState extends State<AllScreenbutton>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("Module 3 ",style: TextStyle(color: Colors.grey),),backgroundColor: Colors.green,),
      body: SingleChildScrollView
        (
        child: Center(
          child: Column
            (
            children:
            [
              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen1()));
              }, child: Text("49 Screen 1"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen2()));
              }, child: Text("49 Screen 2"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashScreen()));
              }, child: Text("50 Reverse Number "),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Numberinputscreen()));
              }, child: Text("51 Input Two Number "),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashScreen1()));
              }, child: Text("52 Radio Button"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BackgroundChanger()));
              }, child: Text("53 Background Change"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> FontSizeScreen()));
              }, child: Text("54 Increase Decrease Fontsize"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> checkboxex()));
              }, child: Text("55 Display Textview Checkbox"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Textviewaroundimages()));
              }, child: Text("56 Textview Around Images"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Colorscreenselect()));
              }, child: Text("57 Display Screen Color"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
              }, child: Text("59 Login Registration Screen"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RestaurantScreen()));
              }, child: Text("60 Screen 1"),),

            ],
          ),
        ),
      ),
    );
  }
}

