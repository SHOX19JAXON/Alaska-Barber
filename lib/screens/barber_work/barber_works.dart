import 'package:alaska_barber/data/models/barbers_model.dart';
import 'package:alaska_barber/screens/barber_work/widget/all_hair_styles_widget.dart';
import 'package:alaska_barber/screens/barber_work/widget/barber_work_video.dart';
import 'package:alaska_barber/screens/barber_work/widget/video_screen.dart';
import 'package:alaska_barber/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../barber_work_detaile/barber_work_detaile.dart';

class BarberWork extends StatefulWidget {
  const BarberWork({super.key, required this.userModel});

  final BarbersModel userModel;

  @override
  State<BarberWork> createState() => _BarberWorkState();
}

class _BarberWorkState extends State<BarberWork> {
  int selectedIndex = 0;
  final PageController _pageController =
      PageController(initialPage: 0); // PageView controller
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/sample_video.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.c1B2B2B,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        // backgroundColor: AppColors.c1B2B2B,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title:  Text(
          "QILGAN ISHLARI",
          style: Theme.of(context).textTheme.bodyLarge
          // TextStyle(color: AppColors.cAFECFE),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:  const Icon(
            Icons.arrow_back,
            color: AppColors.white
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                    _pageController.jumpToPage(0);
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
                child:  Text(
                  "Foto",
                  style: Theme.of(context).textTheme.bodyLarge
                  // TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                    _pageController.jumpToPage(1);
                  });
                  //996848581
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
                child:  Text(
                  "Video",
                  style: Theme.of(context).textTheme.bodyLarge
                  // TextStyle(color: Colors.white, fontSize: 14),
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
                  selectedIndex = index;
                });
              },
              children: [
                SingleChildScrollView(
                  child: AllHairStylesWidget(
                    onTap: () {
                      print("--------------------salom");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BarberWorkDetail(
                              userModel: widget.userModel,

                            );
                          },
                        ),
                      );
                    },
                    userModel: widget.userModel,
                  ),
                ),
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
                      BarberWorkVideo(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoScreen()));
                        },
                      )
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
