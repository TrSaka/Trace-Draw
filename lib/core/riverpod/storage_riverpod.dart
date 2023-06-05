
// ignore_for_file: unused_field

import 'package:easy_draw/core/services/database/storage/storage_firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StorageNotifier extends ChangeNotifier {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final StorageService _service = StorageService.instance!;

  Future? getImagesByFolderName(String folderName) async {
    return await _service.getImageByFolder(folderName);
  }
}

final storageProvider = ChangeNotifierProvider<StorageNotifier>((ref) {
  return StorageNotifier();
});
