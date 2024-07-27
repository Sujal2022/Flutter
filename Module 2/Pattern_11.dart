import 'dart:io';

void main()
{
  for(int i=0;i<=5;i++)
   {
     for(int j=0;j<=i;j++)
     {
       stdout.write((i % 2 == 0 ? j % 2 : (j + 1) % 2).toString() + ' ');
     }
     print(" ");
   }
}