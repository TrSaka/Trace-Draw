// ignore_for_file: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'core/initalize/theme/app_theme_light.dart';
import 'core/product/route/router.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  RequestConfiguration requestConfiguration = RequestConfiguration(
    testDeviceIds: ['42F5F9DB44AE5B97A395D639B4E84716'],
  );
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
  //Shared Preferences initalized

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: "Easy Draw",
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: AppThemeLight.theme, //app theme is our light theme
    );
  }
}
