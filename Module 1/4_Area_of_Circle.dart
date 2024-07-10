import 'dart:io';

void main()
{
  print("Enter r value:");
  double r = double.parse(stdin.readLineSync().toString());

  var area = 3.14*r*r;

  print("Area of circle is $area");

}