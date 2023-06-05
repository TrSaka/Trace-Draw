import 'package:easy_draw/core/base/view/base_view.dart';
import 'package:easy_draw/core/constants/path/image_path.dart';
import 'package:easy_draw/core/extensions/image_extensions.dart';
import 'package:flutter/material.dart';
import '../../../base/state/base_state.dart';
import '../../view_model/splash/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> {
  SplashViewModel _viewModel = SplashViewModel();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: _viewModel,
      onModelReady: (model) {
        _viewModel = model;
      },
      onPageBuilder: (context, value) {
        return Scaffold(
          body: SizedBox(
            height: getHeightOfDevice(1),
            width: getWidthOfDevice(1),
            child: ImageExt(ImagePaths.splashScreenPath).toSvg,
          ),
        );
      },
    );
  }
}
