import 'package:alaska_barber/screens/barbers_info/barber_info.dart';
import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:flutter/material.dart';

class Barbers extends StatefulWidget {
  const Barbers({super.key});

  @override
  State<Barbers> createState() => _BarbersState();
}

class _BarbersState extends State<Barbers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Masterlar ro'yxati"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              10,
              (index) => InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return BarberInfo();
                  }));
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.cyan,
                    ),
                    width: double.infinity,
                    height: 400,
                    child:Column(
                      children: [

                        SizedBox(height: 10,),

                        Image.asset(AppImages.person1,width: 200,height: 250,),
                        Text("Salimov Abdushukir",style: TextStyle(
                            color: Colors.white
                        )),
                        SizedBox(height: 10,),
                        Text("3 yillik tajribaga ega ",style: TextStyle(
                            color: Colors.white
                        ),),
                      ],
                    )
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
