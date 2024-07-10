import 'dart:io';

void main()
{
  print("Enter Number:");
  int no = int.parse(stdin.readLineSync().toString());

  if(no>0)
  {
    print("$no is Positive Number");
  }
  else
  {
    print("$no is Negative Number");
  }
}