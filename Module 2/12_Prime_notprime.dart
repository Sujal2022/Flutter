import 'dart:io';

void main()
{
  int i=1,count=0;
  print("Enter Number:");
  int num = int.parse(stdin.readLineSync().toString());

  while(i<=num)
    {
      if(num%i==0)
        {
          count++;
        }
      i++;
    }

    if(count>2)
      {
        print("$num is a prime number");
      }
    else
      {
        print("$num is not prime number");
      }
}