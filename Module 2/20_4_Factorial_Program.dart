import 'dart:io';

void main()
{
  int fact=1,i=1;
  print("Enter Number:");
  int num = int.parse(stdin.readLineSync().toString());

  while(i<=num)
  {
    fact = fact*i;
    i++;
  }
    print("Factorial is $fact");

}