import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
        //sharedPreferencesScopeProvider.overrideWithValue(prefs),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return MaterialApp.router(
      theme: AppThemes.lightTheme,
      locale: const Locale('ko'), //자동 언어 설정을 위해 제거
      onGenerateTitle: (BuildContext context) =>
      'About JeongWoo',
      routerConfig: appRouter,
      //home: const MainMenuScreen(),
    );
  }
}
