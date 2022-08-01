/*
 * @author Noor Bhatia
 * Created on 27-07-2022
 */
part of 'custom_theme.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: TextTheme(
    headline1: CustomTextStyles.headline1,
    headline2: CustomTextStyles.headline2,
    headline3: CustomTextStyles.headline3,
    headline4: CustomTextStyles.headline4,
    headline5: CustomTextStyles.headline5,
    headline6: CustomTextStyles.headline6,
    subtitle1: CustomTextStyles.subtitle1,
    subtitle2: CustomTextStyles.subtitle2,
    caption: CustomTextStyles.caption,
    bodyText1: CustomTextStyles.bodyText1,
    bodyText2: CustomTextStyles.bodyText2,
    button: CustomTextStyles.button,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: AppColors.orange,
  appBarTheme: const AppBarTheme(
    color: AppColors.black,
  ),
  scaffoldBackgroundColor: AppColors.orange,
  textTheme: TextTheme(
    headline1: CustomTextStyles.headline1.convertToDark(),
    headline2: CustomTextStyles.headline2.convertToDark(),
    headline3: CustomTextStyles.headline3.convertToDark(),
    headline4: CustomTextStyles.headline4.convertToDark(),
    headline5: CustomTextStyles.headline5.convertToDark(),
    headline6: CustomTextStyles.headline6.convertToDark(AppColors.orange),
    subtitle1: CustomTextStyles.subtitle1.convertToDark(),
    subtitle2: CustomTextStyles.subtitle2.convertToDark(),
    caption: CustomTextStyles.caption.convertToDark(AppColors.orange),
    bodyText1: CustomTextStyles.bodyText1.convertToDark(),
    bodyText2: CustomTextStyles.bodyText2.convertToDark(),
    button: CustomTextStyles.button.convertToDark(),
  ),
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(Colors.grey),
    thumbColor: MaterialStateProperty.all<Color>(Colors.white),
  ),
);
