import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';

class CameraService {


  Future getPermission() async {
    await Permission.camera.request();
    if (await Permission.camera.request().isGranted == true) {
      final cameras = await availableCameras();
      return cameras;
    } else {
      //permission has not been granted
      return null;
    }
  }

  Future? initalizeCamera(cameraController) async {
    final cameras = await getPermission();
    if (cameras != null) {
      cameraController =
          CameraController(cameras[0], ResolutionPreset.medium); //selectable
      await cameraController.initialize();
      return cameraController;
    } else {
      debugPrint('Permission has not been given');
      return null;
    }
  }

  Future<void> disposeCameraController(
      CameraController? cameraController) async {
    cameraController?.value.isInitialized == true ||
            cameraController?.value != null
        ? await cameraController!.dispose()
        : null;
  }
}
