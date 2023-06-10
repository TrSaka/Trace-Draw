import 'package:easy_draw/core/services/base_firestore_service.dart';

abstract class BaseStorageService  extends BaseFireStoreService{
  Future? getImageByFolder(String folderName);
}
