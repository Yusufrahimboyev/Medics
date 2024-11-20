import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/home/home_screen/screen/widgets/home_main_card.dart';
import 'package:medics/src/features/home/home_screen/screen/widgets/top_doctor_list.dart';

import '../../../../common/style/app_icons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            context.lang.Find_desire_healt,
                            style: context.textTheme.headlineSmall?.copyWith(
                                color: context.colors.primary,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          AppIcons.notification,
                          width: 28,
                          height: 28,
                          colorFilter: ColorFilter.mode(
                              context.colors.primary, BlendMode.srcATop),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 22),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.colors.onPrimaryFixed,
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12,),
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            hintText: context.lang.Search_doctor_drugs,
                            hintStyle: context.textTheme.bodyLarge?.copyWith(
                              color: context.colors.onPrimaryFixedVariant,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                AppIcons.search,
                                colorFilter: ColorFilter.mode(
                                    context.colors.onSecondary,
                                    BlendMode.srcATop),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          cursorWidth: 2,
                          cursorColor: Colors.black,
                          textInputAction: TextInputAction.none,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: context.colors.onPrimary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: context.colors.onSecondary
                                      .withOpacity(0.4),
                                  offset: const Offset(12, 12),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                            child: SizedBox(height: 54, width: 54,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(AppIcons.doctor,),
                              ),
                            ),
                          ),
                          Text(
                            context.lang.Doctor,
                            style: context.textTheme.bodyLarge?.copyWith(
                                color: context.colors.onPrimaryFixedVariant,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: context.colors.onPrimary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: context.colors.onSecondary
                                      .withOpacity(0.4),
                                  offset: const Offset(12, 12),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                            child: SizedBox(height: 54, width: 54,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(AppIcons.pill,),
                              ),
                            ),
                          ),
                          Text(
                            context.lang.Doctor,
                            style: context.textTheme.bodyLarge?.copyWith(
                                color: context.colors.onPrimaryFixedVariant,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: context.colors.onPrimary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: context.colors.onSecondary
                                      .withOpacity(0.4),
                                  offset: const Offset(12, 12),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                            child: SizedBox(height: 54, width: 54,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(AppIcons.hospital,),
                              ),
                            ),
                          ),
                          Text(
                            context.lang.Doctor,
                            style: context.textTheme.bodyLarge?.copyWith(
                                color: context.colors.onPrimaryFixedVariant,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: context.colors.onPrimary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: context.colors.onSecondary
                                      .withOpacity(0.4),
                                  offset: const Offset(12, 12),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                            child: SizedBox(height: 54, width: 54,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(AppIcons.ambulance,),
                              ),
                            ),
                          ),
                          Text(
                            context.lang.Doctor,
                            style: context.textTheme.bodyLarge?.copyWith(
                                color: context.colors.onPrimaryFixedVariant,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),


                    ],
                  ),
                ],
              ),
            ),
            const HomeMainCard(),
            const TopDoctorList(),

          ],
        ),
      ),
    );
  }
}
