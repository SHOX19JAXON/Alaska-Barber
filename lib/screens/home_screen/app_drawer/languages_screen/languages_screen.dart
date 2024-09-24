import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  int language = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('languages'.tr(), style: Theme.of(context).textTheme.bodyLarge),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 17, right: 17, top: 40),
        child: Column(
          children: [
            // O'zbek tili (Lotin)
            ListTile(
              onTap: () {
                setState(() {
                  language = 1;
                });
                context.setLocale(const Locale('uz', 'UZ'));
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(AppImages.uzb_flag,
                    height: 25, width: 25, fit: BoxFit.cover),
              ),
              trailing: Icon(
                language == 1 ? Icons.check_circle : Icons.circle_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text('O\'zbek', style: Theme.of(context).textTheme.bodyLarge),
            ),
            Divider(color: Theme.of(context).dividerColor),

            // O'zbek tili (Kiril)
            ListTile(
              onTap: () {
                setState(() {
                  language = 2;
                });
                context.setLocale(const Locale('uz', 'Cyrl')); // O'zbek kiril
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(AppImages.uzb_flag,
                    height: 25, width: 25, fit: BoxFit.cover),
              ),
              trailing: Icon(
                language == 2 ? Icons.check_circle : Icons.circle_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text('Ўзбек (Кирил)', style: Theme.of(context).textTheme.bodyLarge),
            ),
            Divider(color: Theme.of(context).dividerColor),

            // Rus tili
            ListTile(
              onTap: () {
                setState(() {
                  language = 3;
                });
                context.setLocale(const Locale('ru', 'RU'));
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(AppImages.rus_flag,
                    height: 25, width: 25, fit: BoxFit.cover),
              ),
              trailing: Icon(
                language == 3 ? Icons.check_circle : Icons.circle_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text('Русский', style: Theme.of(context).textTheme.bodyLarge),
            ),
            Divider(color: Theme.of(context).dividerColor),

            // Ingliz tili
            ListTile(
              onTap: () {
                setState(() {
                  language = 4;
                });
                context.setLocale(const Locale('en', 'US'));
              },
              leading: Image.asset(AppImages.english, height: 25),
              trailing: Icon(
                language == 4 ? Icons.check_circle : Icons.circle_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text('English', style: Theme.of(context).textTheme.bodyLarge),
            ),
            Divider(color: Theme.of(context).dividerColor),

            // Turk tili
            ListTile(
              onTap: () {
                setState(() {
                  language = 5;
                });
                context.setLocale(const Locale('tr', 'TR'));
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(AppImages.turkflag,
                    height: 25, width: 25, fit: BoxFit.cover),
              ),
              trailing: Icon(
                language == 5 ? Icons.check_circle : Icons.circle_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text('Türkçe', style: Theme.of(context).textTheme.bodyLarge),
            ),
            Divider(color: Theme.of(context).dividerColor),


            ListTile(
              onTap: () {
                setState(() {
                  language = 6;
                });
                context.setLocale(const Locale('tt', 'RU'));
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(AppImages.tojikflag,
                    height: 25, width: 25, fit: BoxFit.cover),
              ),
              trailing: Icon(
                language == 6 ? Icons.check_circle : Icons.circle_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text('Tatarça', style: Theme.of(context).textTheme.bodyLarge),
            ),
          ],
        ),
      ),
    );
  }
}
