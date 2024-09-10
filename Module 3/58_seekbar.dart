import 'package:flutter/material.dart';


class Seekbarex extends StatefulWidget
{
  @override
  _ColorChangerHomePageState createState() => _ColorChangerHomePageState();
}

class _ColorChangerHomePageState extends State<Seekbarex> {
  // Initial values for the RGB colors
  double redValue = 0.0;
  double greenValue = 0.0;
  double blueValue = 0.0;

  // Method to create the background color from the RGB values
  Color _getBackgroundColor() {
    return Color.fromRGBO(redValue.toInt(), greenValue.toInt(), blueValue.toInt(), 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Changer with Sliders'),
        backgroundColor: _getBackgroundColor(),
      ),
      body: Container(
        color: _getBackgroundColor(), // The background color changes here
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Red Slider
            Slider(
              activeColor: Colors.red,
              min: 0.0,
              max: 255.0,
              value: redValue,
              onChanged: (newValue) {
                setState(() {
                  redValue = newValue;
                });
              },
            ),
            Text(
              'Red: ${redValue.toInt()}',
              style: TextStyle(fontSize: 20.0),
            ),
            // Green Slider
            Slider(
              activeColor: Colors.green,
              min: 0.0,
              max: 255.0,
              value: greenValue,
              onChanged: (newValue) {
                setState(() {
                  greenValue = newValue;
                });
              },
            ),
            Text(
              'Green: ${greenValue.toInt()}',
              style: TextStyle(fontSize: 20.0),
            ),
            // Blue Slider
            Slider(
              activeColor: Colors.blue,
              min: 0.0,
              max: 255.0,
              value: blueValue,
              onChanged: (newValue) {
                setState(() {
                  blueValue = newValue;
                });
              },
            ),
            Text(
              'Blue: ${blueValue.toInt()}',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
