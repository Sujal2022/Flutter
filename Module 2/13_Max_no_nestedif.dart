import 'dart:io';

void main()
{
  print("Enter no1:");
  int no1 = int.parse(stdin.readLineSync().toString());

  print("Enter no2:");
  int no2 = int.parse(stdin.readLineSync().toString());

  print("Enter no3:");
  int no3 = int.parse(stdin.readLineSync().toString());

  if(no1>no2) {
    if (no1 > no3) {
      print("$no1 is Maximum Number");
    }
    else {
      print("$no3 is Maximum Number");
    }
  }
   else
   {
     if(no2>no3)
     {
       print("$no2 is Maximum Number");
     }
     else
     {
       print("$no3 is Maximum Number");
     }
   }
}