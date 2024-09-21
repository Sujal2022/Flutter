import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class phonecall extends StatefulWidget {
  const phonecall({super.key});

  @override
  State<phonecall> createState() => _phonecallState();
}

class _phonecallState extends State<phonecall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Call Permisson'),
      ),
      body: Center(
        child: Container(
            child: ElevatedButton(
              onPressed: () {
                requestCallPermission();
              },
              child: Text('Call permisson'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white),
            )),
      ),
    );
  }

  void requestCallPermission() async {
    var status = await Permission.phone.request();

    if (status.isGranted) {
      print("Permission granted");
    } else if (status.isDenied) {
      print("Permission denied");
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}