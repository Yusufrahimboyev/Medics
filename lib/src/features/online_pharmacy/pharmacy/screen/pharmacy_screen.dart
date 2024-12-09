import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/src/common/style/app_images.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/online_pharmacy/pharmacy/widgets/pharmacy_card.dart';
import 'package:medics/src/features/online_pharmacy/pharmacy/widgets/popular_product_list.dart';
import 'package:medics/src/features/online_pharmacy/pharmacy/widgets/product_onsale_list.dart';
import '../../../../common/style/app_icons.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: SvgPicture.asset(AppIcons.socet),
          ),
        ],
        backgroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          context.lang.pharmacy,
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
                        hintText: context.lang.Find_a_doctor,
                        hintStyle: context.textTheme.bodyMedium?.copyWith(
                            color: context.colors.onPrimaryFixedVariant),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 24),
                  const PharmacyCard(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.lang.popular_product,
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
                    height: 165,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            const PopularProductList(
                              imageUrl: AppImages.dori,
                              title: "Panadol",
                              count: '20 pc',
                              price: '100',
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
                        context.lang.product_on_sale,
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
                    height: 165,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            const ProductOnsaleList(
                              imageUrl: AppImages.health,
                              title: 'OBH Combi',
                              capacity: '75ml',
                              price: '9.99',
                              discount: '10.99',
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 10,
                            ),
                        itemCount: 10),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
