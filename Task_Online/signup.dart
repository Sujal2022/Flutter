import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'loginpage.dart';

class Signupage extends StatefulWidget
{
  const Signupage({super.key});

  @override
  State<Signupage> createState() => _SignupageState();
}

class _SignupageState extends State<Signupage>
{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  late String fname, lname, email, password, gender, city;


  String? _selectedGender; // Set as nullable
  String? _selectedCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Text(
                  'Create an Account',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _fnameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter your first name';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _lnameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter your last name';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty)
                      {
                        return 'Please enter your email';
                      }
                    /*if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }*/
                    return null;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  value: _selectedGender, // Can be null initially
                  items: <String>['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue; // Update gender value
                    });
                  },
                  validator: (value) {
                    if (value == null) return 'Please select a gender';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  value: _selectedCity,
                  items: <String>['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCity = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) return 'Please select a city';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter your password';
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _cpasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text)
                    {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: ()
                  {
                    if (_formKey.currentState!.validate()) {
                      // Validate all form fields before proceeding
                      fname = _fnameController.text;
                      lname = _lnameController.text;
                      email = _emailController.text;
                      password = _passwordController.text;
                      gender = _selectedGender!;
                      city = _selectedCity!;
                      _register();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please correct the errors')),
                      );
                    }
                  },
                  child: Text('Sign Up'),
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
  Future<void> _register() async {
    print("1");
    var url = Uri.parse("https://prakrutitech.buzz/Sujal/signup.php");
    await http.post(url, body: {
      'fname': fname,
      'lname': lname,
      'email': email,
      'password': password,
      'gender': gender,
      'city': city
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Register success")));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPageex()));
  }

}




