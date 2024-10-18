import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_online/productform.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'loginpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> dataList = [];
  late SharedPreferences prefs;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
    _fetchProducts(); // Fetch products when the page loads
  }

  Future<void> _checkLoginStatus() async {
    prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (!isLoggedIn) {
      // If user is not logged in, redirect to login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPageex()),
      );
    } else {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  // Fetch products from API
  Future<void> _fetchProducts() async {
    var url = Uri.parse('https://prakrutitech.buzz/Sujal/product_view.php'); // Adjust the API endpoint to your setup
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse the JSON response
      setState(() {
        dataList = json.decode(response.body); // Assuming the response is a JSON array of products
      });
    } else {
      // Handle the error
      print('Failed to load products');
    }
  }

  // Delete product function
  Future<void> _deleteProduct(String productId) async {
    var url = Uri.parse('https://prakrutitech.buzz/Sujal/product_delete.php'); // Change to your delete API endpoint
    var response = await http.post(url, body: {'id': productId});

    if (response.statusCode == 200) {
      // Refresh the product list after successful deletion
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product deleted successfully")));
      _fetchProducts(); // Reload the product list
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to delete product")));
    }
  }

  Future<void> _logout() async {
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPageex()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout, // Log out the user
            tooltip: 'Logout',
          ),
        ],
      ),
      body: dataList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          var product = dataList[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              title: Text(product['pname'] ?? 'No Product Name'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product['pdesc'] ?? 'No Description'),
                  Text("\$${product['pprice'] ?? 'N/A'}"),
                ],
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'edit') {
                    // Navigate to the ProductForm and pass the product data for editing
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductForm(product: product),
                      ),
                    );
                  } else if (value == 'delete') {
                    // Call the delete function and pass the product ID
                    _deleteProduct(product['id'].toString());
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: Text('Edit'),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProductForm()));
        },
        backgroundColor: Colors.grey,
        tooltip: 'Add Product',
        child: Icon(Icons.add),
      ),
    );
  }
}
