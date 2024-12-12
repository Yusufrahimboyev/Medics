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
  final List<MapObject> mapObjects = [];
  Point? userPoint;

  Future<void> goToCurrentPosition() async {
    final controller = await mapController.future;

    try {
      Position position = await _getCurrentLocation();
      userPoint = Point(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      setState(() {
        mapObjects.clear();
        mapObjects.add(
          PlacemarkMapObject(
            mapId: const MapObjectId('user_location'),
            point: userPoint!,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  'assets/images/dori.png',
                ),
                rotationType: RotationType.rotate,
                scale: 1,
                zIndex: 1,
                anchor: const Offset(0.5, 0.5),
              ),
            ),
          ),
        );
      });

      controller.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: userPoint!, zoom: 16),
        ),
      );
    } catch (e) {
      debugPrint('Error fetching location: $e');
    }
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location xizmatlari o'chirilgan.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location ruxsati rad etildi.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location ruxsati doimiy rad etilgan.");
    }

    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );
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
        },
        mapObjects: mapObjects,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.colors.primary,
        onPressed: goToCurrentPosition,
        child: const Icon(CupertinoIcons.location),
      ),
    );
  }
}
