class itemlist {
  final String image;
  final String name;
  final String category;
  final int price;
  final double rate;

  itemlist(
      {required this.image,
        required this.name,
        required this.price,
        required this.rate,
        required this.category});

  static List<itemlist> categoryList = [];
  static int finalTotal = 0;
}

List<itemlist> Menu = [
  itemlist(
    name: 'Margherita\nPizza',
    image: 'assets/dishes/img.png',
    price: 100,
    rate: 4.5,
    category: 'Full',
  ),
  itemlist(
    name: 'paneer-tikka\ntacos',
    image: 'assets/dishes/img_1.png',
    price: 79,
    rate: 4.5,
    category: 'Full',
  ),
  itemlist(
    name: 'Subway Club',
    image: 'assets/dishes/img_2.png',
    price: 80,
    rate: 4.3,
    category: 'Single',
  ),
  itemlist(
    name: 'Boston Cream\nDoughnut',
    image: 'assets/dishes/img_3.png',
    price: 120,
    rate: 4.7,
    category: 'Meal',
  ),
  itemlist(
    name: 'Jini Roll\nDosa',
    image: 'assets/dishes/img_4.png',
    price: 130,
    rate: 4.4,
    category: 'Full',
  ),
  itemlist(
    name: 'Momos',
    image: 'assets/dishes/img_5.png',
    price: 90,
    rate: 4.6,
    category: 'Full',
  ),
  itemlist(
    name: 'Mexican\n Sizzler',
    image: 'assets/dishes/img_6.png',
    price: 150,
    rate: 4.8,
    category: 'Full',
  ),
  itemlist(
    name: 'Muffaletta \nburger',
    image: 'assets/dishes/img_7.png',
    price: 150,
    rate: 4.8,
    category: 'Full',
  ),
  itemlist(
    name: 'kitkat shake',
    image: 'assets/dishes/img_8.png',
    price: 150,
    rate: 4.8,
    category: 'Full',
  ),
  itemlist(
    name: 'Cheese Burger',
    image: 'assets/dishes/img_9.png',
    price: 150,
    rate: 4.8,
    category: 'Full',
  ),
];