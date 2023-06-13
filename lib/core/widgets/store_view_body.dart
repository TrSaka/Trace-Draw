import 'package:easy_draw/core/base/view/base_view.dart';
import 'package:easy_draw/core/constants/app/app_constants.dart';
import 'package:easy_draw/core/constants/enum/setting_enums.dart';
import 'package:easy_draw/core/product/view_model/store/store_view_model.dart';
import 'package:easy_draw/core/services/cache/locale_management.dart';
import 'package:easy_draw/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../product/route/nav_route.dart';
import '../product/route/router.dart';
import '../riverpod/firebase_provider.dart';
import 'loader.dart';

class StoreBody extends ConsumerStatefulWidget {
  const StoreBody(this.category, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoreBodyState();
  final String? category;
}

class _StoreBodyState extends ConsumerState<StoreBody> {
  bool _isInterstitialAdReady = false;
  InterstitialAd? _interstitialAd;
  final String _interstitialAdUnitId = AppConstants.defaultAdmobID2;

  StoreViewModel _viewModel = StoreViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: _viewModel,
        onModelReady: (model) {
          _viewModel = model;
          _loadInterstitialAd();
        },
        onPageBuilder: (context, value) {
          return FutureBuilder(
            future: ref
                .read(firebaseProvider)
                .getImagesByFolderName(widget.category!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoaderWidget();
              } else if (snapshot.hasError || !snapshot.hasData) {
                return Text("a");
              } else {
                List? imageURLs = snapshot.data;
                return SizedBox(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: (imageURLs?.length ?? 0 / 2)
                        .ceil(), //complete to double int :) make it ceils
                    itemBuilder: (context, index) {
                      int startIndex = index * 2; //0 => 0 and 1 // 2 => 2 3
                      int endIndex = startIndex + 2;
                      if (endIndex > imageURLs!.length) {
                        endIndex = imageURLs.length;
                      } //if index+1 was not available in data storage make it last image
                      List<Widget> rowItems = [];
                      for (int i = startIndex; i < endIndex; i++) {
                        //0 1 , 2 3 , 3 4 , 4 5
                        //start Index => 0 2 3 4
                        //images get => 01 23 34 45
                        //end Index   => 2 4 5 6
                        rowItems.add(
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 170,
                                width: ResponsiveFuncs.getWidth(context, 0.45),
                                child: InkWell(
                                  onTap: () {
                                    _showInterstitialAd(imageURLs, i);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    child: Image.network(
                                      imageURLs[i].toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        );
                      }

                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: rowItems,
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  ),
                );
              }
            },
          );
        });
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: _interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            _isInterstitialAdReady = true;
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (error) {
          setState(() {
            _isInterstitialAdReady = false;
          });
          debugPrint('Interstitial ad failed to load: $error');
        },
      ),
    );
  }

  void _showInterstitialAd(imageURLs, i) {
    bool? premiumState =
        LocalManagement.instance.fetchBoolean(SettingsEnum.AD_PREMIUM);

    if (premiumState != true) {
      if (_isInterstitialAdReady) {
        _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad) {
            NavRoute(DrawRoute(imageUrl: imageURLs[i].toString()))
                .toPushReplecement(context);
            _loadInterstitialAd(); // Yeni bir reklam yükleme
          },
          onAdFailedToShowFullScreenContent: (ad, error) {
            NavRoute(HomeRoute(pageIndex: 0)).toPushReplecement(context);
            debugPrint('Interstitial ad failed to show: $error');
          },
        );
        _interstitialAd?.show();
      }
    } else {
      NavRoute(DrawRoute(imageUrl: imageURLs[i].toString()))
          .toPushReplecement(context);
    }
  }
}
