import 'package:alaska_barber/data/kerakli_listlar/keralki_listlar.dart';
import 'package:alaska_barber/screens/barbers_info/barber_info.dart';
import 'package:alaska_barber/utils/colors/app_colors.dart';
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
    barbers.sort((a, b) => b.skills.compareTo(a.skills));
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
          children: List.generate(
            barbers.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BarberInfo(
                      userModel: barbers[index],
                    );
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
                            barbers[index].image,
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
                                "${barbers[index].name} ${barbers[index].surname}",
                                style:
                                    const TextStyle(color: AppColors.cAFECFE),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "${barbers[index].age} yoshda",
                              style: const TextStyle(color: AppColors.cAFECFE),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "${barbers[index].workExperience} yillik tajribaga ega",
                              style: const TextStyle(color: AppColors.cAFECFE),
                            ),
                            const SizedBox(height: 10),
                            RatingBar.builder(
                              ignoreGestures: true,
                              itemSize: 18,
                              initialRating: barbers[index].skills,
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
          ),
        ),
      ),
    );
  }
}
