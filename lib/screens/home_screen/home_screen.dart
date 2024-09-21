import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:alaska_barber/screens/barbers/barbers.dart';
import 'package:alaska_barber/utils/colors/app_colors.dart';
import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:alaska_barber/utils/styles/app_text_style.dart';
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Barbers();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Theme.of(context).cardColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                child: Text(
                  "masters_list".tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
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
