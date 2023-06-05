import 'package:auto_route/auto_route.dart';
import 'package:easy_draw/core/product/view/draw/draw_view.dart';
import 'package:easy_draw/core/product/view/home/home_view.dart';
import 'package:easy_draw/core/product/view/splash/splash_view.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, initial: false, name: 'splash_view'),
    AutoRoute(page: HomeView, initial: true, path: "home_view"),
    AutoRoute(page: DrawView, initial: false, path: "drawing_view"),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
