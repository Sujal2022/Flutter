import 'dart:io';

void main()
{
  int sum=0,m;
  print("Enter Number:");
  int num = int.parse(stdin.readLineSync().toString());

  while(num>0)
  {
    m=num%10;
    sum = sum+m;
    num = num~/10;
  }
    print("Sum is $sum");
}