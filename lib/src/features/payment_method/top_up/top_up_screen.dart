import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';


import '../widgets/top_up_buttons.dart';

class TopUpScreen extends StatefulWidget {

  const TopUpScreen({super.key, });

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  late final TextEditingController controller;
  final _formatter = NumberFormat.currency(
    symbol: '\$',
    decimalDigits: 0,
    locale: "en",
  );

  void showText(String newText) {
    controller.text = newText;
  }

  void inputFormatter() {
    final text = controller.text.replaceAll(RegExp(r'\D'), '');
    if (text.isNotEmpty) {
      final value = double.parse(text);
      final formatted = _formatter.format(value);
      controller.value = controller.value.copyWith(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController()..addListener(inputFormatter);
  }

  @override
  void dispose() {
    controller
      ..dispose()
      ..removeListener(inputFormatter);
    super.dispose();
  }

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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Text(
                context.lang.enter,
                style: context.textTheme.titleMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colors.onPrimary,
                border: Border.all(width: 2, color: context.colors.primary),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: SizedBox(
                height: 120,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      cursorWidth: 1,
                      cursorColor: context.colors.onPrimary,
                      controller: controller,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      style: context.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(12)],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TopUpButtons(
                          onpress: showText,
                          title: 10000,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TopUpButtons(
                          onpress: showText,
                          title: 50000,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TopUpButtons(
                          onpress: showText,
                          title: 100000,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TopUpButtons(
                          onpress: showText,
                          title: 150000,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TopUpButtons(
                          onpress: showText,
                          title: 200000,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TopUpButtons(
                          onpress: showText,
                          title: 250000,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TopUpButtons(
                          onpress: showText,
                          title: 500000,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TopUpButtons(
                          onpress: showText,
                          title: 750000,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TopUpButtons(
                          onpress: showText,
                          title: 1000000,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: FilledButton(
                    style: ButtonStyle(
                      minimumSize: const WidgetStatePropertyAll(
                        Size(double.infinity, 50),
                      ),
                      backgroundColor:
                          WidgetStatePropertyAll(context.colors.primary),
                    ),
                    onPressed: () {

                      final int topup = int.parse(
                        controller.text
                            .replaceAll("\$", "")
                            .replaceAll(",", "")
                            .replaceAll(" ", ""),
                      );
                      context.push(AppRouter.topUp2, extra: topup);
                    },
                    child: Text(
                      context.lang.continui,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: context.colors.onPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
