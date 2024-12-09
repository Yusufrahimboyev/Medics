import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medics/src/common/router/app_router.dart';

import 'package:medics/src/common/style/app_icons.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/payment_method/bloc/payment_bloc.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors.onPrimary,
        appBar: AppBar(
          backgroundColor: context.colors.onPrimary,
          scrolledUnderElevation: 0,
          centerTitle: true,
          leading: BackButton(
            onPressed: () => context.go(AppRouter.profile),
          ),
          title: Text(
            context.lang.payment_method,
            style: context.textTheme.titleLarge?.copyWith(
                color: context.colors.primary, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    context
                        .read<PaymentBloc>()
                        .add(ShowBalance$MyWalletEvent(context: context));
                  },
                  child: ListView(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: context.colors.secondary,
                        ),
                        child: SizedBox(
                          height: 210,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Unnamed User',
                                          style: context.textTheme.titleLarge
                                              ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      SvgPicture.asset(
                                        AppIcons.visa,
                                        colorFilter: ColorFilter.mode(
                                          context.colors.onPrimary,
                                          BlendMode.srcATop,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "**** **** **** ****",
                                  style: context.textTheme.titleMedium,
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  context.lang.your_balance,
                                  style: context.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BlocConsumer<PaymentBloc, PaymentState>(
                                          builder: (context, state) => Text(
                                                "\$ ${NumberFormat("#,###").format(state.wBalance)}",
                                                style: context
                                                    .textTheme.headlineSmall
                                                    ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                          listener: (BuildContext context,
                                                  PaymentState state) =>
                                              state.wBalance),
                                      FilledButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                            context.colors.onPrimary,
                                          ),
                                          padding: const WidgetStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                horizontal: 10),
                                          ),
                                        ),
                                        onPressed: () => {
                                          context.push(AppRouter.topUp1),
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: FaIcon(
                                                FontAwesomeIcons.download,
                                                color: context.colors.primary,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              context.lang.top_up,
                                              style: context
                                                  .textTheme.titleMedium
                                                  ?.copyWith(
                                                      color: context
                                                          .colors.primary,
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: context.colors.secondary,
                        ),
                        child: SizedBox(
                          height: 210,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.plus),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
