import 'package:alaska_barber/screens/barber_work/barber_project_screen/barber_project_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:alaska_barber/utils/colors/app_colors.dart';
import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:alaska_barber/utils/styles/app_text_style.dart';
import '../barber_work/barber_works.dart';
import '../barbers/barbers.dart';
import 'package:alaska_barber/data/models/barbers_model.dart';

class BarberInfo extends StatefulWidget {
  final UserModel userModel;

  const BarberInfo({
    super.key,
    required this.userModel,
  });

  @override
  State<BarberInfo> createState() => _BarberInfoState();
}

class _BarberInfoState extends State<BarberInfo> {
  @override
  Widget build(BuildContext context) {
    // Use id as an index
    final barber = widget.userModel;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // backgroundColor: AppColors.c1B2B2B,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // backgroundColor: AppColors.c1B2B2B,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColors.white
              // Theme.of(context).cardColor,

              ),
        ),
        title: Text("${widget.userModel.name} ${widget.userModel.surname}",
            style: Theme.of(context).textTheme.bodyLarge
            // const TextStyle(color: AppColors.cAFECFE),
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
                  color: Theme.of(context).cardColor
                  // AppColors.cAFECFE.withOpacity(0.3),
                  ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        widget.userModel.image,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            SizedBox(
                              child: Text("full_name".tr(),
                                  style: Theme.of(context).textTheme.bodyLarge
                                  // TextStyle(color: AppColors.cAFECFE),
                                  ),
                            ),
                            //jhgjhgfhgfhgfhgfhgfhgf
                            SizedBox(height: 6),
                            Text("age".tr(),
                                style: Theme.of(context).textTheme.bodyLarge
                                // TextStyle(color: AppColors.cAFECFE),
                                ),
                            SizedBox(height: 6),
                            Text("experience".tr(),
                                style: Theme.of(context).textTheme.bodyLarge
                                // TextStyle(color: AppColors.cAFECFE),
                                ),
                            SizedBox(height: 6),
                         
                            Text("phone".tr(),
                                style: Theme.of(context).textTheme.bodyLarge
                                // TextStyle(color: AppColors.cAFECFE),
                                ),
                            SizedBox(height: 6),
                            Text("Gmail",
                                style: Theme.of(context).textTheme.bodyLarge
                                // TextStyle(color: AppColors.cAFECFE),
                                ),
                            SizedBox(height: 6),
                            Text("rating".tr(),
                                style: Theme.of(context).textTheme.bodyLarge
                                // TextStyle(color: AppColors.cAFECFE),
                                ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Text(
                                "${widget.userModel.name} ${widget.userModel.surname}",
                                style: Theme.of(context).textTheme.bodyLarge
                                // const TextStyle(color: AppColors.cAFECFE),
                                ),
                            const SizedBox(height: 6),
                            Text("${widget.userModel.age} years_old".tr(),
                                style: Theme.of(context).textTheme.bodyLarge
                                // const TextStyle(color: AppColors.cAFECFE),
                                ),
                            const SizedBox(height: 6),
                            Text(
                                "${widget.userModel.workExperience} years_of_experience".tr(),
                                style: Theme.of(context).textTheme.bodyLarge
                                // const TextStyle(color: AppColors.cAFECFE),
                                ),
                            const SizedBox(height: 6),
                            Text(widget.userModel.phoneNumber,
                                style: Theme.of(context).textTheme.bodyLarge
                                // const TextStyle(color: AppColors.cAFECFE),
                                ),
                            const SizedBox(height: 6),
                            Text(widget.userModel.email,
                                style: Theme.of(context).textTheme.bodyLarge
                                // const TextStyle(color: AppColors.cAFECFE),
                                ),
                            const SizedBox(height: 6),
                            RatingBar.builder(
                              ignoreGestures: true,
                              itemSize: 18,
                              initialRating: widget.userModel.skills.toDouble(),
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
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text("This example shows a custom implementation...",
                  style: Theme.of(context).textTheme.bodyLarge
                  // TextStyle(color: AppColors.cAFECFE, fontSize: 16),
                  ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const BarberProjectScreen();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Theme.of(context).cardColor,
                  // AppColors.cAFECFE.withOpacity(0.5),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                child: Text("view_works".tr(),
                    style: Theme.of(context).textTheme.bodyLarge
                    // AppTextStyle.interRegular.copyWith(color: AppColors.white, fontSize: 13,),
                    ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
