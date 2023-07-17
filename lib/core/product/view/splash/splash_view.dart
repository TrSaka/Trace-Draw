import 'package:easy_draw/core/base/view/base_view.dart';
import 'package:easy_draw/core/constants/app/app_constants.dart';
import 'package:easy_draw/core/extensions/image_extensions.dart';
import 'package:easy_draw/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../view_model/splash/splash_view_model.dart';




class SplashView extends ConsumerStatefulWidget {
  
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  SplashViewModel _viewModel = SplashViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: _viewModel,
      onModelReady: (model) async {
        _viewModel = model;
        _viewModel.initalizeCache();

        _viewModel.checkVersionControl(ref).then((state) {
          if (state == false) {
            _viewModel.routeToMenu(context);
            _viewModel.hidePopup();
          } else {
            _viewModel.showPopup(context);
          }
        });
        await _viewModel.getIpAdresses(ref).then((value) {
          _viewModel.checkPremiumUser(ref,value);
        });
      },
      onPageBuilder: (context, value) {
        return Scaffold(
          body: SizedBox(
            height: ResponsiveFuncs.getHeight(context, 1),
            width: ResponsiveFuncs.getWidth(context, 1),
            child: Stack(
              children: [ImageExt(AppConstants.splashPath).toPng],
            ),
          ),
        );
      },
    );
  }
}
