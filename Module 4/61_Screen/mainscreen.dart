import 'package:flutter/material.dart';
import 'cartscreen.dart';
import 'foodscreen.dart';

class MainScreenex extends StatefulWidget
{
  const MainScreenex({super.key});

  @override
  State<MainScreenex> createState() => _MainScreenexState();
}

class _MainScreenexState extends State<MainScreenex>
{
  int _selectedIndex = 0;

  List<Widget> Screens = <Widget>[
    Foodscreen(),
    CartScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_sharp),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),


    );
  }
}
