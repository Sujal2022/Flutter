import 'dart:io';

void main()
{
    print("Enter centigrade value:");
    double c = double.parse(stdin.readLineSync().toString());

    var fahrenheit = (c * 9/5) + 32;

    print("Ans is $fahrenheit");
}