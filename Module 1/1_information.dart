import 'dart:io';

void main()
{
    print("Enter Your Name:");
    var name = stdin.readLineSync();

    print("Enter Your Birthdate:");
    var birthdate = stdin.readLineSync();

    print("Enter Your Age:");
    int age = int.parse(stdin.readLineSync().toString());

    print("Enter Address:");
    var address = stdin.readLineSync();

    print("\n");
    print("Name is $name");
    print("Birthdate is $birthdate");
    print("Age is $age");
    print("Address is $address");


}