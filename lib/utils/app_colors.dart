import 'package:flutter/material.dart';

Color toColor(String? color) {
  var hexColor = color!.replaceAll('#', '');
  hexColor = 'FF$hexColor';
  return Color(int.parse('0x$hexColor'));
}

class AppColors extends MaterialColor {
  const AppColors(int primary, Map<int, Color> swatch) : super(primary, swatch);

  static const int primaryColorValue = 0xFFFFFFFF;

  static const primaryColor = Color(0xFFFFFFFF);

  static const colorTransparent = Color(0x00000000);

  //Snackbar color
  // static const snackBarColor = Color(0xff424242);
  static const snackBarRed = Color(0xffe53e3f);
  static const tomato = Color.fromARGB(255, 235, 73, 73);
  static const snackBarGreen = Color(0xff2dca73);
  static const mintGreenLight = Color.fromRGBO(66, 200, 112, 0.08);
  static const mintGreenLightDark = Color.fromRGBO(66, 200, 112, 0.2);
  static const mintGreen = Color.fromRGBO(66, 200, 112, 1);
  static const leafyGreen = Color.fromRGBO(79, 167, 53, 1);

  //White shades
  static const white = Color(0xFFFFFFFF);
  static const white11 = Color.fromRGBO(255, 255, 255, .11);
  static const offWhite = Color.fromRGBO(244, 244, 243, 1);
  static const whiteGrey = Color.fromRGBO(216, 216, 216, 1);
  static const brownGrey = Color.fromRGBO(151, 151, 151, 1);
  static const whiteShade = Color.fromARGB(255, 216, 216, 216);
  static const dialogWhiteShade = Color.fromRGBO(240, 240, 240, 1);

  //Orange shades
  static const orange = Color(0xFFFE6F43);
  static const orangeDark = Color(0xFFf45734);
  static const pinkishOrange = Color.fromARGB(255, 254, 111, 67);
  static const pinkishOrange2 = Color.fromARGB(255, 255, 99, 47);
  static const indicatorOrange = Color(0xFFff632f);
  static const borderOrange = Color(0xFFff6220);
  static const lightOrange = Color.fromARGB(255, 255, 164, 63);

  //Red Shades
  static const redAccent = Color(0xfffc4f4f);
  static const magenta = Color(0xffe52e44);
  static const coralRed = Color.fromARGB(255, 252, 79, 79);
  static const lightRed = Color.fromARGB(255, 241, 236, 236);

  //Green Shades
  static const greenAccent = Color(0xff42c870);
  static const lightGreen = Color.fromARGB(255, 227, 241, 232);
  static const oliveGreen2 = Color.fromARGB(255, 113, 179, 93);
  static const parrotGreen = Color.fromARGB(255, 30, 183, 91);
  static const oliveGreen = Color(0xff628b56);
  static const americanGreen = Color(0xff47BC4C);
  //Black
  static const black = Color(0xFF151515);
  static const black2 = Color.fromARGB(255, 15, 15, 15);
  static const blackLight = Color(0xFF26262A);
  static const blackDark = Color(0xFF232327);
  static const blackDark2 = Color.fromARGB(255, 19, 19, 21);
  static const dark2 = Color.fromARGB(255, 23, 23, 27);

  //Grey
  static const grey = Color(0xFFA4A4A5);
  static const pinkishGrey = Color(0xFFbababa);
  static const blueGrey = Color(0xFFA4A4A5);
  static const blueGrey2 = Color(0xFFA4A4A6);
  static const blueGrey3 = Color.fromARGB(255, 246, 246, 246);
  static const grey2 = Color(0xFFD8D8D8);
  static const greyish = Color(0xFFaaaaaa);
  static const steel = Color.fromARGB(255, 138, 138, 141);
  static const coolGrey = Color.fromARGB(255, 164, 164, 165);
  static const darkGrey2 = Color(0xff131415);
  static const darkGrey = Color(0xFF131415);
  static const lightGrey = Color(0xFFDDDCD8);
  static const paleGrey = Color.fromARGB(255, 246, 247, 251);
  static const charcoalGrey = Color.fromARGB(255, 78, 78, 81);
  static const veryLightGrey = Color(0xFFF2F2F2);
  static const lightGrey2 = Color(0xFFF6F7FB);
  static const slateGrey = Color.fromARGB(255, 81, 81, 90);
  static const workTabSelected = Color(0xFF4D4D4E);
  static const workTabUnSelected = Color(0xFF26262A);
  static const greyLight = Color(0xFFf6f6f6);
  static const borderGrey = Color(0xFFeaecf3);
  static const notificationGrey = Color(0xFFf5faff);
  static const darkGrey3 = Color(0xFF454545);
  static const cupertinoSwitchGrey = Color.fromARGB(255, 122, 122, 122);
  static const warmGrey = Color(0xFF747474);
  static const steelGrey = Color(0xFF848486);
  static const borderGrey2 = Color(0xFFEBEBEB);
  static const spanishGray = Color(0xFF979797);

  // blue
  static const bluePurple = Color(0xFF5F33AD);
  static const lightPurple = Color(0xFF4455fd);
  static const skyBlue = Color(0xFF007aff);
  static const blueAccent = Color.fromARGB(255, 18, 90, 177);
  static const plumpPurple = Color(0xFF5C33AD);

  //transparent
  static const transparent = Colors.transparent;

  //pink
  static const veryLightPink = Color.fromARGB(255, 242, 242, 242);
  static const veryLightPink2 = Color.fromARGB(255, 217, 217, 217);
}
