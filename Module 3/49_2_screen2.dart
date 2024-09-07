import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';


class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "images/lake.jpg",
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kandersteg, Switzerland',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.red, size: 24),
                          SizedBox(width: 4),
                          Text(
                            '41',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.call, color: Colors.blue, size: 28),
                          SizedBox(height: 4),
                          Text('CALL'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.near_me, color: Colors.blue, size: 28),
                          SizedBox(height: 4),
                          Text('ROUTE'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.share, color: Colors.blue, size: 28),
                          SizedBox(height: 4),
                          Text('SHARE'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Lake Oeschinen lies at the foot of the Blüemlisalp in '
                        'the Bernese Alps. Situated 1,578 meters above sea level, '
                        'it is one of the larger Alpine Lakes. A gondola ride from '
                        'Kandersteg, followed by a half-hour walk through pastures '
                        'and pine forest, leads you to the lake, which warms to 20 '
                        'degrees Celsius in the summer. Activities enjoyed here include '
                        'rowing, and riding the summer toboggan run.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}