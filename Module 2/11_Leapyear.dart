import 'dart:io';

void main()
{
  print("Enter year to check whether leap year or not:");
  int year = int.parse(stdin.readLineSync().toString());

  if(year%4 == 0)
  {
    print("$year is Leap Year");
  }
  else
   {
     print("$year is Not Leap Year");
   }
}