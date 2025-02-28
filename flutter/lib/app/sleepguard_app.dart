import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sleepguard_app/core/core.dart';

class SleepguardApp extends StatelessWidget {
  const SleepguardApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MultiProvider(
        providers: Providers.global,
        child: MaterialApp(
          title: 'Sleepguard',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          navigatorKey: navigatorKey,
          routes: Pages.pages,
          initialRoute: Routes.home,
        ),
      ),
    );
  }
}