import 'package:flutter/material.dart';
import 'package:medics/src/common/dependency/dependency.dart';

import '../l10n/generated/l10n.dart';
import '../widgets/my_app_scope.dart';

extension ContextExtension on BuildContext {
  S get lang => S.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colors => Theme.of(this).colorScheme;

  AppDependency get dependencies =>
      findAncestorStateOfType<MyAppScopeState>()!.dependency;
}
