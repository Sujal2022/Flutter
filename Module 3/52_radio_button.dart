import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';





class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5), () {}); // Duration of splash screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Calculator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/calc.json', // Replace with your Lottie file
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();

}
enum Operation { add, subtract, multiply, divide }

class _CalculatorState extends State<Calculator>
{

  double? num1,num2;

  String result = " ";

  Operation selectoperation = Operation.add;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (

      appBar: AppBar(title: Text("Calculator App",),backgroundColor:Colors.blue,centerTitle: true,),
      body: SingleChildScrollView
        (
        child: Center(

          child: Column(

            children:
            [
              SizedBox(height: 30,),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter First Number',
                  hintText: "First Number",
                  border: OutlineInputBorder(),
                ),

                onChanged: (value) {
                  setState(() {
                    num1 = double.tryParse(value)!;
                  });
                },
              ),

              SizedBox(height: 20,),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Second Number',
                  hintText: "Second Number",
                  border: OutlineInputBorder(),
                ),

                onChanged: (value) {
                  setState(() {
                    num2 = double.tryParse(value)!;
                  });
                },

              ),

              SizedBox(height: 20,),

              RadioListTile<Operation>(
                title: const Text('Add'),
                value: Operation.add,
                groupValue: selectoperation,
                onChanged: (Operation? value) {
                  setState(()
                  {
                    selectoperation = value!;
                  });
                },
              ),

              RadioListTile<Operation>(
                title: const Text('Subtract'),
                value: Operation.subtract,
                groupValue: selectoperation,
                onChanged: (Operation? value) {
                  setState(()
                  {
                    selectoperation = value!;
                  });
                },
              ),

              RadioListTile<Operation>(
                title: const Text('Multiply'),
                value: Operation.multiply,
                groupValue: selectoperation,
                onChanged: (Operation? value) {
                  setState(()
                  {
                    selectoperation = value!;
                  });
                },
              ),

              RadioListTile<Operation>(
                title: const Text('Divide'),
                value: Operation.divide,
                groupValue: selectoperation,
                onChanged: (Operation? value) {
                  setState(()
                  {
                    selectoperation = value!;
                  });
                },
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateResult,
                child: Text('Calculate'),
              ),
              SizedBox(height: 20),
              Text(
                'Result: $result',
                style: TextStyle(fontSize: 24),
              ),


            ],
          ),
        ),
      ),


    );
  }

  void calculateResult()
  {
    if (num1 == null || num2 == null) {
      setState(() {
        result = 'Please enter both numbers';
      });
      return;
    }
    double calcResult;

    switch (selectoperation) {
      case Operation.add:
        calcResult = num1! + num2!;
        break;
      case Operation.subtract:
        calcResult = num1! - num2!;
        break;
      case Operation.multiply:
        calcResult = num1! * num2!;
        break;
      case Operation.divide:
        if (num2 == 0) {
          setState(() {
            result = 'Cannot divide by zero';
          });
          return;
        }
        calcResult = num1! / num2!;
        break;
    }
    setState(() {
      result = calcResult.toString();
    });
  }
}
