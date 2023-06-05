import 'package:easy_draw/core/services/database/storage/base_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageService extends BaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

    static StorageService? _instance;
  static StorageService? get instance {
    _instance ??= StorageService._init();
    return _instance;
  }

  StorageService._init();

  @override
  Future getImageByFolder(String folderName) async {
    List? imageURLs = [];
    try {
      var imagesRef = _storage.ref().child(folderName);
      var listResult = await imagesRef.listAll();

      for (var item in listResult.items) {
        var downloadURL = await item.getDownloadURL();
        imageURLs.add(downloadURL);
      }
    } catch (e) {
      debugPrint("Error has been occoured : check $e");
    }

    return imageURLs;
  }
}
