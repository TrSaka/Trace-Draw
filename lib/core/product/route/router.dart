import 'package:auto_route/auto_route.dart';
import 'package:easy_draw/core/product/view/splash/splash_view.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, initial: true, name: 'splash_view'),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
