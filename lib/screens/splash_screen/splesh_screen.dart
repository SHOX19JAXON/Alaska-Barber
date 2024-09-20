import 'dart:async';
import 'package:alaska_barber/screens/home_screen/home_screen.dart';
import 'package:alaska_barber/utils/extensions/size.dart';
import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors/app_colors.dart'; // shared_preferences import qiling

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstTime(); // isFirstTime ni tekshirish
  }

  Future<void> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      // Agar bu birinchi marta bo'lsa, flagni false qilib qo'yamiz
      await prefs.setBool('isFirstTime', false);

      // SplashScreen ni 2 soniya davomida ko'rsatish
      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      });
    } else {
      // Agar bu birinchi marta bo'lmasa, darhol HomeScreen ga o'tish
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
            SizedBox(height: 60,),
            Row(
              children: [
                Spacer(),
                Text("ALYASKAGA HUSH KELIBSIZ ",style: Theme.of(context).textTheme.bodyLarge,),
                Spacer(),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Spacer(),
                Lottie.asset(AppImages.taxi, width: 300),
                Spacer(),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
