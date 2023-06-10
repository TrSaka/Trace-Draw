// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';
import 'package:easy_draw/core/constants/app/app_constants.dart';
import 'package:easy_draw/core/constants/enum/setting_enums.dart';
import 'package:easy_draw/core/services/cache/locale_management.dart';
import 'package:easy_draw/core/services/database/cloud/base_cloud_service.dart';
import 'package:easy_draw/models/premium_user_model.dart';
import 'package:easy_draw/models/version_model.dart';

class CloudFireStoreService extends BaseCloudService {
  static CloudFireStoreService? _instance;
  static CloudFireStoreService? get instance {
    _instance ??= CloudFireStoreService._init();
    return _instance;
  }

  CloudFireStoreService._init();

  @override
  Future<VersionNumber?> checkVersion() async {
    try {
      final pubspecYaml = await rootBundle.loadString('pubspec.yaml');
      final yamlMap = loadYaml(pubspecYaml);

      String version = yamlMap['version'].toString().replaceAll('+', '');

      List<String> versionParts =
          version.split('.'); // Sürüm numarasını parçalara ayırın

      var data = await firestore
          .collection(AppConstants.firebaseApplication)
          .doc(AppConstants.firebaseVersion)
          .get();

      String newVersion = data[AppConstants.latestVersion];
      List<String> newVersionParts =
          newVersion.split('.'); // Yeni sürüm numarasını parçalara ayırın

      for (int i = 0; i < versionParts.length; i++) {
        int currentVersionPart = int.parse(versionParts[i]);
        int newVersionPart = int.parse(newVersionParts[i]);

        if (currentVersionPart < newVersionPart) {
          // Güncelleme gereklidir.
          return VersionNumber(
              oldVersion: version, newVersion: newVersion, state: true);
        } else if (currentVersionPart > newVersionPart) {
          // Güncelleme gerekli değil
          return VersionNumber(
              oldVersion: version, newVersion: newVersion, state: false);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<PremiumUserModel?> checkPremium(String? ipAddress) async {
    if (ipAddress != null) {
      var data = await firestore
          .collection(AppConstants.firebaseApplication)
          .doc(AppConstants.firebasePremium)
          .get();

      if (data.data() != null && data.data()!.containsKey(ipAddress) == true) {
        await LocalManagement.instance.deleteBoolean(SettingsEnum.AD_PREMIUM);

        LocalManagement.instance.cacheBoolean(SettingsEnum.AD_PREMIUM, true);
        debugPrint("USER PREMIUM ACCESS");
        return PremiumUserModel(
            deviceIP: ipAddress.toString(), adPremium: true);
      } else {
        debugPrint("USER DEFAULT ACCESS");
        await LocalManagement.instance.deleteBoolean(SettingsEnum.AD_PREMIUM);
        LocalManagement.instance.cacheBoolean(SettingsEnum.AD_PREMIUM, false);
        return PremiumUserModel(
            deviceIP: ipAddress.toString(), adPremium: false);
      }
    } else {
      debugPrint("USER DEFAULT ACCESS");
      await LocalManagement.instance.deleteBoolean(SettingsEnum.AD_PREMIUM);

      LocalManagement.instance.cacheBoolean(SettingsEnum.AD_PREMIUM, false);
      return PremiumUserModel(deviceIP: ipAddress.toString(), adPremium: false);
    }
  }

  @override
  Future saveUserIP(String? ipAddress) async {
    if (ipAddress != null) {
      return await firestore
          .collection(AppConstants.firebaseApplication)
          .doc(AppConstants.firebasePremium)
          .set({ipAddress: '$ipAddress'});
      
    } else {
      debugPrint("Ip Address ERR:");
    }
  }
}
