import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:alaska_barber/screens/splash_screen/splesh_screen.dart';
import 'package:alaska_barber/utils/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // Bindingni to'g'ri initialize qilish
  WidgetsFlutterBinding.ensureInitialized();

  // EasyLocalizationni initialize qilish
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("uz", "UZ"), // O'zbek tili (Lotin)
        Locale("uz", "Cyrl"), // O'zbek kiril
        Locale("ru", "RU"), // Rus tili
        Locale("en", "US"), // Ingliz tili
        Locale("tr", "TR"), // Turk tili
        Locale("tt", "RU"), // Totij tili
      ],
      path: "assets/translations", // Tarjima fayllari yo'li
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
      light: AppTheme.lightTheme, // Yengil mavzu (Light Theme)
      dark: AppTheme.darkTheme, // Qorong'u mavzu (Dark Theme)
      initial: AdaptiveThemeMode.system, // Qurilma sozlamasiga moslash
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme, // Ilova uchun yengil mavzu (Light Theme)
        darkTheme: darkTheme, // Ilova uchun qorong'u mavzu (Dark Theme)
        themeMode: ThemeMode.system, // Qurilma rejimiga qarab
        locale: context.locale, // EasyLocalizationdan tilni olish
        supportedLocales: context.supportedLocales, // Qo'llab-quvvatlanadigan tillar
        localizationsDelegates: context.localizationDelegates, // Tarjima delegatlari
        home: const SplashScreen(), // Asosiy ekran
      ),
    );
  }

}
