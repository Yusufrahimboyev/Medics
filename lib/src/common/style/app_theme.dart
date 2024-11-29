import 'package:flutter/material.dart';

class AppTheme{
  const AppTheme._();
  static ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    fontFamily: "Inter"
  );
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
  );
}
/// Light [ColorScheme] made with FlexColorScheme v8.0.0.

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff101623),// text color
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffF5F7FF),
  onPrimaryContainer: Color(0xff199A8E),//main_color
  primaryFixed: Color(0xffF9FAFB),//textform_field
  primaryFixedDim: Color(0xffFF5C5C),//error_Color
  onPrimaryFixed: Color(0xffE5E7EB),//border_color
  onPrimaryFixedVariant: Color(0xffA1A8B0),//text_color
  secondary: Color(0xffA1A8B0),//container_Color
  onSecondary: Color(0xffADADAD),//search_color
  secondaryContainer: Color(0xffA1A8B0),// skip text color
  onSecondaryContainer: Color(0xff000000),
  secondaryFixed: Color(0xff717784),// login enjoy text
  secondaryFixedDim: Color(0xffb2c0be),
  onSecondaryFixed: Color(0xff171e1d),
  onSecondaryFixedVariant: Color(0xff3B4453),// check box
  tertiary: Color(0xffE8F3F1),//card_color
  onTertiary: Color(0xffE5E7EB),// border color logos
  tertiaryContainer: Color(0xffD3D6DA),// border color 2
  onTertiaryContainer: Color(0xff000000),
  tertiaryFixed: Color(0xffd4dce4),
  tertiaryFixedDim: Color(0xffb0bdc9),
  onTertiaryFixed: Color(0xff19222a),
  onTertiaryFixedVariant: Color(0xff202a36),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff000000),
  surface: Color(0xfffcfcfc),
  onSurface: Color(0xff111111),
  surfaceDim: Color(0xffe0e0e0),
  surfaceBright: Color(0xfffdfdfd),
  surfaceContainerLowest: Color(0xffffffff),
  surfaceContainerLow: Color(0xfff8f8f8),
  surfaceContainer: Color(0xfff3f3f3),
  surfaceContainerHigh: Color(0xffededed),
  surfaceContainerHighest: Color(0xffe7e7e7),
  onSurfaceVariant: Color(0xff393939),
  outline: Color(0xff919191),
  outlineVariant: Color(0xffd1d1d1),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff2a2a2a),
  onInverseSurface: Color(0xfff1f1f1),
  inversePrimary: Color(0xff8ddcd5),
  surfaceTint: Color(0xff006a60),
);

/// Dark [ColorScheme] made with FlexColorScheme v8.0.0.
/// Requires Flutter 3.22.0 or later.
const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffffffff),
  onPrimary: Color(0xff000000),
  primaryContainer: Color(0xff005048),
  onPrimaryContainer: Color(0xffffffff),
  primaryFixed: Color(0xffbfe7e4),
  primaryFixedDim: Color(0xff8cd2cb),
  onPrimaryFixed: Color(0xff000605),
  onPrimaryFixedVariant: Color(0xff001815),
  secondary: Color(0xffaeccce),
  onSecondary: Color(0xff000000),
  secondaryContainer: Color(0xff304b4d),
  onSecondaryContainer: Color(0xffffffff),
  secondaryFixed: Color(0xffd6dedd),
  secondaryFixedDim: Color(0xffb2c0be),
  onSecondaryFixed: Color(0xff171e1d),
  onSecondaryFixedVariant: Color(0xff1e2827),
  tertiary: Color(0xffc0c3ef),
  onTertiary: Color(0xff000000),
  tertiaryContainer: Color(0xff404468),
  onTertiaryContainer: Color(0xffffffff),
  tertiaryFixed: Color(0xffd4dce4),
  tertiaryFixedDim: Color(0xffb0bdc9),
  onTertiaryFixed: Color(0xff19222a),
  onTertiaryFixedVariant: Color(0xff202a36),
  error: Color(0xffffb4ab),
  onError: Color(0xff000000),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffffff),
  surface: Color(0xff080808),
  onSurface: Color(0xfff1f1f1),
  surfaceDim: Color(0xff060606),
  surfaceBright: Color(0xff2c2c2c),
  surfaceContainerLowest: Color(0xff010101),
  surfaceContainerLow: Color(0xff0e0e0e),
  surfaceContainer: Color(0xff151515),
  surfaceContainerHigh: Color(0xff1d1d1d),
  surfaceContainerHighest: Color(0xff282828),
  onSurfaceVariant: Color(0xffcacaca),
  outline: Color(0xff777777),
  outlineVariant: Color(0xff414141),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xffe8e8e8),
  onInverseSurface: Color(0xff2a2a2a),
  inversePrimary: Color(0xff2b615a),
  surfaceTint: Color(0xff53dbca),
);
