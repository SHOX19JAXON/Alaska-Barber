import 'dart:async';

import 'package:alaska_barber/screens/home_screen/home_screen.dart';
import 'package:alaska_barber/utils/colors/app_colors.dart';
import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        }));
      });
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:  const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60,),
            Row(
              children: [
                const Spacer(),
                Text("ALYASKAGA XUSH KELIBSIZ ",style: Theme.of(context).textTheme.bodyLarge,),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const Spacer(),
                Lottie.asset(AppImages.taxi, width: 300),
                const Spacer(),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
