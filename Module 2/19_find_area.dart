import 'dart:io';

void main()
{
  print("Select to calculate area \n 1.Triangle \n 2.Rectangle \n 3.Circle \nEnter Your Choice:");
  int choice = int.parse(stdin.readLineSync().toString());

  if(choice == 1)
  {
      print("Enter Base of the Triangle:");
      double base = double.parse(stdin.readLineSync().toString());

      print("Enter Height of the Triangle:");
      double height = double.parse(stdin.readLineSync().toString());

      double area = 0.5*base*height;
      print("Area of triangle is $area");

  }
  else if(choice == 2)
  {
    print("Enter Length of the Rectangle:");
    double length = double.parse(stdin.readLineSync().toString());

    print("Enter Width of the Rectangle:");
    double width = double.parse(stdin.readLineSync().toString());

    double area1 = length*width;
    print("Area of Rectangle is $area1");

  }
  else if(choice == 3)
  {
    print("Enter r value:");
    double r = double.parse(stdin.readLineSync().toString());

    double area = 3.14*r*r;

    print("Area of circle is $area");
  }
  else
  {
      print("Invalid Please Enter from 1-3 ");
  }
}