import 'dart:io';
import 'dart:math';
import 'package:chewie/chewie.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_api/flutter_native_api.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final String? videoPath;
  const VideoView({super.key, this.videoPath});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();

    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.file(
        File(widget.videoPath!),
      ),
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      aspectRatio: 5 / 6,
      errorBuilder: ((context, errorMessage) {
        return Center(
          child: Text(errorMessage),
        );
      }),
    );
  }

  @override
  void dispose() {
    _chewieController!.pause();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Chewie(controller: _chewieController!),
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
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.deepPurpleAccent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.download_sharp),
              label: 'Download',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share_sharp),
              label: 'Share',
            ),
          ],
          onTap: (index) async {
            switch (index) {
              case 0:
                try {
                print("Download Video");
                ImageGallerySaver.saveFile(widget.videoPath!).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Video Saved")),
                  );
                });

                  File file = File(widget.videoPath!);
                  String fileName = widget.videoPath!.split("/").last;

                  // Create a reference in Firebase Storage
                  final storageRef = FirebaseStorage.instance.ref().child('video/$fileName');

                  // Upload the file
                  final uploadTask = storageRef.putFile(file);

                  // Monitor progress or handle completion
                  uploadTask.snapshotEvents.listen((event) {
                    if (event.state == TaskState.success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Video Uploaded to Firebase")),
                      );
                    }
                  });
                } catch (e) {
                  print("Error uploading video: $e");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to upload video")),
                  );
                }
                break;
              case 1:
                print("Share Video");
                FlutterNativeApi.shareImage(widget.videoPath!);
                break;
            }
          },
        ),
      ),
    );
  }
}
