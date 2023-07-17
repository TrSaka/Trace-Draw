// ignore_for_file: library_private_types_in_public_api
import 'package:easy_draw/core/product/route/router.dart';
import 'package:easy_draw/core/riverpod/android_provider.dart';
import 'package:easy_draw/core/riverpod/firebase_provider.dart';
import 'package:easy_draw/core/services/cache/locale_management.dart';
import 'package:easy_draw/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobx/mobx.dart';

import '../../route/nav_route.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  Future<bool?> checkVersionControl(WidgetRef ref) async {
    return await ref
        .watch(firebaseProvider)
        .checkVersionControl()
        .then((value) {
      return value?.state;
    });
  }

  Future initalizeCache() async {
    await LocalManagement.prefrencesInit();
  }

  Future<String?> getIpAdresses(WidgetRef ref) async {
    return await ref.read(andoirdProvider.notifier).getIpAdress();
  }

  Future checkPremiumUser(WidgetRef ref, String? value) async {
    return await ref.read(firebaseProvider.notifier).checkPremiumUser(value);
  }

  @observable
  OverlayEntry? popupEntry;
  @observable
  bool isPopupVisible = false;

  @action
  void hidePopup() {
    isPopupVisible = false;
    popupEntry?.remove();
    popupEntry = null;
  }

  @action
  void showPopup(BuildContext context) {
    isPopupVisible = true;
    popupEntry = createPopupEntry();
    Overlay.of(context).insert(popupEntry!);
  }

  OverlayEntry createPopupEntry() {
    return OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: ResponsiveFuncs.getHeight(context, 0.25)),
                  const Text(
                    'New Version Available',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: ResponsiveFuncs.getHeight(context, 0.3)),
                  const Text(
                    'There is a new version available for download! \n Please update the app by visiting Google Play Store :)',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @observable
  bool visibilityState = false;

  @action
  changeState() {
    visibilityState = !visibilityState;
  }

  routeToMenu(context) {
    NavRoute(HomeRoute(pageIndex: 0)).toPushReplecement(context);
  }
}
