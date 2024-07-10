import 'dart:io';

void main()
{
  print("Enter Principal value:");
  double p = double.parse(stdin.readLineSync().toString());

  print("Enter Rate value:");
  double r = double.parse(stdin.readLineSync().toString());

  print("Enter Time:");
  double t = double.parse(stdin.readLineSync().toString());

  var ans = p*r*t;
  var simpleinterest = ans~/100;

  print("Simple interest is $simpleinterest");
}