import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/style/app_images.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/common/widgets/my_stack.dart';
import 'package:medics/src/features/home/home_screen/widgets/article_list.dart';
import '../../../../common/style/app_icons.dart';
import '../../home_screen/widgets/home_main_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void onTap() async {
    final response =
        await context.dependencies.mainRepository.getDoctor(context: context);
    print(response);

  }
  void onTap2() async {
    final response2 =
    await context.dependencies.mainRepository.getArticles(context: context);
    print(response2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Padding(
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
                          InkWell(
                            onTap: () {


                              print("object");
                            },
                            overlayColor: WidgetStateColor.transparent,
                            child: SvgPicture.asset(
                              AppIcons.notification,
                              width: 28,
                              height: 28,
                              colorFilter: ColorFilter.mode(
                                  context.colors.primary, BlendMode.srcATop),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 22),
                      child: InkWell(
                        overlayColor: WidgetStateColor.transparent,
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
                                const SizedBox(
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
                            function: () {
                              context.push(AppRouter.findDoctor);
                            },
                            text: context.lang.Doctor,
                            icons: AppIcons.doctor),
                        MyStack(
                            function: () {
                              context.push(AppRouter.pharmacy);
                            },
                            text: context.lang.pharmacy,
                            icons: AppIcons.pill),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: HomeMainCard(
                buttonTitle: context.lang.learn,
                title: context.lang.Early_protection,
                imageUrl: AppImages.girl,
                onTap: () {},
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.lang.Top_Doctor,
                      style: context.textTheme.titleLarge?.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      overlayColor: WidgetStateColor.transparent,
                      onTap: () {
                        context.push(AppRouter.topDoctor);
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
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 210,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) => SizedBox(
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 18),
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
                                    style: context.textTheme.titleMedium
                                        ?.copyWith(
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
                                              SvgPicture.asset(
                                                AppIcons.star,
                                                height: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2),
                                                child: Text(
                                                  "4,7",
                                                  style: context
                                                      .textTheme.labelMedium
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
                                      SvgPicture.asset(
                                        AppIcons.location,
                                        height: 16,
                                      ),
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
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 10),
                    itemCount: 8,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
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
                      style: const ButtonStyle(
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
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) => const ArticleList(
                    image: AppImages.pills,
                    title:
                        'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
                    readTime: "5 min read",
                    datetime: "Jun 10, 2021",
                    isSaved: true,),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(

                  );
                },
                itemCount: 8),
          ),
        ),
      ),
    );
  }
}
