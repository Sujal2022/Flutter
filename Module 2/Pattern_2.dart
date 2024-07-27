import 'dart:io';

void main()
{
  print("Enter Number:");
  int n = int.parse(stdin.readLineSync().toString());

  for (int i = 1; i <= n; i++)
  {
    for (int j = 1; j <= i; j++)
    {
      stdout.write("$j");
    }
    print(" ");
  }
}
