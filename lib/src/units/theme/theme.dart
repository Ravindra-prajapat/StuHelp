import 'package:application1/src/units/theme/widget_themes/elevated_button_theme.dart';
import 'package:application1/src/units/theme/widget_themes/outlined_button_theme.dart';
import 'package:application1/src/units/theme/widget_themes/text_field_theme.dart';
import 'package:application1/src/units/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._(); // private constructor

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormDieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark, textTheme: TTextTheme.darkTextTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: TTextFormDieldTheme.darkInputDecorationTheme,
      );
      
}
