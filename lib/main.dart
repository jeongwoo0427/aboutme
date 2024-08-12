import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_router.dart';
import 'constants/themes/app_themes.dart';
import 'cores/services/cache/shared_preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  // Show a loading indicator before running the full app (optional)
  // The platform's loading screen will be used while awaiting if you omit this.
  //runApp(const ErrorScreen());

  // Get the instance of shared preferences
  SharedPreferencesService.initialize(await SharedPreferences.getInstance()); //initial preferences singleton

  return runApp(
    const ProviderScope(
      overrides: [
        // Override the unimplemented provider with the value gotten from the plugin
        // sharedPreferencesScopeProvider.overrideWithValue(prefs),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.black, // Scaffold 영역 밖의 색 (페이지 전환간 색깔 적용)
      child: MaterialApp.router(
        theme: AppThemes.darkTheme,
        onGenerateTitle: (BuildContext context) => 'About JeongWoo',
        routerConfig: appRouter,
        builder: (context, widget) => ResponsiveBreakpoints.builder(child: ClampingScrollWrapper.builder(context, widget!), breakpoints: [
          const Breakpoint(start: 0, end: 480, name: MOBILE),
          const Breakpoint(start: 481, end: 640, name: 'MOBILE_LARGE'),
          const Breakpoint(start: 641, end: 1080, name: TABLET),
          const Breakpoint(start: 1081, end: double.infinity, name: DESKTOP),
        ]),
        //home: const MainMenuScreen(),
      ),
    );
  }
}
