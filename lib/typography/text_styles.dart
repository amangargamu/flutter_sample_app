import 'package:bigspoon_foods/utils/app_colors.dart';
import 'package:flutter/material.dart';

part 'font_weights.dart';
part 'text_style_extensions.dart';

abstract class CustomTextStyles {
  static TextStyle get baseTextStyle => TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.black,
        fontWeight: CustomFontWeights.medium,
      );

  static TextStyle get headline1 {
    return baseTextStyle.copyWith(fontSize: 40);
  }

  static TextStyle get headline2 {
    return baseTextStyle.copyWith(
      fontSize: 17,
      fontWeight: CustomFontWeights.bold,
    );
  }

  static TextStyle get headline3 {
    return baseTextStyle.copyWith(fontSize: 36);
  }

  static TextStyle get headline4 {
    return baseTextStyle.copyWith(fontSize: 34);
  }

  static TextStyle get headline5 {
    return baseTextStyle.copyWith(fontSize: 30);
  }

  static TextStyle get headline6 {
    return baseTextStyle.copyWith(fontSize: 28);
  }

  static TextStyle get subtitle1 {
    return baseTextStyle.copyWith(
      fontSize: 18,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle get subtitle2 {
    return baseTextStyle.copyWith(
      fontSize: 16,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle get caption {
    return baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: CustomFontWeights.bold,
    );
  }

  static TextStyle get bodyText1 {
    return baseTextStyle.copyWith(
      fontSize: 18,
    );
  }

  static TextStyle get bodyText2 {
    return baseTextStyle.copyWith(
      fontSize: 16,
    );
  }

  static TextStyle get button {
    return baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: CustomFontWeights.bold,
    );
  }
}
