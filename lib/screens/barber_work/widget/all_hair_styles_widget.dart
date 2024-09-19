import 'package:alaska_barber/data/models/barbers_model.dart';
import 'package:alaska_barber/utils/colors/app_colors.dart';
import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AllHairStylesWidget extends StatefulWidget {
  const AllHairStylesWidget(
      {super.key, required this.onTap, required this.userModel});

  final UserModel userModel;
  final VoidCallback onTap;

  @override
  State<AllHairStylesWidget> createState() => _AllHairStylesWidgetState();
}

class _AllHairStylesWidgetState extends State<AllHairStylesWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15,
                childAspectRatio: 0.7,
              ),
              itemCount: widget.userModel.fotos.length, // Use fotos.length
              itemBuilder: (context, index) {
                final foto = widget.userModel.fotos[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: widget.onTap,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          foto.image.isNotEmpty ? foto.image[0] : AppImages.barber, // Handle empty image list
                          fit: BoxFit.cover,
                          height: 150,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        foto.name,
                        style: const TextStyle(
                          color: AppColors.cAFECFE,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${foto.likes} ",
                                  style: const TextStyle(
                                    color: AppColors.cAFECFE,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5,),
                          Icon(Icons.favorite, color: Colors.red,) // Updated icon
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            "3.5",
                            style: TextStyle(color: AppColors.cAFECFE),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          RatingBar.builder(
                            itemSize: 14,
                            initialRating: 2,
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
                          const SizedBox(
                            width: 2,
                          ),
                          const Text(
                            "(3.k)",
                            style: TextStyle(color: AppColors.cAFECFE),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


List<String> soch = [
  AppImages.soch1,
  AppImages.soch2,
  AppImages.soch3,
  AppImages.soch4,
  AppImages.soch5,
  AppImages.soch6,
  AppImages.soch7,
  AppImages.soch8,
  AppImages.soch9,
  AppImages.soch10,
  AppImages.soch11,
  AppImages.soch12,
  AppImages.soch13,
  AppImages.soch14,
  AppImages.soch15,
  AppImages.soch16
];
