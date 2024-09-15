import 'package:alaska_barber/screens/barbers/barbers.dart';
import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alaskaga xush kelibsiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: [
            Image.asset(
              AppImages.barber45,
              width: 250,
              height: 250,
            ),
            SizedBox(height: 10,),

            Text(
                "Alaska samarqanddagi top 10 talikdagi erkaklar sartarosh xonasi bo'lib siz bu yerda istalgan soch turmagingizni qilish imkoniga egasiz"),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red
              ),
                child: TextButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return Barbers();
                  }));
                }, child: Text("Masterlar royxati"))),

          ],
        ),
      ),
    );
  }
}
