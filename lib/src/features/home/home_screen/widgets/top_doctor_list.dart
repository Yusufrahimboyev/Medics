import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/src/common/style/app_icons.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class TopDoctorList extends StatefulWidget {
  const TopDoctorList({super.key});

  @override
  State<TopDoctorList> createState() => _TopDoctorListState();
}

class _TopDoctorListState extends State<TopDoctorList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.lang.Top_Doctor,
                style: context.textTheme.titleLarge?.copyWith(
                    color: context.colors.primary, fontWeight: FontWeight.w600),
              ),
              Text(
                context.lang.See_all,
                style: context.textTheme.titleMedium?.copyWith(
                    color: context.colors.onPrimaryContainer,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 210,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for(int i=0;i<10;i++)
                SizedBox(
                  width: 148,
                  child: Card(
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        side: BorderSide(
                          color: context.colors.tertiary,
                        )),
                    color: context.colors.onPrimary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 18),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: context.colors.primary,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dr. Marcus Horizon",
                                style: context.textTheme.titleMedium?.copyWith(
                                    color: context.colors.primary,
                                    fontWeight: FontWeight.w600),
                                maxLines: 1,
                              ),
                              Text(
                                "Chardiologist",
                                style: context.textTheme.titleSmall?.copyWith(
                                    color:
                                        context.colors.onPrimaryFixedVariant),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: context.colors.tertiary,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(4),
                                      ),

                                    ),
                                    child: SizedBox(
                                      height: 22,
                                      width: 36,
                                      child: Row(

                                        children: [
                                          SvgPicture.asset(AppIcons.star,height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 2),
                                            child: Text(
                                              "4,7",
                                              style: context.textTheme.labelMedium
                                                  ?.copyWith(
                                                      color: context.colors
                                                          .onPrimaryContainer,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  SvgPicture.asset(AppIcons.location,height: 16,),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    "700m away",
                                    style: context.textTheme.labelSmall
                                        ?.copyWith(
                                            color: context.colors.onSecondary,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
