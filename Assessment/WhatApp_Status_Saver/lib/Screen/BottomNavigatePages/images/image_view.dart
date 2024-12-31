import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_api/flutter_native_api.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImageView extends StatefulWidget {
  final String? imagePath;
  const ImageView({super.key, this.imagePath});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: InteractiveViewer(
              minScale: 1.0,
              maxScale: 4.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: FileImage(File(widget.imagePath!)),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.05,
            left: size.width * 0.02,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: size.width * 0.08),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurpleAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.download_sharp),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.print_sharp),
            label: 'Print',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share_sharp),
            label: 'Share',
          ),
        ],
        onTap: (index) async {
          switch (index) {
            case 0:
              print("Download Image");
              ImageGallerySaver.saveFile(widget.imagePath!).then((value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Image Saved")),
                );
              });

              try {
                File file = File(widget.imagePath!);
                String fileName = widget.imagePath!.split("/").last;

                // Create a reference in Firebase Storage
                final storageRef = FirebaseStorage.instance.ref().child('images/$fileName');

                // Upload the file
                final uploadTask = storageRef.putFile(file);

                // Monitor progress or handle completion
                uploadTask.snapshotEvents.listen((event) {
                  if (event.state == TaskState.success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Image Uploaded to Firebase")),
                    );
                  }
                });
              } catch (e) {
                print("Error uploading image: $e");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Failed to upload image")),
                );
              }
              break;
            case 1:
              print("Print Image");
              FlutterNativeApi.printImage(
                  widget.imagePath!, widget.imagePath!.split("/").last);
              break;
            case 2:
              print("Share Image");
              FlutterNativeApi.shareImage(widget.imagePath!);
              break;
          }
        },
      ),
    );
  }
}
