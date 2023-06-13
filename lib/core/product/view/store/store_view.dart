import 'package:easy_draw/core/constants/app/app_constants.dart';
import 'package:easy_draw/core/extensions/image_extensions.dart';
import 'package:easy_draw/core/product/view_model/store/store_view_model.dart';
import 'package:easy_draw/core/utils/responsive.dart';
import 'package:easy_draw/core/widgets/store_view_body.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreView extends ConsumerStatefulWidget {
  const StoreView({super.key});

  @override
  ConsumerState<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends ConsumerState<StoreView> {
  FirebaseStorage storage = FirebaseStorage.instance;
  List<String> imageURLs = [];
  final StoreViewModel _viewModel = StoreViewModel();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: SizedBox(
            child: ImageExt(AppConstants.bannerPath).toPng,
            width: double.infinity,
            height: 150,
          ),
          backgroundColor: Colors.white,
          toolbarHeight: ResponsiveFuncs.getHeight(context, 0.15),
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.yellow.shade700,
            isScrollable: true,
            tabs: [
              for (int i = 0; i < 9; i++)
                Tab(
                  text: _viewModel.categories[i],
                )
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  for (int i = 0; i < 9; i++)
                    StoreBody(_viewModel.categories[i]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
