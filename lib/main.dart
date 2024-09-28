import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:alaska_barber/screens/splash_screen/splash_screen.dart';
import 'package:alaska_barber/utils/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("uz", "UZ"),
        Locale("uz", "Cyrl"),
        Locale("ru", "RU"),
        Locale("en", "US"),
        Locale("tr", "TR"),
        // Locale("tt", "RU"),
      ],
      path: "assets/translations",
      fallbackLocale: const Locale("uz", "UZ"),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        home: const SplashScreen(),
      ),
    );
  }
}
