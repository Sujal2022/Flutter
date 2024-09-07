import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';




class RestaurantScreen extends StatefulWidget
{
  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen>
{
  final pageController = PageController();
  int _selectedCategoryIndex = 0;

  final List<String> categories = [
    'Recommend',
    'Popular',
    'Noodles',
    'Pizza',
  ];

  final List<Map<String, String>> dishes = [
    {
      'name': 'Soba Soup',
      'sales':'No.1 in sales',
      'image': 'assets/dish1.png',
      'price': '\$12',
    },
    {
      'name': 'Sei Ua Samun Phrai',
      'sales':'No.1 in sales',
      'image': 'assets/dish2.png',
      'price': '\$12',
    },
    {
      'name': 'Ratatouille Pasta',
      'sales':'No.1 in sales',
      'image': 'assets/dish3.png',
      'price': '\$12',
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold
      (
      appBar:AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                // Handle back button action here
              },
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              child: IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  // Handle search action here
                },
              ),
            ),
          ),
        ],
      ),

      body:  Padding
        (
        padding: EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Row(
              children: [
                Expanded
                  (child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Restaurant",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),

                    SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text("20-30min",style: TextStyle(color: Colors.grey),),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),

                          child: Text("2.4km",style: TextStyle(color: Colors.grey),),
                        ),
                        SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Text("Restaurant",style: TextStyle(color: Colors.grey),),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Orange Sandwiches is delicious",
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),

                  ],
                ),
                ),

                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset("assets/res_logo.png",),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 4),
                        Text("4.7"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(height: 16),
            Container(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: _selectedCategoryIndex == index
                            ? Colors.orange
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: _selectedCategoryIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: dishes.length,
                itemBuilder: (context, index)
                {

                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            dishes[index]['image']!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dishes[index]['name']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                dishes[index]['sales']!,
                                style: TextStyle(color: Colors.grey,fontSize: 14),

                              ),
                              SizedBox(height: 4,),
                              Text(
                                dishes[index]['price']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.grey),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              height: 60,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 4,
                effect: CustomizableEffect(
                  dotDecoration: DotDecoration(
                    width: 8,
                    height: 8,
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  activeDotDecoration: DotDecoration(
                    width: 10,
                    height: 10,
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    dotBorder: DotBorder(
                      color: Colors.yellow,
                      padding: 2,
                      width: 3,
                    ),
                  ),
                ),
              ),
            )

          ],
        ),


      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle cart action here
        },
        backgroundColor: Colors.amber,
        child: Icon(Icons.shopping_bag),
      ),


    );
  }
}







