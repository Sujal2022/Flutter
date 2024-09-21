/*


List franchise  =
[
  "Domino's Pizza",
  "Pizza Hut",
  "Subway",
  "Burger King",
  "McDonald's",
  "Dunkin’s Donuts",
  " Wow! Momo",
  "Sankalp",
  "Saraza",
];
int franchiseIndex = 0;


class franchiseWidget extends StatefulWidget
{  @override
  State<franchiseWidget> createState() => _franchiseWidgetState();
}

class _franchiseWidgetState extends State<franchiseWidget>
{
  @override
  Widget build(BuildContext context)
{

  }}

{
  return Container(
    height: 60,
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ListView.builder(
        itemCount: franchise.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              franchiseIndex = index;
              setState(() {});
            },
            splashColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: franchiseIndex == index
                      ? Colors.orangeAccent
                      : Colors.black12),
              padding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Center(
                child: Text(
                  franchise[index],
                  style: TextStyle(
                      fontSize: franchiseIndex == index ? 18 : 16,
                      fontWeight: franchiseIndex == index
                          ? FontWeight.bold
                          : FontWeight.w500),
                ),
              ),
            ),
          );
        }),
  );

}*/

import 'package:flutter/material.dart';

class franchiseWidget extends StatefulWidget
{
  const franchiseWidget({super.key});

  @override
  State<franchiseWidget> createState() => _franchiseWidgetState();
}

class _franchiseWidgetState extends State<franchiseWidget>
{
  List franchise  =
  [
    "Domino's Pizza",
    "Pizza Hut",
    "Subway",
    "Burger King",
    "McDonald's",
    "Dunkin’s Donuts",
    " Wow! Momo",
    "Sankalp",
    "Saraza",
  ];
  int franchiseIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 60,
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ListView.builder(
        itemCount: franchise.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              franchiseIndex = index;
              setState(() {});
            },
            splashColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: franchiseIndex == index
                      ? Colors.orangeAccent
                      : Colors.black12),
              padding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Center(
                child: Text(
                  franchise[index],
                  style: TextStyle(
                      fontSize: franchiseIndex == index ? 18 : 16,
                      fontWeight: franchiseIndex == index
                          ? FontWeight.bold
                          : FontWeight.w500),
                ),
              ),
            ),
          );
        }),
    );
  }
}

