import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFffffff);
const Color blackColor = Color(0xff0D1636);
const Color secondaryColor = Color(0xffFFCF53);
const Color redColor = Color(0xffE42C66);
const Color greyColor = Color(0xc8efeeee);
const Color captionColor = Color(0xff565C72);

const Color yellowColor = Color(0xffFFCF53);
const Color orangeYellowColor = Color(0xffFF9900);

const Color purpleColor = Color(0xff9C2CF3);
const Color deepBlueColor = Color(0xff3A49F9);

const Color lightBlueColor = Color(0xff44BBFE);
const Color darkBlueColor = Color(0xff1E78FE);

const Color blueColor = Color(0xff44BBFE);
const Color greyDarkSoftColor = Color(0xff44BBFE);

const List<Color> blueGrediantColor = [
  lightBlueColor,
  darkBlueColor,
];
final List<Color> redGrediantColor = [redColor, redColor];
final List<Color> grediantColor1 = [
  secondaryColor,
  secondaryColor.withOpacity(0.0)
];
final List<Color> yellowGrediantColor = [
  secondaryColor,
  const Color(0xffFF9900),
];

const MaterialColor primarycolorAccent =
    MaterialColor(_primarycolorAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_primarycolorAccentValue),
  400: Color(0xFFCDE6FF),
  700: Color(0xFFB3DAFF),
});
const int _primarycolorAccentValue = 0xFFFFFFFF;
