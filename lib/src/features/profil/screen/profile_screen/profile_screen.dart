import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/profil/widgets/log_out_dialog.dart';
import 'package:medics/src/features/profil/widgets/profile_list.dart';

import '../../../../common/style/app_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: [
         PopupMenuButton(itemBuilder: (BuildContext context){
           return[
             PopupMenuItem(child: Text(context.lang.edit_profile),onTap: (){

             },),
             PopupMenuItem(child: Text(context.lang.language),onTap: (){},),
             PopupMenuItem(child: Text(context.lang.app_info ),onTap: (){},),
           ];
         }),
        ],
        backgroundColor: context.colors.onTertiaryFixedVariant,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: context.colors.onPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            DecoratedBox(
              decoration:
                  BoxDecoration(color: context.colors.onTertiaryFixedVariant),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: context.colors.primary,
                          radius: 60,
                        ),
                        Positioned(
                          top: 94,
                          left: 90,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: context.colors.onPrimary,
                            child: SvgPicture.asset(
                              AppIcons.camera,
                              width: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Your name",
                        style: context.textTheme.titleLarge?.copyWith(
                            color: context.colors.onPrimary,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  color: context.colors.onPrimary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  children: [
                    ProfileList(
                      icon: AppIcons.notsaved,
                      title: context.lang.my_saved,
                      function: () {},
                    ),
                    Divider(
                      color: context.colors.tertiary,
                    ),
                    ProfileList(
                      icon: AppIcons.document,
                      title: context.lang.appointmnet,
                      function: () {},
                    ),
                    Divider(
                      color: context.colors.tertiary,
                    ),
                    ProfileList(
                      icon: AppIcons.wallet,
                      title: context.lang.payment_method,
                      function: () {
                        context.push(AppRouter.wallet);
                      },
                    ),
                    Divider(
                      color: context.colors.tertiary,
                    ),
                    ProfileList(
                      icon: AppIcons.faq,
                      title: context.lang.faqs,
                      function: () {
                      },
                    ),
                    Divider(
                      color: context.colors.tertiary,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  const LogOutDialog());
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: context.colors.tertiary,
                              child: SvgPicture.asset(AppIcons.logout),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              context.lang.logout,
                              style: context.textTheme.titleLarge?.copyWith(
                                  color: context.colors.error,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            SvgPicture.asset(AppIcons.arrowRight),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
