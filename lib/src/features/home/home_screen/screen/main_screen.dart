import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/style/app_images.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/common/widgets/my_stack.dart';
import 'package:medics/src/features/home/home_screen/widgets/article_list.dart';
import '../../../../common/style/app_icons.dart';
import '../widgets/home_main_card.dart';
import '../widgets/top_doctor_list.dart';

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
                    child: InkWell(
                      onTap: () {
                        context.push(AppRouter.findDoctor);
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: context.colors.onPrimaryFixed,
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.search,
                                colorFilter: ColorFilter.mode(
                                    context.colors.onSecondary,
                                    BlendMode.srcATop),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                context.lang.Search_doctor_drugs,
                                style: context.textTheme.titleMedium?.copyWith(
                                    color: context.colors.onPrimaryFixedVariant,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MyStack(
                          function: () {},
                          text: context.lang.Doctor,
                          icons: AppIcons.doctor),
                      MyStack(
                          function: () {},
                          text: context.lang.pharmacy,
                          icons: AppIcons.pill),
                      MyStack(
                          function: () {},
                          text: context.lang.Hospital,
                          icons: AppIcons.hospital),
                      MyStack(
                          function: () {},
                          text: context.lang.Ambulance,
                          icons: AppIcons.ambulance),
                    ],
                  ),
                ],
              ),
            ),
            const HomeMainCard(),
            const TopDoctorList(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.lang.Health_article,
                    style: context.textTheme.titleLarge?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateColor.transparent,
                    ),
                    onPressed: () {
                      context.push(AppRouter.articles);
                    },
                    child: Text(
                      context.lang.See_all,
                      style: context.textTheme.titleMedium?.copyWith(
                          color: context.colors.onPrimaryContainer,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            ArticleList(
              image: AppImages.pills,
              title:
                  'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
              readTime: '5 min read',
              datetime: 'Jun 10, 2021 ',
            ),
          ],
        ),
      ),
    );
  }
}
