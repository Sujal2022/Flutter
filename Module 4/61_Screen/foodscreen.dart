import 'package:flutter/material.dart';
import 'package:module_4_assignment/61_Screen/widgets/itemListWidgets.dart';

class Foodscreen extends StatefulWidget {
  const Foodscreen({super.key});

  @override
  State<Foodscreen> createState() => _FoodscreenState();
}

class _FoodscreenState extends State<Foodscreen>
{
  List franchise  =
  [
    "Domino's Pizza",
    "Pizza Hut",
    "Subway",
    "Burger King",
    "McDonald's",
    "Dunkin’s Donuts",
    " Wow! Momo",
    "Sankalp",
    "Saraza",
  ];

  List Fooditem =[
    "All",
    "Pizza",
    "Taco",
    "Subs",
    "Burger",
    "Donuts",
    "Momo",
    "Dosa",
    "Shake",
    "Sizzler"
  ];

  int franchiseIndex = 0;
  int FoodItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        actions: [
          Icon(Icons.search,color: Colors.grey,),
          SizedBox(width: 10,),
          Icon(Icons.filter_alt)
        ],
      ),

      body: SingleChildScrollView
        (

        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),

          child: Column(

            children: [

              franchiseWidget(),
              const SizedBox(height: 0,),
              fooditemWidgets(),
              SizedBox(height: 10,),
              itemListWidgets(),


            ],
          ),
        ),


      ),
    );
  }

  franchiseWidget()
  {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          itemCount: franchise.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                franchiseIndex = index;
                setState(() {});
              },
              splashColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: franchiseIndex == index
                        ? Colors.orangeAccent
                        : Colors.black12),
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: Center(
                  child: Text(
                    franchise[index],
                    style: TextStyle(
                        fontSize: franchiseIndex == index ? 18 : 16,
                        fontWeight: franchiseIndex == index
                            ? FontWeight.bold
                            : FontWeight.w500),
                  ),
                ),
              ),
            );
          }),
    );

  }

  fooditemWidgets()
  {
    return SizedBox(
      height: 40,
      // padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          itemCount: Fooditem.length,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                FoodItemIndex = index;
                setState(() {});
              },
              splashColor: Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 0, bottom: 0),
                  child: Text(
                    Fooditem[index],
                    style: TextStyle(
                        color: FoodItemIndex == index
                            ? Colors.black
                            : Colors.black54,
                        fontSize: FoodItemIndex == index ? 18 : 14,
                        fontWeight: FoodItemIndex == index
                            ? FontWeight.bold
                            : FontWeight.w500),
                  ),
                ),
              ),
            );
          }),
    );
  }
}


