import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      'image': 'assets/magreta_pizza.jpg', // Image path
      'name': 'Magreta Pizza',
      'price': 9.99,
      'rating': 4.5,
    },
    {
      'image': 'assets/vegetable_pizza.jpg',
      'name': 'Vegetable Pizza',
      'price': 19.99,
      'rating': 4.5,
    },
    {
      'image': 'assets/burger_with_vegetable.jpg',
      'name': 'Burger with Vegetable',
      'price': 15.99,
      'rating': 4.4,
    },
    {
      'image': 'assets/burger_with_fries.jpg',
      'name': 'Burger with French Fries',
      'price': 26.60,
      'rating': 4.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            return MenuItemCard(menuItem: menuItems[index]);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final Map<String, dynamic> menuItem;

  const MenuItemCard({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              menuItem['image'],
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menuItem['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text('\$${menuItem['price'].toStringAsFixed(2)}'),
                Row(
                  children: List.generate(
                    5,
                        (starIndex) => Icon(
                      starIndex < menuItem['rating']
                          ? Icons.star
                          : Icons.star_border,
                      color: Colors.orange,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
