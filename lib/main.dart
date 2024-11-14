import 'package:flutter/material.dart';
import 'package:medics/src/common/widgets/initialize_app.dart';
import 'package:medics/src/common/widgets/my_app_scope.dart';

import 'src/common/widgets/my_app.dart';

void main() async {
  final dependency = await InitializeApp().initialize();
  runApp(
    MyAppScope(
      dependency: dependency,
      child: const MyApp(),
    ),
  );
}
