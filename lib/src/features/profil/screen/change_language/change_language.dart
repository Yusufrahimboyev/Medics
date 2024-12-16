import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      appBar: AppBar(
        backgroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        leading: const CupertinoNavigationBarBackButton(),
        centerTitle: true,
        title: Text(
          context.lang.language,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          RadioListTile<int>(
            activeColor: context.colors.primary,
            title: Text(
              "English",
              style: context.textTheme.bodyLarge,
            ),
            value: 0,
            groupValue: 1,
            onChanged: (_) {},
          ),
          RadioListTile<int>(
            activeColor: context.colors.primary,
            title: Text(
              "O'zbekcha",
              style: context.textTheme.bodyLarge,
            ),
            value: 0,
            groupValue: 1,
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
