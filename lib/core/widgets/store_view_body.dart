import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../product/route/nav_route.dart';
import '../product/route/router.dart';
import '../riverpod/storage_riverpod.dart';
import 'loader.dart';

class StoreBody extends ConsumerWidget {
  const StoreBody({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.read(storageProvider).getImagesByFolderName(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoaderWidget();
        } else if (snapshot.hasError) {
          return Text('ERR: ${snapshot.error}');
        } else {
          List? imageURLs = snapshot.data;
          return SizedBox(
            child: ListView.builder(
              itemCount: imageURLs?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    NavRoute(DrawRoute(imageUrl: imageURLs[index].toString()))
                        .toPush(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Image.network(imageURLs![index]),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
