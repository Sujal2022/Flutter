import 'dart:io';

void main()
{
  print("Enter no1:");
  int no1 = int.parse(stdin.readLineSync().toString());

  print("Enter no2:");
  int no2 = int.parse(stdin.readLineSync().toString());

  print("Enter no3:");
  int no3 = int.parse(stdin.readLineSync().toString());

  var larg = (no1>no2)?((no1>no3)?no1:no3):((no2>no3)?no2:no3);

  print("Max Number is :$larg");

}