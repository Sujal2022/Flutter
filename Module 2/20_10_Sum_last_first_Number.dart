import 'dart:io';

void main()
{
  double first, last, sum;

  print("Enter a number: ");
  double num = double.parse(stdin.readLineSync().toString());

  last = num % 10;

  while (num >= 10) {
    num /= 10;
  }
  first = num;

  sum = first + last;
  
  print("Sum of first and last digit:$sum");
}