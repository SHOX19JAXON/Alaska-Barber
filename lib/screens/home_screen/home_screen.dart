import 'package:alaska_barber/screens/barbers/barbers.dart';
import 'package:alaska_barber/utils/colors/app_colors.dart';
import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:alaska_barber/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c1B2B2B,
      appBar: AppBar(
        backgroundColor: AppColors.c1B2B2B,
        title: Text('Alyaska ',style: TextStyle(
          color: AppColors.cAFECFE,
        ),),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu,color: AppColors.cAFECFE,), // 3 ta chizig'li menyu tugmasi
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Yangi kontekstda Scaffold ochiladi
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
              title: Text('Til tanlang'),
              onTap: () {
                // Biror sahifaga o'tkazish mumkin
              },
            ),
            ListTile(
              leading: Icon(Icons.color_lens),
              title: Text('Tungi kunduzgi'),
              onTap: () {

              },
            ),
            ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text('Joylashuv'),
              onTap: () {

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
            SizedBox(
              height: 10,
            ),
            Text(
              "Alaska 10 yildan buyon o'zining mijozlarioga sfatli xizmat qilib kelmoqda  samarqanddagi top 10 talikdagi erkaklar sartarosh xonasi bo'lib siz bu yerda istalgan soch turmagingizni qilish imkoniga egasiz",
              style: TextStyle(color: AppColors.cAFECFE, fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return Barbers();
                      }));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: AppColors.cAFECFE.withOpacity(0.5),
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
                  "Masterlar royxati",
                  style: AppTextStyle.interRegular.copyWith(
                    color: AppColors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
