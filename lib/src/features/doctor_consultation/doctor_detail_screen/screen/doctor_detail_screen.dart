import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/common/widgets/my_card.dart';
import 'package:medics/src/features/doctor_consultation/doctor_detail_screen/widgets/my_filtrchip.dart';
import '../../../../common/style/app_icons.dart';
import '../../../../common/style/app_images.dart';

class DoctorDetailScreen extends StatefulWidget {

    DoctorDetailScreen({super.key});

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  bool selected=true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: SvgPicture.asset(AppIcons.menyu),
          ),
        ],
        backgroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          context.lang.doctor_detail,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        leading: const CupertinoNavigationBarBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: MyCard(
                  title: "Dr. Marcus Horizon",
                  subtitle: "Chardiologist",
                  starPoint: "4,7",
                  distance: "5.7",
                  image: AppImages.man),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              context.lang.about,
              style: context.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...  ",
                    style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: context.colors.secondaryContainer),
                  ),
                  TextSpan(
                    text: context.lang.read_more,
                    style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: context.colors.onPrimaryContainer),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 64,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) => SizedBox(
                        width: 46,
                        height: 64,
                        child: FilterChip(
                          labelPadding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          side: BorderSide(
                            color: context.colors.tertiary,
                            width: 1,
                          ),
                          backgroundColor: context.colors.onPrimary,
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Wed",
                                style: context.textTheme.labelMedium?.copyWith(
                                    color:
                                        context.colors.onPrimaryFixedVariant),
                              ),
                              Text(
                                "10",
                                style: context.textTheme.titleMedium
                                    ?.copyWith(color: context.colors.primary),
                              ),
                            ],
                          ),
                          onSelected: (_) {},
                        ),
                      ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                        width: 10,
                      ),
                  itemCount: 30),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Divider(
                color: context.colors.tertiary,
              ),
            ),
            Column(
              children: [
                Row(

                  children: [
                    Expanded(
                      child: MyFiltrchip(
                          selected: selected,
                          time: "09:00 AM",
                          onTap: (_) {}),
                    ),

                    Expanded(
                      child: MyFiltrchip(
                          selected: selected,
                          time: "10:00 AM",
                          onTap: (_) {}),
                    ),
                    Expanded(
                      child: MyFiltrchip(
                          selected: selected,
                          time: "11:00 AM",
                          onTap: (_) {}),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyFiltrchip(
                          selected: selected,
                          time: "01:00 PM",
                          onTap: (_) {}),
                    ),
                    Expanded(
                      child: MyFiltrchip(
                          selected:selected ,
                          time: "02:00 AM",
                          onTap: (_) {}),
                    ),
                    Expanded(
                      child: MyFiltrchip(
                          selected: selected,
                          time: "03:00 AM",
                          onTap: (_) {}),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyFiltrchip(
                          selected: selected,
                          time: "04:00 AM",
                          onTap: (_) {}),
                    ),
                    Expanded(
                      child: MyFiltrchip(
                          selected: selected,
                          time: "05:00 AM",
                          onTap: (_) {}),
                    ),
                    Expanded(
                      child: MyFiltrchip(
                          selected: selected,
                          time: "06:00 AM",
                          onTap: (_) {}),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 90,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colors.tertiary,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(
                      child: SvgPicture.asset(
                        AppIcons.chat,
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        context.colors.onPrimaryContainer),
                  ),
                  onPressed: () {
                    context.push(AppRouter.booking);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Text(
                      context.lang.Book_Apointment,
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: context.colors.onPrimary),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
