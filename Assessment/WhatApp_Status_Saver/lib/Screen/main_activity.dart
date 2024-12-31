import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatapp_status_saver/Screen/BottomNavigatePages/images/images.dart';
import 'package:whatapp_status_saver/Screen/BottomNavigatePages/video/video.dart';
import '../Provider/botton_nav_provider.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  final List<Widget> pages = [
    ImageHomePage(),
    VideoHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<BottonNavProvider>(
      builder: (context, nav, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Status Saver',
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 4,
            shadowColor: Colors.deepPurpleAccent.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
            titleTextStyle: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.w600,
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.deepPurple.shade50,
                  Colors.deepPurple.shade100,
                ],
                center: Alignment(0.0, -0.5),
                radius: 1.5,
              ),
            ),
            child: pages[nav.currentIndex],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: BottomNavigationBar(
                onTap: (value) {
                  nav.changeIndex(value);
                },
                currentIndex: nav.currentIndex,
                selectedItemColor: Colors.deepPurpleAccent,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.image_outlined),
                    label: "Images",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.video_library_outlined),
                    label: "Videos",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
