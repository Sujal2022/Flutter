import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:module_4_assignment/61_Screen/widgets/items.dart';



class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartpageState();
}

class _CartpageState extends State<CartScreen> {
  List finalList = [];
  late var lastPrice;
  int selectQty = 1;
  bool isButtonVisible = true; // To track button visibility


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    finalList = itemlist.categoryList;
    lastPrice = itemlist.finalTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              Text("Cart",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: finalList.isEmpty
                    ? Center(
                  child: Text(
                    '',
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todaydate(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 10),
                      shrinkWrap: true,
                      itemCount: finalList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.only(
                              top: 0, bottom: 0, right: 10, left: 10),
                          // tileColor: Colors.orange,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              // "assets/food1.png",
                              finalList[index].image,
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                finalList[index].name,
                                maxLines: 2,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {},
                                  ),
                                  Text(selectQty.toString()),
                                  IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {}),
                                ],
                              )
                            ],
                          ),
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('₹ ${finalList[index].price}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                              SizedBox(height: 5),
                              InkWell(
                                onTap: () {
                                  lastPrice =
                                      lastPrice - finalList[index].price;
                                  finalList.removeAt(index);
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  child: Icon(Icons.remove,
                                      color: Colors.black, size: 20),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              finalList.isEmpty
                  ? SizedBox()
                  : SizedBox(
                child: Column(
                  children: [
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Row(children: [
                      Text(
                        "Total :",
                        style: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      Spacer(),
                      Text("₹ $lastPrice",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36))
                    ]),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 5,),

              Center(
                child: finalList.isNotEmpty
                    ? ElevatedButton(
                  onPressed: () {
                    // Show a SnackBar for a successful order
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Order Done"),
                        backgroundColor: Colors.black,
                        duration: Duration(seconds: 2),
                      ),
                    );

                    // Clear the final list and refresh the UI
                    finalList.clear();

                    // Hide the button after checkout is done
                    setState(() {
                      isButtonVisible = false; // Hide the button
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orangeAccent, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text("Check Out"), // Button label text
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Place an Order",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.orangeAccent, // Message color
                      ),
                    ),
                  ],
                ),
              )



            ],
          ),
        ),
      ),
    );

  }

  todaydate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now!);
    return formattedDate;
  }
}



