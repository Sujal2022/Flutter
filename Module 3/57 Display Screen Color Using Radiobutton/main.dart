import 'package:flutter/material.dart';

void main()
{
    runApp(MaterialApp(home: Colorscreenselect(),debugShowCheckedModeBanner: false,));
}

class Colorscreenselect extends StatefulWidget {
  const Colorscreenselect({super.key});

  @override
  State<Colorscreenselect> createState() => _ColorscreenselectState();
}
enum ScreenColor { red, green, blue, yellow, pink, lime}

class _ColorscreenselectState extends State<Colorscreenselect>
{
    ScreenColor selectedColor = ScreenColor.red;

    Color getColor(ScreenColor color) {
        switch (color) {
            case ScreenColor.red:
                return Colors.red;
            case ScreenColor.green:
                return Colors.green;
            case ScreenColor.blue:
                return Colors.blue;
            case ScreenColor.yellow:
                return Colors.yellow;
            case ScreenColor.pink:
                return Colors.pink;
            case ScreenColor.lime:
                return Colors.lime;
            default:
                return Colors.white;
        }
    }


    @override
  Widget build(BuildContext context) {
    return Scaffold
        (
        appBar: AppBar(
            title: Text('Select Screen Color'),
            centerTitle: true,
            backgroundColor: getColor(selectedColor), // Set AppBar color
        ),

        body: Container(
            color: getColor(selectedColor),
            child: Column(

               children: [

                   RadioListTile<ScreenColor>(
                       title: const Text('Red'),
                       value: ScreenColor.red,
                       groupValue: selectedColor,
                       onChanged: (ScreenColor? value) {
                           setState(() {
                               selectedColor = value!;
                           });
                       },
                   ),
                   RadioListTile<ScreenColor>(
                       title: const Text('Green'),
                       value: ScreenColor.green,
                       groupValue: selectedColor,
                       onChanged: (ScreenColor? value) {
                           setState(() {
                               selectedColor = value!;
                           });
                       },
                   ),
                   RadioListTile<ScreenColor>(
                       title: const Text('Blue'),
                       value: ScreenColor.blue,
                       groupValue: selectedColor,
                       onChanged: (ScreenColor? value) {
                           setState(() {
                               selectedColor = value!;
                           });
                       },
                   ),
                   RadioListTile<ScreenColor>(
                       title: const Text('Yellow'),
                       value: ScreenColor.yellow,
                       groupValue: selectedColor,
                       onChanged: (ScreenColor? value) {
                           setState(() {
                               selectedColor = value!;
                           });
                       },
                   ),
                    RadioListTile<ScreenColor>(
                       title: const Text('Pink'),
                       value: ScreenColor.pink,
                       groupValue: selectedColor,
                       onChanged: (ScreenColor? value) {
                           setState(() {
                               selectedColor = value!;
                           });
                       },
                   ),

                   RadioListTile<ScreenColor>(
                       title: const Text('Lime'),
                       value: ScreenColor.lime,
                       groupValue: selectedColor,
                       onChanged: (ScreenColor? value) {
                           setState(() {
                               selectedColor = value!;
                           });
                       },
                   ),
               ],
            ),


        ),
        );
  }
}
