import 'package:flutter/material.dart';


import '61_Screen/mainscreen.dart';
import '62_simple_alert_dialog.dart';
import '63_alert_with_pos_neg.dart';
import '64_alert_dialog_with_cities.dart';
import '65_alert_button_with_exit.dart';
import '66_Date.dart';
import '67_profile_and_logout_option.dart';
import '68_context_menu.dart';
import '69_gmail/home.dart';
import '70_bottom_navigator_gallery.dart';
import '71_navigator_drawer_gallery.dart';
import '72_phone_call_app.dart';
import '73_Splash_Screen.dart';
import '74_redirect_user.dart';
import '76_Summation/FirstScreen.dart';
import '77_call_sms.dart';
import '78_crud_operation.dart';



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
      appBar: AppBar(title: Text("Module 4",style: TextStyle(color: Colors.grey),),backgroundColor: Colors.green,),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreenex()));
              }, child: Text("61 Food Screen"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Myhomepage()));
              }, child: Text("62 Simple Alert Button"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AlertScren63()));
              }, child: Text("63 Alert Button with-Positive,Negative,neutral"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CitySelector()));
              }, child: Text("63 Alert Button With List of City "),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
              }, child: Text("65 Alert Button With Exit"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DatePickerExample()));
              }, child: Text("66 Date"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SeeProfile()));
              }, child: Text("67 Profile and Logout Option"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ContextMenu()));
              }, child: Text("68 Context Menu"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Gmailsecreenex ()));
              }, child: Text("69 Gmail"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomGalleryex()));
              }, child: Text("70 Bottom Gallery"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> NavigatorDrawerEx()));
              }, child: Text("71 Navigator Drawer Gallery"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> phonecall()));
              }, child: Text("72 Phone Call App"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashScreen()));
              }, child: Text("73 Splash Screen"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen1()));
              }, child: Text("74 Redirect User"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Firstscreen()));
              }, child: Text("76 Summation Program"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Call_Sms()));
              }, child: Text("76 Call Sms"),),

              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
              }, child: Text("76 Crud Operation"),),

            ],
          ),
        ),
      ),
    );
  }
}

