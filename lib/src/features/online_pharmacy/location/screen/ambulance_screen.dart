import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({super.key});

  @override
  State<AmbulanceScreen> createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
  final mapController = Completer<YandexMapController>();
  final Point point=Point(latitude: 41.341391, longitude: 69.286517);

  void goTocurrentPosition() async {
    final controller = await mapController.future;
    controller.moveCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: point, zoom: 16)));
    controller.moveCamera(CameraUpdate.zoomTo(16));
  }
  String? locationMessage = "Fetching location...";


  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;


    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location xizmatlari o'chirilgan.");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location ruxsati rad etildi.");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location ruxsati doimiy rad etilgan.");
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );

    print('eni: ${position.latitude}, boyi: ${position.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      appBar: AppBar(
        backgroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: const CupertinoNavigationBarBackButton(),
        title: Text(
          context.lang.ambulance,
          style: context.textTheme.titleLarge?.copyWith(
              color: context.colors.primary, fontWeight: FontWeight.w600),
        ),
      ),
      body: YandexMap(
        onMapCreated: (YandexMapController controller) {
          mapController.complete(controller);
          controller.moveCamera(
            CameraUpdate.newGeometry(
              Geometry.fromPoint(point),
            ),
          );
          controller.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: Point(longitude: 41.341391, latitude: 69.286517),
                  zoom: 16),
            ),
          );
          controller.moveCamera(
            CameraUpdate.zoomTo(16),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            backgroundColor: context.colors.primary,
            onPressed: goTocurrentPosition,
            child: const Icon(CupertinoIcons.location),
          ),
        ],
      ),
    );
  }
}
