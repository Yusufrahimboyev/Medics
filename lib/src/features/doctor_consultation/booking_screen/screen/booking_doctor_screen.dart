import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/doctor_consultation/booking_screen/widgets/date_reason.dart';
import 'package:medics/src/features/doctor_consultation/doctor_detail_screen/widgets/success_dialog.dart';
import '../../../../common/style/app_icons.dart';
import '../../../../common/style/app_images.dart';
import '../../../../common/widgets/my_card.dart';

class BookingDoctorScreen extends StatefulWidget {
  const BookingDoctorScreen({super.key});

  @override
  State<BookingDoctorScreen> createState() => _BookingDoctorScreenState();
}

class _BookingDoctorScreenState extends State<BookingDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading:  const CupertinoNavigationBarBackButton(

        ),
        title: Text(
          context.lang.appointmnet,
          style: context.textTheme.titleLarge?.copyWith(
              color: context.colors.primary, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: context.colors.onPrimary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 33),
            const MyCard(
                title: "Dr. Marcus Horizon",
                subtitle: "Chardiologist",
                starPoint: "4,7",
                distance: "800",
                image: AppImages.man),
            const SizedBox(
              height: 17,
            ),
            const DateReason(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.lang.payment_detail,
                  style: context.textTheme.titleMedium?.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      context.lang.consultation,
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
                      context.lang.admin_fee,
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
                Row(
                  children: [
                    Text(
                      context.lang.aditional_discount,
                      style: context.textTheme.titleMedium?.copyWith(
                          color: context.colors.onPrimaryFixedVariant,
                          fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    Text(
                      "-",
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
              color: context.colors.tertiary,
            ),
            Text(
              context.lang.payment_method,
              style: context.textTheme.titleMedium?.copyWith(
                  color: context.colors.primary, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 16,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                border: Border.all(
                  color: context.colors.tertiary,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppIcons.visa),
                    Text(
                      context.lang.change,
                      style: context.textTheme.titleSmall?.copyWith(
                          color: context.colors.onSecondary,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
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
                      builder: (BuildContext context) => const SuccessDialog(),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Text(
                      context.lang.booking,
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
