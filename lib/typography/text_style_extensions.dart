part of 'text_styles.dart';

extension TextStyleExtension on TextStyle {
  TextStyle withOpacity(double opacity) {
    return copyWith(color: color!.withOpacity(opacity));
  }

  TextStyle withColor(Color newColor) {
    return copyWith(color: newColor);
  }
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }
}

extension DarkTextThemeExtension on TextStyle {
  TextStyle convertToDark([Color? darkThemeColor]) {
    return copyWith(
      color: darkThemeColor ?? Colors.white,
    );
  }
}

extension FontFamily on TextStyle {
  TextStyle get roboto {
    return copyWith(fontFamily: 'Roboto');
  }

  TextStyle get arial {
    return copyWith(fontFamily: 'Arial');
  }
}

extension FontWeightExtension on TextStyle {
  TextStyle get bold {
    return copyWith(fontWeight: CustomFontWeights.bold);
  }

  TextStyle get medium {
    return copyWith(fontWeight: CustomFontWeights.medium);
  }
}
