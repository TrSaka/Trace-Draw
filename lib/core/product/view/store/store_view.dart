import 'package:easy_draw/core/product/view_model/store/store_view_model.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 5,
          bottom: TabBar(
            tabs: [
              for (int i = 0; i < 6; i++)
                Tab(
                  text: _viewModel.categories[i],
                )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (int i = 0; i < 6; i++)
              StoreBody(category: _viewModel.categories[i]),
          ],
        ),
      ),
    );
  }
}
