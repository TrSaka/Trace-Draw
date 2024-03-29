import 'package:easy_draw/core/constants/enum/setting_enums.dart';
import 'package:easy_draw/core/services/cache/locale_management.dart';
import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobProvider extends ChangeNotifier {
  bool adMobBannerState = false;
  BannerAd? staticAds;

  showBanner() {
    bool? premiumState =
        LocalManagement.instance.fetchBoolean(SettingsEnum.AD_PREMIUM);

    if (premiumState != true) {
      staticAds = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-3940256099942544/6300978111',
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            if (ad.responseInfo?.responseId != null) {
              setBannerState(true);
            }
          },
          onAdFailedToLoad: (ad, error) {
            adMobBannerState = false;

            ad.dispose();
            setBannerState(false);
            debugPrint("ERRR$error");
          },
        ),
      );
      return staticAds!.load();
    } else {
      debugPrint("No Ad | PREMIUM");
    }
  }

  setBannerState(bool value) {
    adMobBannerState = value;
    notifyListeners();
  }
}
