import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';


class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({super.key});

  @override
  State<AmbulanceScreen> createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
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
        onMapCreated: (YandexMapController controller) {},

      ),
    );
  }
}
