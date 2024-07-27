import 'dart:io';

void main()
{
  print("Enter no1:");
  double no1 = double.parse(stdin.readLineSync().toString());

  print("Enter no2:");
  double no2 = double.parse(stdin.readLineSync().toString());

  print("Enter which Arithmatic Operator You have to Do \n 1.Add \n 2.Sub \n 3.Mul \n 4.Div \n Number: ");
  double no = double.parse(stdin.readLineSync().toString());

  switch(no)
  {
    case 1: double add = no1+no2;
            print("Addition is $add");

    case 2: double sub = no1-no2;
            print("Subtraction is $sub");

    case 3: double mul = no1*no2;
            print("Multiplication is $mul");

    case 4: double div = no1/no2;
            print("Division is $div");

    default: print("Invalid Please Enter from 1-4");
  }

}