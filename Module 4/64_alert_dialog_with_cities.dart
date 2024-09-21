
import 'package:flutter/material.dart';


class CitySelector extends StatefulWidget {
  @override
  _CitySelectorState createState() => _CitySelectorState();
}

class _CitySelectorState extends State<CitySelector> {
  String _selectedCity = "Select a city";

  // List of cities
  final List<String> _cities =
  [
    'Rajkot',
    'Ahmedabad',
    'Surat',
    'Jamnagar',
    'Bhavnagar',
    'Vadodara',
    'Morbi',
    'Junagadh',
    'Dwarka',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Selector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedCity,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showCitySelectionDialog(context),
              child: Text('Select City'),
            ),
          ],
        ),
      ),
    );
  }

  void _showCitySelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? _tempSelectedCity = _selectedCity;

        return AlertDialog(
          title: Text('Choose a city'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _cities.map((city)
                  {
                    return RadioListTile<String>(
                      title: Text(city),
                      value: city,
                      groupValue: _tempSelectedCity,
                      onChanged: (String? value)
                      {
                        setState(() {
                          _tempSelectedCity = value!;
                        });
                      },
                    );
                  }).toList(),
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedCity = _tempSelectedCity!;
                });
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
