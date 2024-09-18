import 'package:alaska_barber/screens/barber_work/widget/all_hair_styles_widget.dart';
import 'package:alaska_barber/screens/barber_work/widget/product_list_widget.dart';
import 'package:alaska_barber/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../barber_work_detaile/barber_work_detaile.dart';

class BarberWork extends StatefulWidget {
  const BarberWork({super.key});

  @override
  State<BarberWork> createState() => _BarberWorkState();
}

class _BarberWorkState extends State<BarberWork> {
  int selectedIndex = 0; // Dastlab Foto ko'rsatiladi
  final PageController _pageController = PageController(initialPage: 0); // PageView controller
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Video assets-dan yuklanadi
    _controller = VideoPlayerController.asset('assets/videos/sample_video.mp4')
      ..initialize().then((_) {
        // Video yuklangandan keyin UI-ni qayta chizish
        setState(() {});
      });
  }
  @override
  void dispose() {
    super.dispose();
    // Video player resurslarini tozalash
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c1B2B2B,
      appBar: AppBar(
        backgroundColor: AppColors.c1B2B2B,
        title: const Text(
          "QILGAN ISHLARI",
          style: TextStyle(color: AppColors.cAFECFE),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.cAFECFE,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 0; // Foto tanlandi
                    _pageController.jumpToPage(0); // Foto sahifasiga o'tish
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedIndex == 0
                      ? AppColors.cAFECFE.withOpacity(0.5)
                      : AppColors.black.withOpacity(0.5),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                ),
                child: const Text(
                  "Foto",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 1; // Video tanlandi
                    _pageController.jumpToPage(1); // Video sahifasiga o'tish
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedIndex == 1
                      ? AppColors.cAFECFE.withOpacity(0.5)
                      : AppColors.black.withOpacity(0.5),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                ),
                child: const Text(
                  "Video",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index; // Sahifa o'zgarganda index yangilanadi
                });
              },
              children: [
                // 1-chi sahifa: Foto uchun
                SingleChildScrollView(
                  child: AllHairStylesWidget(
                    onTap: () {
                       Navigator.push(context,MaterialPageRoute(builder: (context){
                         return BarberWorkDetail();
                       }));
                    },
                  ),
                ),
                // 2-chi sahifa: Video uchun
                 SingleChildScrollView(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       // Icon(
                       //   Icons.video_library,
                       //   size: 100,
                       //   color: Colors.white,
                       // ),
                       // SizedBox(height: 20),
                       // Text(
                       //   "Bu yerda videolar chiqadi",
                       //   style: TextStyle(color: Colors.white, fontSize: 18),
                       // ),
                       WidgetProductList(onTap: () {  },)


                     ],
                   ),
                 ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
