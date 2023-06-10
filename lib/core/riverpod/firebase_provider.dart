// ignore_for_file: unused_field

import 'package:easy_draw/core/services/database/cloud/cloud_firestore.dart';
import 'package:easy_draw/core/services/database/storage/storage_service.dart';
import 'package:easy_draw/models/premium_user_model.dart';
import 'package:easy_draw/models/version_model.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseNotifier extends ChangeNotifier {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final StorageService _service = StorageService.instance!;
  final CloudFireStoreService _firestore = CloudFireStoreService.instance!;

  Future? getImagesByFolderName(String folderName) async {
    return await _service.getImageByFolder(folderName);
  }

  Future<VersionNumber?> checkVersionControl() async {
    return await _firestore.checkVersion();
  }

  Future<PremiumUserModel?> checkPremiumUser(String? ipAddress) async {
    return await _firestore.checkPremium(ipAddress);
  }
}

final firebaseProvider = ChangeNotifierProvider<FirebaseNotifier>((ref) {
  return FirebaseNotifier();
});
