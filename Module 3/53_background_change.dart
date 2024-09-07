import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: BackgroundChanger(),
  ));
}

class BackgroundChanger extends StatefulWidget {
  @override
  _BackgroundChangerState createState() => _BackgroundChangerState();
}

class _BackgroundChangerState extends State<BackgroundChanger> {
  Color _backgroundColor = Colors.white;

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Color(Random().nextInt(0xffffffff));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text('Background Changer'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _changeBackgroundColor,
          child: Text('Change Background Color'),
        ),
      ),
    );
  }
}
