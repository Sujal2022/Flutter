import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'items.dart';

itemListWidgets()
{
  var total = 0;
  return GridView.builder(

    itemCount: Menu.length,
    padding: EdgeInsets.only(top: 10),
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 0.65,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      crossAxisCount: 2,
    ),
      itemBuilder: (BuildContext context, int index)
      {
        final dish = Menu;
        return Card
          (
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
            child: Padding
              (
                  padding: EdgeInsets.all(8.0),
              child: Column
                (
                  crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        dish[index].image, // Replace with your asset path
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(dish[index].name,
                          maxLines: 3,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                      SizedBox(width: 10),
                      Spacer(),
                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          '${dish[index].rate}',
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: List.generate(
                      5,
                          (starIndex) => Icon(
                        starIndex <  dish[index].rate
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.orange,
                        size: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      Text(
                        '₹${dish[index].price}',
                        style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),

                      Container(

                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: GestureDetector(

                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: "${Menu[index].name} add",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            if (itemlist.categoryList.isEmpty) {
                              itemlist.finalTotal = 0;
                            }
                            itemlist.categoryList.add(Menu[index]);

                            total = itemlist.finalTotal;
                            total = Menu[index].price + total;
                            print("final total : $index :$total");
                            itemlist.finalTotal = total;

                           // setState(() {});
                          },
                        ),
                      ),



                    ],
                  ),



                ],
                ),
              )
          );
      }

  );
}