import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class MySavedScreen extends StatelessWidget {
  const MySavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      appBar: AppBar(
        backgroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        leading: const CupertinoNavigationBarBackButton(),
        centerTitle:   true,
        title: Text(
          context.lang.my_saved,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
