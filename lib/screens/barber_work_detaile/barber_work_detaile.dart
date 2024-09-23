import 'package:alaska_barber/data/models/barbers_model.dart';
import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../utils/colors/app_colors.dart';

class BarberWorkDetail extends StatefulWidget {
  const BarberWorkDetail({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<BarberWorkDetail> createState() => _BarberWorkDetailState();
}

class _BarberWorkDetailState extends State<BarberWorkDetail> {
  int currentIndex = 0; // Tanlangan rasmni ko'rsatish uchun

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.c1B2B2B,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        // backgroundColor: AppColors.c1B2B2B,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title:  Text("STIL",style: Theme.of(context).textTheme.bodyLarge,),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: widget.userModel.fotos[0].image.length,
            itemBuilder: (context, index, realIndex) {


              final imagePath = widget.userModel.fotos[0].image[index];
              print("Current Image Path: $imagePath");
              return ClipRRect(
                borderRadius: BorderRadius.circular(20), // Rasmlar uchun radius
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            },
            options: CarouselOptions(
              height: 450,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.userModel.fotos[0].image.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index
                      ? AppColors.cAFECFE
                      : Colors.grey, // Tanlangan rasm ko'k rangda
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}


List<String> soch2 = [
  AppImages.soch1,
  AppImages.soch2,
  AppImages.soch3,
  AppImages.soch4,
  AppImages.soch5,

];
