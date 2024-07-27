import 'dart:io';

void main()
{
  int no1,no2,no3,num;
  no1 = 0;
  no2 = 1;
  
  print("Enter the Fibonacci number: ");
  num = int.parse(stdin.readLineSync().toString());
  
  print("$no1 \n$no2");

  for(int i=2;i<num;i++)
  {
    no3=no1+no2;
    print("$no3");
    no1=no2;
    no2=no3;
  }


}