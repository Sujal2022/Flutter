void main()
{
  Set<dynamic> set = Set();
  Set<dynamic> set2 = Set();

  set.add(10);
  set.add(20);
  set.add(30);
  set.add(40);

  set2.add(10);
  set2.add(20);
  set2.add(3);
  set2.add(4);

  set.addAll(set2);

  print(set);

}