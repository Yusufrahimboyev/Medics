import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/style/app_icons.dart';
import 'package:medics/src/common/style/app_images.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/online_pharmacy/my_cart/widgets/item_card.dart';
import '../../../../common/widgets/success_dialog.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      appBar: AppBar(
        backgroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          context.lang.my_cart,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        leading: const CupertinoNavigationBarBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView(
                children: [
                  const ItemCard(
                    title: 'Bodrex Herbal',
                    price: '7.99',
                    imageUrl: AppImages.health,
                    capacity: '100ml',
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.lang.payment_detail,
                        style: context.textTheme.titleMedium?.copyWith(
                            color: context.colors.primary,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            context.lang.subtotal,
                            style: context.textTheme.titleMedium?.copyWith(
                                color: context.colors.onPrimaryFixedVariant,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Text(
                            "\$60.00",
                            style: context.textTheme.titleMedium?.copyWith(
                                color: context.colors.primary,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            context.lang.taxes,
                            style: context.textTheme.titleMedium?.copyWith(
                                color: context.colors.onPrimaryFixedVariant,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Text(
                            "\$01.00",
                            style: context.textTheme.titleMedium?.copyWith(
                                color: context.colors.primary,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            context.lang.total,
                            style: context.textTheme.titleMedium?.copyWith(
                                color: context.colors.primary,
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Text(
                            "\$61.00",
                            style: context.textTheme.titleMedium?.copyWith(
                                color: context.colors.onPrimaryContainer,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: context.colors.tertiary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.lang.payment_method,
                    style: context.textTheme.titleMedium?.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        width: 1,
                        color: context.colors.tertiary,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 22),
                      child: SizedBox(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(AppIcons.visa, height: 18),
                            Text(
                              context.lang.change,
                              style: context.textTheme.titleSmall?.copyWith(
                                  color: context.colors.onSecondary,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.lang.total,
                      style: context.textTheme.titleSmall?.copyWith(
                          color: context.colors.onPrimaryFixedVariant,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "\$61.00",
                      style: context.textTheme.titleMedium?.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Expanded(
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        context.colors.onPrimaryContainer),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => SuccessDialog(
                        route: AppRouter.main,
                        title: context.lang.back_home,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Text(
                      context.lang.checkout,
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
