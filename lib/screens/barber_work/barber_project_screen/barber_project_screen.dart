import 'package:alaska_barber/screens/barber_work/barber_project_screen/flick_controllers/flick_multi_manager.dart';
import 'package:alaska_barber/screens/barber_work/barber_project_screen/flick_controllers/flick_multi_player.dart';
import 'package:alaska_barber/screens/barber_work/barber_project_screen/widget/photo_item.dart';
import 'package:alaska_barber/utils/colors/app_colors.dart';
import 'package:alaska_barber/utils/mock_data/mock_data.dart';
import 'package:flutter/material.dart';

class BarberProjectScreen extends StatefulWidget {
  const BarberProjectScreen({super.key});

  @override
  State<BarberProjectScreen> createState() => _BarberProjectScreenState();
}

class _BarberProjectScreenState extends State<BarberProjectScreen> {
  int selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("QILGAN ISHLARI", style: Theme.of(context).textTheme.bodyLarge),
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
                    child: _buildTabButton(context, "Foto", 0),
                  ),
                  Expanded(
                    child: _buildTabButton(context, "Video", 1),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 800,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: [
                  _buildPhotoContent(),
                  _buildVideoContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(BuildContext context, String label, int index) {
    return Container(
      decoration: BoxDecoration(
        gradient: selectedIndex == index
            ? const LinearGradient(
          colors: [
            Color(0xFF030305),
            Color(0xFF0D0F19),
            Color(0xFF272827),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
            : null,
        color: selectedIndex != index ? Colors.black.withOpacity(0.5) : null,
        borderRadius: index == 0
            ? const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          topLeft: Radius.circular(15),
        )
            : const BorderRadius.only(
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
            selectedIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: index == 0
                ? const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topLeft: Radius.circular(15),
            )
                : const BorderRadius.only(
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }

  Widget _buildPhotoContent() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(5, (index) {
          return PhotoItem(
            onChanged: (v) {
              counts[index] = v;
              setState(() {});
            },
            pageCount: counts[index],
          );
        }),
      ),
    );
  }

  Widget _buildVideoContent() {
    return PageView(
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
                    color: const Color(0xFFF5F5F5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Caskad style",
                              style: TextStyle(color: Colors.black, fontSize: 25),
                            ),
                            Text(
                              "Barber : Abubakr",
                              style: TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          height : 520,
                          child: SingleChildScrollView(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: FlickMultiPlayer(
                                url: items[index]['trailer_url'],
                                flickMultiManager: flickMultiManager,
                                image: items[index]['image'],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            );
          },
        ),
      ],
    );
  }
}
