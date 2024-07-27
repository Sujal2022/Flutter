import 'dart:io';

void main()
{
  print("Enter Day Which you Want to Display(1-7):");
  int num = int.parse(stdin.readLineSync().toString());

  switch(num)
  {
    case 1:print("Monday");
    case 2:print("Tuesday");
    case 3:print("Wednesday");
    case 4:print("Thursday");
    case 5:print("Friday");
    case 6:print("Saturday");
    case 7:print("Sunday");
    default : print("Invalid Please from 1-7");

  }

}