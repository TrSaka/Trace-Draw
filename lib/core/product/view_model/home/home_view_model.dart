// ignore_for_file: library_private_types_in_public_api
import 'package:easy_draw/core/product/view/store/store_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobx/mobx.dart';

import '../../../riverpod/admob_notifier.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  int selectedIndex = 0;

  @action
  void changeSelectedIndex(newIndex) {
    selectedIndex = newIndex;
  }

  List applicationScreens = [
    const StoreView(),
  ];

  final adMobBannerProvider =
      ChangeNotifierProvider<AdmobProvider>((ref) => AdmobProvider());
}
