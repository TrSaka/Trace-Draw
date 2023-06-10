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
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HomeView(
          key: args.key,
          pageIndex: args.pageIndex,
        ),
      );
    },
    DrawRoute.name: (routeData) {
      final args = routeData.argsAs<DrawRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DrawView(
          args.imageUrl,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          Splash_view.name,
          path: '/',
        ),
        RouteConfig(
          HomeRoute.name,
          path: 'home_view',
        ),
        RouteConfig(
          DrawRoute.name,
          path: 'drawing_view',
        ),
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

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    int? pageIndex,
  }) : super(
          HomeRoute.name,
          path: 'home_view',
          args: HomeRouteArgs(
            key: key,
            pageIndex: pageIndex,
          ),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.pageIndex,
  });

  final Key? key;

  final int? pageIndex;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, pageIndex: $pageIndex}';
  }
}

/// generated route for
/// [DrawView]
class DrawRoute extends PageRouteInfo<DrawRouteArgs> {
  DrawRoute({
    required String imageUrl,
    Key? key,
  }) : super(
          DrawRoute.name,
          path: 'drawing_view',
          args: DrawRouteArgs(
            imageUrl: imageUrl,
            key: key,
          ),
        );

  static const String name = 'DrawRoute';
}

class DrawRouteArgs {
  const DrawRouteArgs({
    required this.imageUrl,
    this.key,
  });

  final String imageUrl;

  final Key? key;

  @override
  String toString() {
    return 'DrawRouteArgs{imageUrl: $imageUrl, key: $key}';
  }
}
