import 'dart:io';

void main()
{
  print("Enter 1 no:");
  int a = int.parse(stdin.readLineSync().toString());

  print("Enter 2 no:");
  int b = int.parse(stdin.readLineSync().toString());

  var add = a+b;
  var sub = a-b;
  var mul = a*b;
  var div = a~/b;

  print("Addition is $add");
  print("Subtraction is $sub");
  print("Multiplication is $mul");
  print("Division is $div");

}