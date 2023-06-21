import 'package:flutter/material.dart';

// هنا هضيف اي حاجه ليها علاقه بال color

class ColorManager {
  static Color defaultColor = Color.fromARGB(255, 103, 71, 218);
  static Color defaultRedColor2 = Colors.red.shade800;
  static Color defaultwhiteColor3 = Colors.white;
  static Color defaultBlack = Colors.black;

  // static Color defaultColor = Colors.deepPurple;

  static Color primary = Colors.red.shade800;
  static Color darkGrey = const Color(0xff525252);
  static Color grey = const Color(0xff737477);
  static Color lightGrey = const Color(0xff9E9E9E);

  // new colors
  static Color darkPrimary = const Color(0xffd17d11);
  static Color lightPrimary = const Color(0xCCd17d11); // color with 80% opacity
  static Color grey1 = const Color(0xff707070);
  static Color grey2 = const Color(0xff797979);
  static Color white = const Color(0xffFFFFFF);
  static Color error = const Color(0xffe61f34); // red color
}

class MyColors {
  static const Color myYellow = Color(0xffFFC107);
  static const Color myGrey = Color(0xff343A40);
  static const Color myWhite = Color(0xffE1E8EB);
}
