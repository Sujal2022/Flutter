import 'dart:io';

void main()
{
  print("Enter C marks:");
  double c = double.parse(stdin.readLineSync().toString());

  print("Enter HTML marks:");
  double html = double.parse(stdin.readLineSync().toString());

  print("Enter Java marks:");
  double java = double.parse(stdin.readLineSync().toString());

  print("Enter php marks:");
  double php = double.parse(stdin.readLineSync().toString());

  print("Enter C++ marks:");
  double c1 = double.parse(stdin.readLineSync().toString());

  var ans = c+html+java+php+c1;
  var per = ans~/5;

  print("Total of five subject Marks is $ans");
  print("Total of five subject Percentage is $per");
}