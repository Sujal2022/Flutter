import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For SystemNavigator.pop()




class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool shouldExit = await _onWillPop(context);
        if (shouldExit) {
          SystemNavigator.pop(); // Exits the app
        }
        return false; // Prevents default back behavior
      },
      child: Scaffold(
        appBar: AppBar(

          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              bool shouldExit = await _onWillPop(context);
              if (shouldExit) {
                SystemNavigator.pop(); // Exits the app when back arrow is clicked
              }
            },
          ),
          title: Text('Confirmation Dialog'),
        ),
        body: Center(
          child:Column(
          children :[
          Text('Press back or app bar back arrow to see the confirmation dialog.'),
          ]
        ),
        ),
      ),
    );
  }
}
