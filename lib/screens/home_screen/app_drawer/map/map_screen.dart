import 'package:alaska_barber/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const alaskaBarber = Point(latitude: 39.6540694,longitude: 66.9557855);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
      ),
      body: YandexMap(
        mapObjects: [
          PlacemarkMapObject(
            opacity: 1,
            mapId: const MapObjectId("branchLocation"),
            point: alaskaBarber,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  AppImages.barberLocation,
                ),
                scale: 2.5,
              ),
            ),
          ),
        ],
        onMapCreated: (YandexMapController controller) {
          controller.moveCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                target:alaskaBarber,
                zoom: 18,
              ),
            ),
          );
        },
      ),
    );
  }
}
