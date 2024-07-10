import 'dart:io';

void main()
{
  print("Enter base value:");
  double base = double.parse(stdin.readLineSync().toString());

  print("Enter height value:");
  double height = double.parse(stdin.readLineSync().toString());

  var area = 0.5*base*height;

  print("Area of triangle is $area");
}