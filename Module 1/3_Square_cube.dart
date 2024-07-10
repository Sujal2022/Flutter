import 'dart:io';

void main()
{
    print("Enter number for Square and Cube:");
    int r = int.parse(stdin.readLineSync().toString());

    int sq = r*r;
    int cb = r*r*r;

    print("Square number is $sq");
    print("Cube number is $cb");


}