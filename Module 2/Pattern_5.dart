import 'dart:io';

void main()
{
  for(int i=1;i<=5;i++)
  {
    for(int j=4;j>=i;j--)
    {
      stdout.write(" ");
    }
    for(int k=i;k>=1;k--)
    {
      stdout.write("$k");
    }
    print(" ");
  }


}