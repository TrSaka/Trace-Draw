import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';

class CameraService {
  static CameraService? _instance;

  factory CameraService() {
    return _instance ?? CameraService._();
  }

  CameraService._();

  static late CameraController cameraController;

  Future getPermission() async {
    await Permission.camera.request();
    if (await Permission.camera.request().isGranted) {
      final cameras = await availableCameras();
      return cameras;
    } else {
      //permission has not been granted
      return null;
    }
  }

  Future<void> initalizeCamera() async {
    final cameras = await getPermission();
    if (cameras != null) {
      cameraController =
          CameraController(cameras[0], ResolutionPreset.medium); //selectable
      await cameraController.initialize();
    } else {
      debugPrint('Permission has not been given');
    }
  }

  Future<void> disposeCameraController() async {
    cameraController.value.isInitialized == true
        ? await cameraController.dispose()
        : null;
  }
}
