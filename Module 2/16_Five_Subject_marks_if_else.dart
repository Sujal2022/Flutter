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

  if(per>75)
  {
      print("$per is Distinction");
  }
  else if(per>60 && per<=75)
  {
      print("$per is First class");
  }
  else if(per>50 && per<=60)
  {
      print("$per is Second class");
  }
  else if(per>35 && per<=50)
  {
      print("$per is Pass class");
  }
  else
  {
      print("$per is Fail");
  }
}