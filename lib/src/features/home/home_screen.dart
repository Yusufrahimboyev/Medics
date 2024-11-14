import 'package:flutter/material.dart';
import 'package:medics/src/common/utils/context_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.onPrimary,
      body: Column(
        children: [
          Row(
            children: [
              Text(
                "1234",
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colors.primary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
