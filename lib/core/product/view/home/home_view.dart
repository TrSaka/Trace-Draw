import 'package:easy_draw/core/base/view/base_view.dart';
import 'package:easy_draw/core/product/view_model/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../constants/enum/setting_enums.dart';
import '../../../services/cache/locale_management.dart';
import '../../../widgets/ad_remove_button.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key, this.pageIndex});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
  final int? pageIndex;
}

class _HomeViewState extends ConsumerState<HomeView> {
  HomeViewModel _viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    bool? premiumState =
        LocalManagement.instance.fetchBoolean(SettingsEnum.AD_PREMIUM);
    bool staticAdState =
        ref.watch(_viewModel.adMobBannerProvider).adMobBannerState;
    BannerAd? staticAds = ref.watch(_viewModel.adMobBannerProvider).staticAds;

    void reloadBanner() async {
      setState(() {});
      await ref.read(_viewModel.adMobBannerProvider).showBanner();
    }

    return BaseView(
      viewModel: _viewModel,
      onModelReady: (model) async {
        await ref.read(_viewModel.adMobBannerProvider).showBanner();
        _viewModel = model;
        if (widget.pageIndex != null) {
          _viewModel.changeSelectedIndex(widget.pageIndex);
        } else {
          debugPrint("Routed by Menu");
        }
        bool state = ref.watch(_viewModel.adMobBannerProvider).adMobBannerState;

        if (state == false) {
          reloadBanner();
        }
      },
      onPageBuilder: (context, value) {
        return Observer(builder: (context) {
          return Scaffold(
            appBar: premiumState != true
                ? defaultAppBar(staticAdState, staticAds)
                : premiumNoAppBar(),
            bottomNavigationBar: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 0),
              child: GNav(
                selectedIndex: _viewModel.selectedIndex,
                rippleColor: Colors.grey.shade800,
                hoverColor: Colors.grey.shade700,
                gap: 12,
                duration: const Duration(milliseconds: 300),
                haptic: false, //phone's vibration off
                tabBackgroundColor: Colors.grey.shade300,
                activeColor: Colors.black,
                padding: const EdgeInsets.all(16),
                onTabChange: (newIndex) {
                  _viewModel.changeSelectedIndex(newIndex);
                },
                tabs: const [],
              ),
            ),
            body: _viewModel.applicationScreens[_viewModel.selectedIndex],
          );
        });
      },
    );
  }

  AppBar defaultAppBar(bool staticAdState, BannerAd? staticAds) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: const [AdRemoveButton()],
      centerTitle: true,
      backgroundColor: const Color.fromARGB(0, 64, 63, 63),
      title: Center(
        child: staticAdState == true
            ? SizedBox(
                height: staticAds!.size.height.toDouble(),
                width: staticAds.size.width.toDouble(),
                child: AdWidget(ad: staticAds),
              )
            : const SizedBox(),
      ),
    );
  }

  AppBar premiumNoAppBar() {
    return AppBar(toolbarHeight: 0);
  }
}
