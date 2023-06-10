import 'package:easy_draw/core/services/android/android_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AndroidNotifier extends ChangeNotifier {
  final AndroidService _service = AndroidService.instance!;

  Future<String?> getIpAdress() async {
    return await _service.getDeviceIpAddress();
  }
}

final andoirdProvider = ChangeNotifierProvider<AndroidNotifier>((ref) {
  return AndroidNotifier();
});
