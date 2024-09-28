import 'package:alaska_barber/screens/barber_work/barber_project_screen/flick_controllers/flick_multi_manager.dart';
import 'package:alaska_barber/screens/barber_work/barber_project_screen/flick_controllers/flick_multi_player.dart';
import 'package:alaska_barber/screens/barber_work/barber_project_screen/widget/photo_item.dart';
import 'package:alaska_barber/utils/colors/app_colors.dart';
import 'package:alaska_barber/utils/mock_data/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BarberProjectScreen extends StatefulWidget {
  const BarberProjectScreen({super.key});

  @override
  State<BarberProjectScreen> createState() => _BarberProjectScreenState();
}

class _BarberProjectScreenState extends State<BarberProjectScreen> {
  int selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  late VideoPlayerController _controller;
  List<int> counts = List.generate(5, (index) => 0);

  List items = mockData['items'];

  late FlickMultiManager flickMultiManager;

  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text("QILGAN ISHLARI",
            style:
            TextStyle(color: Colors.black)
            // Theme.of(context).textTheme.bodyLarge
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: selectedIndex == 0
                            ? isDarkMode
                            ? const LinearGradient(
                          colors: [
                            Color(0xFF030305),
                            Color(0xFF0D0F19),
                            Color(0xFF272827)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                            : const LinearGradient(
                          colors: [
                            AppColors.c355353,
                            AppColors.c355353,
                            AppColors.c355353,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                            : const LinearGradient(
                          colors: [
                            Color(0xFFF5F5F5),
                            Color(0xFFF5F5F5),
                            Color(0xFFF5F5F5),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ), // Defolt holat uchun rang
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.1,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = 0;
                            _pageController.jumpToPage(0);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              topLeft: Radius.circular(15),
                            ),
                          ),
                        ),
                        child: Text(
                          "Foto",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: selectedIndex == 1
                            ? isDarkMode
                            ? const LinearGradient(
                          colors: [
                            Color(0xFF030305),
                            Color(0xFF0D0F19),
                            Color(0xFF272827),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                            : const LinearGradient(
                          colors: [
                            AppColors.c355353,
                            AppColors.c355353,
                            AppColors.c355353,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                            : const LinearGradient(
                          colors: [
                            Color(0xFFF5F5F5),
                            Color(0xFFF5F5F5),
                            Color(0xFFF5F5F5),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ), // Defolt holat uchun rang
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.1,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = 1;
                            _pageController.jumpToPage(1);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                        ),
                        child: Text(
                          "Video",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ),
                ],
              )


            )
,
            const SizedBox(height: 20),
            SizedBox(
              height: 800,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(
                        () {
                      selectedIndex = index;
                    },
                  );
                },
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                          5,
                              (index) {
                            return PhotoItem(
                              onChanged: (v) {
                                counts[index] = v;
                                setState(() {});
                              },
                              pageCount: counts[index],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  PageView(
                    scrollDirection: Axis.vertical,
                    children: [
                      ...List.generate(
                        items.length,
                            (index) {
                          return Column(
                            children: [
                              Container(
                                height: 650,
                                margin: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: isDarkMode
                                      ? const LinearGradient(
                                    colors: [
                                      Color(0xFF030305),
                                      Color(0xFF0D0F19),
                                      Color(0xFF272827)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  )
                                      : const LinearGradient(
                                    colors: [
                                      AppColors.c355353,
                                      AppColors.c355353,
                                      AppColors.c355353,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 0.1,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Caskad style",
                                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                              color : Colors.white
                                            ),),
                                          Text(
                                            "Barber : Abubakr",
                                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                              color : Colors.white
                                            ),
                                          ),
                                          const SizedBox(height: 10,),
                                          Text(
                                            "Phone : +998 99 000 90 00",
                                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                              color : Colors.white
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(20),
                                      child: FlickMultiPlayer(
                                        url: items[index]['trailer_url'],
                                        flickMultiManager:
                                        flickMultiManager,
                                        image: items[index]['image'],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
