import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:url_launcher/url_launcher.dart';

class Call_Sms extends StatefulWidget {
  const Call_Sms({super.key});

  @override
  State<Call_Sms> createState() => _Call_SmsState();
}

class _Call_SmsState extends State<Call_Sms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('URl Launcher'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 300),
        child: Center(
          child: Column(children: [
            ElevatedButton(
              onPressed: () {
                var tel = Uri.parse("tel:8320788920");
                FlutterPhoneDirectCaller.callNumber('7990122123');
              },
              child: Text('call me'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                var sms = Uri.parse("sms: 8320788920");
                launchUrl(sms);
              },
              child: Text('Send sms'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white),
            ),
          ]),
        ),
      ),
    );
  }
}