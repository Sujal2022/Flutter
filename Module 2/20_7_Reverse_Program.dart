import 'dart:io';

void main()
{
  print("Enter Number For Reverse:");
  int num = int.parse(stdin.readLineSync().toString());

  while(num!=0)
  {
    int d = num%10;
    print("$d");
    num=num~/10;
  }
}