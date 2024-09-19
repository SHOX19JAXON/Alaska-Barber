import 'package:alaska_barber/screens/barber_work/widget/all_hair_styles_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WidgetProductList extends StatefulWidget {
  const WidgetProductList({super.key, required this.onTap, });

  // final List<Product> products;
  final VoidCallback onTap;

  @override
  State<WidgetProductList> createState() => _WidgetProductListState();
}

class _WidgetProductListState extends State<WidgetProductList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(10, (index) {
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: widget.onTap,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            soch[index],
                            fit: BoxFit.cover,
                            width: 90,
                            height: 130,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "maykil jeksin stili",
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 6),
                            const Text("25\$"),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                RatingBar.builder(
                                  itemSize: 16,
                                  initialRating: 4,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  "(5.k)",
                                  style: TextStyle(color: Colors.orange),
                                ),
                                const SizedBox(width: 6),

                                SizedBox(width: 6),

                              ],
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "Zo'r",
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
