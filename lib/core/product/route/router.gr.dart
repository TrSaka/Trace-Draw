// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    Splash_view.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          Splash_view.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [SplashView]
class Splash_view extends PageRouteInfo<void> {
  const Splash_view()
      : super(
          Splash_view.name,
          path: '/',
        );

  static const String name = 'Splash_view';
}
