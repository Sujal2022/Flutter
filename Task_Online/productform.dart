import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home.dart';

class ProductForm extends StatefulWidget {
  final Map<String, dynamic>? product; // Add product parameter for editing

  const ProductForm({super.key, this.product});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController Productname = TextEditingController();
  final TextEditingController Productprice = TextEditingController();
  final TextEditingController Productdesc = TextEditingController();
  late String pname, pprice, pdesc;

  @override
  void initState() {
    super.initState();
    // If editing, pre-fill the fields with existing product details
    if (widget.product != null) {
      Productname.text = widget.product!['pname'];
      Productprice.text = widget.product!['pprice'];
      Productdesc.text = widget.product!['pdesc'];
    }
  }

  @override
  void dispose() {
    Productname.dispose();
    Productprice.dispose();
    Productdesc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Add Product' : 'Edit Product'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text(
                  widget.product == null ? 'Add Product' : 'Edit Product',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: Productname,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter Product Name';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: Productprice,
                  decoration: InputDecoration(
                    labelText: 'Product Price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter Product Price';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: Productdesc,
                  decoration: InputDecoration(
                    labelText: 'Product Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter Product Description';
                    return null;
                  },
                  maxLines: 2,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      pname = Productname.text;
                      pprice = Productprice.text;
                      pdesc = Productdesc.text;
                      if (widget.product == null) {
                        // Add new product
                        _addProduct();
                      } else {
                        // Edit existing product
                        _editProduct();
                      }
                    }
                  },
                  child: Text(widget.product == null ? 'Add' : 'Update'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Add new product
  Future<void> _addProduct() async {
    var url = Uri.parse("https://prakrutitech.buzz/Sujal/product.php");
    var response = await http.post(url, body: {
      'pname': pname,
      'pprice': pprice,
      'pdesc': pdesc,
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product added successfully")));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to add product")));
    }
  }

  // Edit existing product
  Future<void> _editProduct() async {
    var url = Uri.parse("https://prakrutitech.buzz/Sujal/product_update.php");
    var response = await http.post(url, body: {
      'id': widget.product!['id'].toString(), // Pass the product ID to edit the correct product
      'pname': pname,
      'pprice': pprice,
      'pdesc': pdesc,
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product updated successfully")));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to update product")));
    }
  }
}
