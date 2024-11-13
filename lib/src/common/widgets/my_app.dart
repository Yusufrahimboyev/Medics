import 'package:flutter/material.dart';
import 'package:medics/src/common/router/app_router.dart';
import 'package:medics/src/common/style/app_theme.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../l10n/generated/l10n.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      locale: Locale(context.dependencies.locale),
      localizationsDelegates: const [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("ru"),
        Locale("uz"),
      ],
      theme: context.dependencies.theme ? AppTheme.light : AppTheme.dark,
    );
  }
}
