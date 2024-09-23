import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:alaska_barber/screens/splash_screen/splesh_screen.dart';
import 'package:alaska_barber/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
        home: const SplashScreen(), // Asosiy ekran
      ),
    );
  }
}


