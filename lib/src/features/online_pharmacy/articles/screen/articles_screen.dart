import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/src/common/style/app_images.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/home/home_screen/widgets/article_list.dart';
import 'package:medics/src/features/online_pharmacy/articles/widgets/trending_articles_list.dart';
import '../../../../common/style/app_icons.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          context.lang.arcticles,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        leading: const CupertinoNavigationBarBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 33),
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
                        hintText: context.lang.Search_articles,
                        hintStyle: context.textTheme.bodyMedium?.copyWith(
                            color: context.colors.onPrimaryFixedVariant),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.lang.Health_article,
                        style: context.textTheme.titleMedium?.copyWith(
                            color: context.colors.primary,
                            fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        style: const ButtonStyle(
                          overlayColor: WidgetStateColor.transparent,
                        ),
                        onPressed: () {},
                        child: Text(
                          context.lang.See_all,
                          style: context.textTheme.titleSmall?.copyWith(
                              color: context.colors.onPrimaryContainer,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => const TrendingArticlesList(
                              title: 'Covid-19',
                              subtitle:
                                  'Comparing the AstraZeneca and Sinovac COVID-19 Vaccines',
                              date: 'Jun 12, 2021',
                              readTime: '6 min read',
                              image: AppImages.articles,
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 10,
                            ),
                        itemCount: 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.lang.related_articles,
                        style: context.textTheme.titleMedium?.copyWith(
                            color: context.colors.primary,
                            fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        style: const ButtonStyle(
                          overlayColor: WidgetStateColor.transparent,
                        ),
                        onPressed: () {},
                        child: Text(
                          context.lang.See_all,
                          style: context.textTheme.titleSmall?.copyWith(
                              color: context.colors.onPrimaryContainer,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  for(int i=0;i<10;i++)
                    const ArticleList(
                      image: AppImages.pills,
                      title:
                      "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist whiwuhef9uwhefowei ekfinhiouweb",
                      readTime: "5min read",
                      datetime: "Jun 10, 2021 ",
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
