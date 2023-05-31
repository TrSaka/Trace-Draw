// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'package:easy_draw/core/constants/enum/setting_enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalManagement {
  LocalManagement._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static final LocalManagement _instance = LocalManagement._init();

  SharedPreferences? _preferences;
  static LocalManagement get instance => _instance;

  static Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> cacheBoolean(SettingsEnum key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  Future<void> fetchBoolean(SettingsEnum key) async {
      _preferences?.getBool(key.toString());
  }

  Future<void> deleteBoolean(SettingsEnum key) async {
    await _preferences!.remove(key.toString());
  }
}
