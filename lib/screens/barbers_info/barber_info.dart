import 'package:alaska_barber/utils/colors/app_colors.dart';
import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:alaska_barber/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../barber_work/barber_works.dart';
import '../barbers/barbers.dart';

class BarberInfo extends StatefulWidget {
  const BarberInfo({super.key});

  @override
  State<BarberInfo> createState() => _BarberInfoState();
}

class _BarberInfoState extends State<BarberInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c1B2B2B,
      appBar: AppBar(
        backgroundColor: AppColors.c1B2B2B,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.cAFECFE,
          ),
        ),
        title: const Text(
          "Palonchayev Pistoncha",
          style: TextStyle(color: AppColors.cAFECFE),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.cAFECFE.withOpacity(0.1),
              ),
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        AppImages.person1,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            SizedBox(
                              child: Text(
                                "Isim Sharifi",
                                style: TextStyle(color: AppColors.cAFECFE),
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Yoshi",
                              style: TextStyle(color: AppColors.cAFECFE),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Tajribasi",
                              style: TextStyle(color: AppColors.cAFECFE),
                            ),

                            SizedBox(height: 6),
                            Text(
                              "Telifon",
                              style: TextStyle(color: AppColors.cAFECFE),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Gmail",
                              style: TextStyle(color: AppColors.cAFECFE),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Reytingi",
                              style: TextStyle(color: AppColors.cAFECFE),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            const SizedBox(
                              child: Text(
                                "Salomov Alisher",
                                style: TextStyle(color: AppColors.cAFECFE),
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "28 shoda",
                              style: TextStyle(color: AppColors.cAFECFE),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "3 yillik tajribaga ega",
                              style: TextStyle(color: AppColors.cAFECFE),
                            ),

                            const SizedBox(height: 6),
                            const Text(
                              "998915274142",
                              style: TextStyle(color: AppColors.cAFECFE),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "mshoxjaxon19@gmail.com",
                              style: TextStyle(color: AppColors.cAFECFE),
                            ),
                            const SizedBox(height: 6),
                            RatingBar.builder(
                              ignoreGestures: true,
                              itemSize: 18,
                              initialRating: 1,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: const Text(
                "This example shows a custom implementation of selection in list and grid views. Use the button in the top right (possibly hidden under the DEBUG banner) to toggle between ListView and GridView. Long press any ListTile or GridTile to enable selection mode.Memory updatedXatoni togrilash uchun GridView widget-i uchun qoshimcha qismlar kerak. Hozirgi kodda GridView ni Column ichiga joylashtirgansiz, lekin GridView ozi cheksiz balandlik talab qiladi, shuning uchun Expanded yoki SizedBox kabi muvofiqlashtiruvchi qoshimchalar kerak.",
                style: TextStyle(color: AppColors.cAFECFE, fontSize: 16),
              ),
            ),


            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return BarberWork();
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
                  "Qilgan ishlarini ko'rish",
                  style: AppTextStyle.interRegular.copyWith(
                    color: AppColors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
