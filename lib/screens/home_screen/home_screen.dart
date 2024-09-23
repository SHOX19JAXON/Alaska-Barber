import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:alaska_barber/screens/barber_work/barber_project_screen/barber_project_screen.dart';
import 'package:alaska_barber/screens/barbers/barbers.dart';
import 'package:alaska_barber/utils/colors/app_colors.dart';
import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/theme/app_theme.dart';
import 'languages_screen/languages_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Alyaska'.tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Theme.of(context).shadowColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.c1B2B2B,
              ),
              child: Text(
                'Alyaska',
                style: TextStyle(
                  color: AppColors.cAFECFE,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('select_language'.tr()),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LanguagesScreen();
                }));
              },
            ),
            ListTile(
              leading: Icon(
                context.isDarkTheme() ? Icons.shield_moon : Icons.sunny,
                color: context.isDarkTheme() ? Colors.yellow : Colors.blue,
              ),
              title: Text(context.isDarkTheme() ? 'dark_mode'.tr() : 'light_mode'.tr()),
              onTap: () {
                // Theme switching
                if (context.isDarkTheme()) {
                  AdaptiveTheme.of(context).setLight();
                } else {
                  AdaptiveTheme.of(context).setDark();
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text('location'.tr()),
              onTap: () {
                // Navigate to location settings or another page
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Image.asset(
              AppImages.barber45,
              width: 250,
              height: 250,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                "data".tr(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Barbers();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero, // Container uchun paddingni olib tashlash
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF030305),
                        Color(0xFF0D0F19),
                        Color(0xFF272827)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "masters_list".tr(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
//Masterlar ro'yxati, Til tanlang,Tungi mod,Kundizgi mod,Joylashuv,yoshda ,yillik tajribaga ega, Yoshi,Tajribasi,Telifon ,Reyting, Isim Sharifi, Qilgan ishlarini ko'rish, surat,video,
