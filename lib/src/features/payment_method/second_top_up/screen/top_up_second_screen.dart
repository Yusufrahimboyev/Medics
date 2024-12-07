import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medics/src/common/style/app_images.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import 'package:medics/src/features/payment_method/widgets/top_up_dialog.dart';

import '../../../../common/constants/constants.dart';
import '../../widgets/radiolist.dart';
import '../bloc/second_top_up_bloc.dart';

class TopUpSecondScreen extends StatefulWidget {
  final int topup;

  const TopUpSecondScreen({super.key, required this.topup});

  @override
  State<TopUpSecondScreen> createState() => _TopUpSecondScreenState();
}

class _TopUpSecondScreenState extends State<TopUpSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: const CupertinoNavigationBarBackButton(),
        title: Text(
          context.lang.top_up_ewallet,
          style: context.textTheme.titleLarge?.copyWith(
              color: context.colors.primary, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocBuilder<SecondTopUpBloc, SecondTopUpState>(
          builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Radiolist(
                    onChanged: (int? v) {
                      context
                          .read<SecondTopUpBloc>()
                          .add(ChangeRadioList$SecondTopUpEvent(v: v));
                    },
                    title: "Paypal",
                    value: 0,
                    groupValue: state.isSelect,
                    isIcon: false,
                    image: AppImages.paypal),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Radiolist(
                  title: "Google Pay",
                  value: 1,
                  groupValue: state.isSelect,
                  isIcon: false,
                  image: AppImages.google,
                  onChanged: (int? v) {
                    context
                        .read<SecondTopUpBloc>()
                        .add(ChangeRadioList$SecondTopUpEvent(v: v));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Radiolist(
                  title: "Apple Pay",
                  value: 2,
                  groupValue: state.isSelect,
                  isIcon: false,
                  image: AppImages.apple,
                  onChanged: (int? v) {
                    context
                        .read<SecondTopUpBloc>()
                        .add(ChangeRadioList$SecondTopUpEvent(v: v));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Radiolist(
                  title: "**** **** **** ****",
                  value: 3,
                  groupValue: state.isSelect,
                  isIcon: false,
                  image: AppImages.mastercard,
                  onChanged: (int? v) {
                    context.read<SecondTopUpBloc>().add(
                          ChangeRadioList$SecondTopUpEvent(v: v),
                        );
                  },
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 100,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: context.colors.onPrimary,
                width: 0.1,
                style: BorderStyle.solid,
              ),
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
              bottomRight: Radius.circular(0),
              bottomLeft: Radius.circular(0),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(context.colors.primary),
                  minimumSize: const WidgetStatePropertyAll(
                    Size(double.infinity, 50),
                  ),
                ),
                child: Text(
                  context.lang.continui,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colors.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () async {
                  int mainBalance =
                      context.dependencies.shp.getInt(Constants.balance) ?? 0;
                  mainBalance += widget.topup;
                  await context.dependencies.shp
                      .setInt(Constants.balance, mainBalance);
                  if (context.mounted) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            MyDialog(topup: widget.topup));
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
