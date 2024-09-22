import 'package:alaska_barber/screens/barber_work/barber_project_screen/flick_controllers/flick_multi_manager.dart';
import 'package:alaska_barber/screens/barber_work/barber_project_screen/flick_controllers/flick_multi_player.dart';
import 'package:alaska_barber/screens/barber_work/barber_project_screen/widget/photo_item.dart';
import 'package:alaska_barber/utils/colors/app_colors.dart';
import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:alaska_barber/utils/mock_data/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("QILGAN ISHLARI",
            style: Theme.of(context).textTheme.bodyLarge),
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
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    setState(
                          () {
                        selectedIndex = 0;
                        _pageController.jumpToPage(0);
                      },
                    );
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
                  child: Text("Foto",
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(
                          () {
                        selectedIndex = 1;
                        _pageController.jumpToPage(1);
                      },
                    );
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
                  child:
                  Text("Video", style: Theme.of(context).textTheme.bodyLarge
                    // TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                const Spacer(),
              ],
            ),
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
                  SizedBox(
                    height: 700,
                    child: PageView(
                      scrollDirection: Axis.vertical,
                      children: [
                        ...List.generate(
                          items.length,
                              (index) {
                            return Container(
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color : const Color(0xFFF5F5F5)
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: FlickMultiPlayer(
                                  url: items[index]['trailer_url'],
                                  flickMultiManager: flickMultiManager,
                                  image: items[index]['image'],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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
