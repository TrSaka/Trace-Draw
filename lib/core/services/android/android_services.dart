import 'package:easy_draw/core/services/android/base_android_servide.dart';
import 'package:flutter/material.dart';

class AndroidService extends BaseAndroidServices {
  static AndroidService? _instance;
  static AndroidService? get instance {
    _instance ??= AndroidService._init();
    return _instance;
  }

  AndroidService._init();

  @override
  Future<String?> getDeviceIpAddress() async {
    try {
      String ip = await platform.invokeMethod('getIpAddress');
      return ip;
    } catch (e) {
      debugPrint('ERR$e');
      return null;
    }
  }
}
