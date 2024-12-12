import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/src/common/style/app_icons.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/common/widgets/my_stack.dart';
import 'package:medics/src/features/doctor_consultation/find_doctor_screen/widgets/recommended_doctors.dart';
import '../../../../common/style/app_images.dart';

class FindDoctorScreen extends StatefulWidget {
  const FindDoctorScreen({super.key});

  @override
  State<FindDoctorScreen> createState() => _FindDoctorScreenState();
}

class _FindDoctorScreenState extends State<FindDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        leading: const CupertinoNavigationBarBackButton(),
        centerTitle: true,
        title: Text(
          context.lang.Find_Doctors,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: ListView(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: context.colors.onPrimaryFixed,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      AppIcons.search,
                      width: 18,
                      colorFilter: ColorFilter.mode(
                          context.colors.onSecondary, BlendMode.srcATop),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: context.lang.Find_a_doctor,
                        hintStyle: context.textTheme.bodyMedium?.copyWith(
                            color: context.colors.onPrimaryFixedVariant),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              context.lang.Category,
              style: context.textTheme.titleMedium?.copyWith(
                  color: context.colors.primary, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: MyStack(
                      function: () {},
                      text: context.lang.General,
                      icons: AppIcons.doctor),
                ),
                Expanded(
                  child: MyStack(
                      function: () {},
                      text: context.lang.Lungs_Specialist,
                      icons: AppIcons.lungs),
                ),
                Expanded(
                  child: MyStack(
                      function: () {},
                      text: context.lang.Dentist,
                      icons: AppIcons.tooth),
                ),
                Expanded(
                  child: MyStack(
                      function: () {},
                      text: context.lang.Psychiatrist,
                      icons: AppIcons.buble),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                MyStack(
                    function: () {},
                    text: context.lang.Covid_19,
                    icons: AppIcons.virus),
                const SizedBox(
                  width: 24,
                ),
                MyStack(
                    function: () {},
                    text: context.lang.Surgeon,
                    icons: AppIcons.shprist),
                const SizedBox(width: 17),
                MyStack(
                    function: () {},
                    text: context.lang.Cardiologist,
                    icons: AppIcons.cardiologist),
              ],
            ),
            const SizedBox(height: 26),
            Text(
              context.lang.Recommended_Doctors,
              style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600, color: context.colors.primary),
            ),
            const SizedBox(height: 12),
            const RecommendedDoctors(
              title: 'Dr. Marcus Horizon',
              job: 'Chardiologist',
              stars: '4,7',
              distance: '800 m',
              image: AppImages.man,
            ),
            const SizedBox(height: 16),
            Text(
              context.lang.recent_doctors,
              style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600, color: context.colors.primary),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(88),
                          ),
                          child: Image(
                            image: AssetImage(AppImages.man),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Dr. Marcus",
                        style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: context.colors.primary),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 12,
                ),
                itemCount: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
