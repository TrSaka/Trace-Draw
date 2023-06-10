// ignore_for_file: prefer_const_constructors

import 'package:flutter/services.dart';

abstract class BaseAndroidServices {
  final platform = MethodChannel('com.drawapp.easy_draw.ip_address');

  Future<String?> getDeviceIpAddress();
}
