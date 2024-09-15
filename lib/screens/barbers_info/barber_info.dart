import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:flutter/material.dart';

class BarberInfo extends StatefulWidget {
  const BarberInfo({super.key});

  @override
  State<BarberInfo> createState() => _BarberInfoState();
}

class _BarberInfoState extends State<BarberInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Palonchayev Pistoncha"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.cyan,
              ),
              width: double.infinity,
              height: 400,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Image.asset(
                    AppImages.person1,
                    width: 200,
                    height: 250,
                  ),
                  const Text("Salimov Abdushukir",
                      style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 10),
                  const Text(
                    "3 yillik tajribaga ega ",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            Container(
              height: 300,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                padding: EdgeInsets.all(10.0),
                children: List.generate(6, (index) {
                  return Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Element $index',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
