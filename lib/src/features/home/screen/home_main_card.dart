import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/src/common/style/app_images.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class HomeMainCard extends StatelessWidget {
  const HomeMainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colors.tertiary,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: SizedBox(
          height: 200,
          width: double.infinity,
          child: Stack(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.red,
                radius: 65,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 45,
                ),
              ),
              Positioned(
                left: 30,
                top: 50,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
