import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem(
      {super.key, required this.onChanged, required this.pageCount});

  final ValueChanged<int> onChanged;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 16 , right: 16 , bottom: 16),
      decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    AppImages.barberImage,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Abubakr Oqilov",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Text(
                      "To'y uchun qilingan kuyov stil ",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 400,
            child: Stack(
              children: [
                PageView(
                  onPageChanged: onChanged,
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(
                      5,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(AppImages.soch5,
                                width: double.infinity,
                                height: 400,
                                fit: BoxFit.cover),
                          ),
                        );
                      },
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          5,
                          (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: pageCount == index ? 15 : 10,
                              height: pageCount == index ? 15 : 10,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
