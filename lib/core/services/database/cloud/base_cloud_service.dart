import 'package:easy_draw/core/services/base_firestore_service.dart';

abstract class BaseCloudService extends BaseFireStoreService {
  Future checkVersion();

  Future checkPremium(String? ipAddress);

  saveUserIP(String? ipAddress);
}
