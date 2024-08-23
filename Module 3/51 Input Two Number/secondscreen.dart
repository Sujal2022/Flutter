
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Numberrange extends StatelessWidget
{
  final int start;
  final int end;

  Numberrange({required this.start,required this.end});


  @override
  Widget build(BuildContext context)
  {
    List<int> number = [];
    for(int i=start+1 ;i<end; i++)
      {
       number.add(i);
      }

    return  Scaffold(

      appBar: AppBar(
        title: Text('Numbers Between $start and $end',style: TextStyle(color: CupertinoColors.white),),backgroundColor: Colors.green,automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: number.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(number[index].toString()),
                  );
                },
              ),
            ),

            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),

    );
  }
}
