import 'dart:io';

void main()
{
  print("Enter no1 value:");
  int a = int.parse(stdin.readLineSync().toString());

  print("Enter no2 value:");
  int b = int.parse(stdin.readLineSync().toString());

  print("Number before swap a=$a,b=$b");

  a = a+b;
  b = a-b;
  a = a-b;

  print("\n Number After swap a=$a,b=$b");
}