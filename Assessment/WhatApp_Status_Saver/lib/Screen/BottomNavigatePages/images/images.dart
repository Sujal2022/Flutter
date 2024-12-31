import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatapp_status_saver/Provider/getStatusProvider.dart';
import 'package:whatapp_status_saver/Screen/BottomNavigatePages/images/image_view.dart';

class ImageHomePage extends StatefulWidget {
  const ImageHomePage({super.key});

  @override
  State<ImageHomePage> createState() => _ImageHomePageState();
}

class _ImageHomePageState extends State<ImageHomePage> {
  bool _isFetched = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<Getstatusprovider>(
        builder: (context, file, child) {
          if (_isFetched == false) {
            file.getStatus(".jpg");
            Future.delayed(Duration(milliseconds: 1), () {
              _isFetched = true;
            });
          }

          return file.isWhatappsAvailabe == false
              ? Center(
            child: Text(
              "WhatsApp Not Available",
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
            ),
          )
              : file.getImages.isEmpty
              ? Center(
            child: Text(
              "No Image Available",
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
            ),
          )
              : Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.02,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: size.width * 0.03,
                mainAxisSpacing: size.height * 0.02,
                childAspectRatio: 0.8,
              ),
              itemCount: file.getImages.length,
              itemBuilder: (context, index) {
                final data = file.getImages[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ImageView(
                          imagePath: data.path,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(2, 2),
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(data.path)),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
