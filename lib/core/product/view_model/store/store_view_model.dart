// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'store_view_model.g.dart';

class StoreViewModel = _StoreViewModelBase with _$StoreViewModel;

abstract class _StoreViewModelBase with Store {
  List<String> categories = [
    'sketchs',
    'ANIMALS',
    'EASY',
    'FOOD',
    'EMOJI',
    'UNICORN',
    'ABC',
    'MANDALA'
  ];

  TabBar customTabs() {
    return TabBar(
      isScrollable: true,
      tabs: [
        for (int i = 0; i < categories.length; i++)
          Tab(
            text: categories[i],
          )
      ],
    );
  }
}
