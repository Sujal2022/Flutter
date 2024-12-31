import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:whatapp_status_saver/Contants/constant.dart';

class Getstatusprovider extends ChangeNotifier
{
  List<FileSystemEntity> _getImages = [];
  List<FileSystemEntity> _getVideo = [];

  bool _isWhatappsAvailable = false;

  List<FileSystemEntity> get getImages => _getImages;
  List<FileSystemEntity> get getVideo => _getVideo;

  bool get isWhatappsAvailabe => _isWhatappsAvailable;

 /* void getStatus(String ext) async {
    log("Requesting storage permission...");
    final status = await Permission.storage.request();

    if (status.isDenied) {
      log("Permission Denied");
      openAppSettings(); // Redirect to app settings if permission denied
      return;
    }

    if (status.isGranted) {
      log("Permission Granted");
      final directory = Directory(AppConstants.WHATSAPP_PATH);

      if (directory.existsSync()) {
        final items = directory.listSync();

        if(ext == ".mp4")
          {
            _getVideo = items.where((element) => element.path.endsWith(".mp4")).toList();
            notifyListeners();
          }
        else
          {
            _getImages = items.where((element) => element.path.endsWith(".jpg")).toList();
            notifyListeners();
          }

        _isWhatappsAvailable = true;
        notifyListeners();

        log("Statuses Found: ${items.length}");
      } else {
        log("No WhatsApp Found");
        _isWhatappsAvailable = false;
        notifyListeners();
      }
    }
  }*/
  /*void getStatus(String ext) async {
    log("Requesting storage permission...");
    await Permission.storage.request();

    List<String> paths = [
      "/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses/",
      "/storage/emulated/0/WhatsApp/Media/.Statuses/",
      "/storage/emulated/0/Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses/"
    ];

    bool directoryFound = false;

    for (String path in paths) {
      final directory = Directory(path);

      if (directory.existsSync()) {
        log("Found WhatsApp Status directory: $path");
        directoryFound = true;

        try {
          final items = directory.listSync();

          if (ext == ".mp4") {
            _getVideo = items.where((element) => element.path.endsWith(".mp4")).toList();
          } else {
            _getImages = items.where((element) =>
            element.path.endsWith(".jpg") ||
                element.path.endsWith(".jpeg") ||
                element.path.endsWith(".png")).toList();
          }

          _isWhatappsAvailable = true;
          notifyListeners();
          log("Statuses Found: ${items.length}");
        } catch (e) {
          log("Error accessing files: $e");
        }
        break;
      }
    }

    if (!directoryFound) {
      log("No WhatsApp directory found.");
      _isWhatappsAvailable = false;
      notifyListeners();
    }
  }
*/
  void getStatus(String ext) async {
    log("Requesting storage permission...");
    if (await Permission.storage.request().isGranted ||
        (Platform.isAndroid &&
            await Permission.manageExternalStorage.request().isGranted)) {
      log("Permission granted!");

      List<String> paths = [
        "/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses/",
        "/storage/emulated/0/WhatsApp/Media/.Statuses/",
        "/storage/emulated/0/Android/media/com.whatsapp.w4b/WhatsApp Business/Media/.Statuses/"
      ];

      bool directoryFound = false;

      for (String path in paths) {
        final directory = Directory(path);

        if (directory.existsSync()) {
          log("Found WhatsApp Status directory: $path");
          directoryFound = true;

          try {
            final items = directory.listSync();
            log("Files in directory: ${items.map((e) => e.path).toList()}");

            if (ext == ".mp4") {
              _getVideo = items.where((element) => element.path.endsWith(".mp4")).toList();
            } else {
              _getImages = items.where((element) =>
              element.path.endsWith(".jpg") ||
                  element.path.endsWith(".jpeg") ||
                  element.path.endsWith(".png")).toList();
            }

            _isWhatappsAvailable = true;
            notifyListeners();

            log("Images Found: ${_getImages.length}, Videos Found: ${_getVideo.length}");
          } catch (e) {
            log("Error accessing files: $e");
          }
          break;
        }
      }

      if (!directoryFound) {
        log("No WhatsApp directory found.");
        _isWhatappsAvailable = false;
        notifyListeners();
      }
    } else {
      log("Storage permission denied.");
    }
  }

}
