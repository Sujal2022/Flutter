import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5), () {}); // Duration of splash screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ReverseNumber()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/reverse.json', // Replace with your Lottie file
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}


class ReverseNumber extends StatefulWidget {
  const ReverseNumber({super.key});

  @override
  State<ReverseNumber> createState() => _ReverseNumberState();
}

class _ReverseNumberState extends State<ReverseNumber> {
  final TextEditingController _numberController = TextEditingController();
  String _reversedNumber = ""; // Holds the reversed number

  // Method to reverse the input number
  void _reverseNumber() {
    String input = _numberController.text;
    String reversed = input.split('').reversed.join('');
    setState(() {
      _reversedNumber = reversed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reverse Number Program",
          style: TextStyle(color: Colors.blue),

        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              SizedBox(height: 50,),
              TextField(
                controller: _numberController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                  labelText: "Enter Number",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: _reverseNumber,
                child: Text("Reverse"),
              ),
              SizedBox(height: 40),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Reversed number is',
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController(text: _reversedNumber),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
