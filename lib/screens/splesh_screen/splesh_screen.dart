import 'dart:async';

import 'package:alaska_barber/screens/home_screen/home_screen.dart';
import 'package:alaska_barber/utils/extensions/size.dart';
import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.push(context,MaterialPageRoute(builder: (context){
          return HomeScreen();
        }));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.red,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Lottie.asset(AppImages.taxi, width: 300)),

      ),
    );
  }
}
