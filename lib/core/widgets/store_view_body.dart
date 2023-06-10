import 'package:easy_draw/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../product/route/nav_route.dart';
import '../product/route/router.dart';
import '../riverpod/firebase_provider.dart';
import 'loader.dart';

class StoreBody extends ConsumerWidget {
  const StoreBody({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.read(firebaseProvider).getImagesByFolderName(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoaderWidget();
        } else if (snapshot.hasError) {
          return Text('ERR: ${snapshot.error}');
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
                              NavRoute(DrawRoute(
                                imageUrl: imageURLs[i].toString(),
                              )).toPush(context);
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
  }
}