import 'package:alaska_barber/screens/barbers_info/barber_info.dart';
import 'package:alaska_barber/utils/colors/app_colors.dart';
import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Barbers extends StatefulWidget {
  const Barbers({super.key});

  @override
  State<Barbers> createState() => _BarbersState();
}

class _BarbersState extends State<Barbers> {
  @override
  void initState() {
    super.initState();
    sortBarbersByRating();
  }

  void sortBarbersByRating() {
    List<Map<String, dynamic>> barbersData = [];
    for (int i = 0; i < barber.length; i++) {
      barbersData.add({
        'name': barber[i],
        'experience': barberyers[i],
        'rating': barberRating[i],
      });
    }

    barbersData.sort((a, b) => b['rating'].compareTo(a['rating']));

    for (int i = 0; i < barbersData.length; i++) {
      barber[i] = barbersData[i]['name'];
      barberyers[i] = barbersData[i]['experience'];
      barberRating[i] = barbersData[i]['rating'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c1B2B2B,
      appBar: AppBar(
        backgroundColor: AppColors.c1B2B2B,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.cAFECFE,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Masterlar ro'yxati",
            style: TextStyle(color: AppColors.cAFECFE),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const BarberInfo();
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.cAFECFE.withOpacity(0.5),
                    ),
                    width: 370,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              AppImages.person1,
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 40),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  barber[index],
                                  style:
                                      const TextStyle(color: AppColors.cAFECFE),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                barberyoshi[index],
                                style:
                                    const TextStyle(color: AppColors.cAFECFE),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                barberyers[index],
                                style:
                                    const TextStyle(color: AppColors.cAFECFE),
                              ),
                              const SizedBox(height: 10),
                              RatingBar.builder(
                                ignoreGestures: true,
                                itemSize: 18,
                                initialRating: barberRating[index],
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> barber = [
  "Mamadaliyev Muhammadali",
  "Abduraxmonv Diyorbek",
  "Salimov Azizbek",
  "Davronov Anvar",
  "Jalijov Jali",
  "To'xtayev Alisher",
  "Murodiv Sanjar",
  "Salimjon Nazirjon",
  "Mamadaliyev Otabek",
  "To'xtashimova Ibroxim"
];
List<String> barberyers = [
  "2 yillik tajribaga ega",
  "3 yillik tajribaga ega",
  "2.5 yillik tajribaga ega",
  "5 yillik tajribaga ega",
  "8 yillik tajribaga ega",
  "1.5 yillik tajribaga ega",
  "1.5 yillik tajribaga ega",
  "3 yillik tajribaga ega",
  "1 yillik tajribaga ega",
  "10 yillik tajribaga ega",
];
List<String> barberyoshi = [
  "28 yoshda ",
  "31 yoshda ",
  "22 yoshda ",
  "25 yoshda ",
  "18 yoshda ",
  "26 yoshda ",
  "24 yoshda ",
  "33 yoshda ",
  "19 yoshda ",
  "24 yoshda ",
];

List<double> barberRating = [1, 2, 4, 4.5, 5.5, 6, 3, 4, 4, 5];
