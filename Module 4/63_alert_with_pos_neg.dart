import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';




class AlertScren63 extends StatefulWidget
{
  const AlertScren63({super.key});

  @override
  State<AlertScren63> createState() => _AlertScreen63State();
}

class _AlertScreen63State extends State<AlertScren63>
{

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar
          (
          title: Text("Alert Dialog Example"),
        ),
      body: Center
        (
        child: ElevatedButton(
          onPressed: (){

            showMyDialog(context);
          },child: Text('Show Alert Button'),
        ),
      ),

      );
  }
}

void showMyDialog(BuildContext context)
{
  showDialog(
      context: context,
      builder: (BuildContext context)
  {
    return AlertDialog
      (
      title: Text('Choose an option'),
      content: Text('Do you want to proceed?'),

      actions: [

        TextButton(
          onPressed: () {
            Fluttertoast.showToast(
              msg: "Positive button clicked",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );
            Navigator.of(context).pop();
          },
          child: Text('Yes'),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
        TextButton(
          onPressed: () {
            Fluttertoast.showToast(
              msg: "Negative button clicked",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
            Navigator.of(context).pop();
          },
          child: Text('No'),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),

        TextButton(
          onPressed: () {
            Fluttertoast.showToast(
              msg: "Neutral Button Clicked",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
            );
            Navigator.of(context).pop();
          },
          child: Text('Neutral'),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),

      ],

    );

  }

  );


}
