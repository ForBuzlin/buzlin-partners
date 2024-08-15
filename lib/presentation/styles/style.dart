import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Style {
  Style._();

  /// ---------------- Colors  ---------------- ///

  static const primary = Color(0xFFBB9B6A);
  static const bg = Color(0xFFECEFF3);
  static const red = Color(0xFFFF3D00);
  static const blue = Color(0xFF03758E);
  static const teal = Color(0xFF009688);
  static const pink = Color(0xffFF38AB);
  static const icon = Color(0x30B1B1B1);
  static const white = Color(0xFFFFFFFF);
  static const green = Color(0xFF16AA16);
  static const black = Color(0xFF000000);
  static const newBoxColor = subCategory;
  static const black12 = Color(0x1F000000);
  static const purple = Color(0xffC26BF9);
  static const yellow = Color(0xffFFB800);
  static const shadow = Color(0xFF000000);
  static const orange = Color(0xffF26110);
  static const bgDark = Color(0xff18191D);
  static const success = Color(0xff31D0AA);
  static const pending = Color(0xFFFFD989);
  static const textHint = Color(0xff939393);
  static const tabBarBg = Color(0xffF4F4F4);
  static const mainBack = Color(0xFFF4F4F4);
  static const semiGrey = Color(0xFFF1F1F1);
  static const unselect = Color(0xFFF8F8F8);
  static const redColor = Color(0xFFF34750);
  static const starColor = Color(0xffFFA826);
  static const greyColor = Color(0xFFF4F5F8);
  static const textColor = Color(0xFFA0A09C);
  static const iconColor = Color(0xFFC4C4C4);
  static const blueColor = Color(0xff3a92f5);
  static const greenColor = Color(0xFF60CC3B);
  static const iconsColor = Color(0xFF232B2F);
  static const background = Color(0xFFF9F9FA);
  static const deepPurple = Color(0xFF673AB7);
  static const shimmerBase = Color(0xFFE0E0E0);
  static const toggleColor = Color(0xFFE7E7E7);
  static const borderColor = Color(0xFFEAEAEA);
  static const pendingDark = Color(0xFFF19204);
  static const blackBanner = Color(0xff1A1D2E);
  static const seeAllColor = Color(0xff289AB3);
  static const subCategory = Color(0xffF6F6F6);
  static const dragElement = Color(0xFFC4C5C7);
  static const categoryDark = Color(0xff33393F);
  static const dividerColor = Color(0xffF3F3F3);
  static const transparent = Colors.transparent;
  static const revenueColor = Color(0xFFFF8A00);
  static const logOutBgColor = Color(0xFFB9B9B9);
  static const addCountColor = Color(0xFFF7F7F7);
  static const discountColor = Color(0xFFF3F3F3);
  static const unselectLayout = Color(0xffAEAEAE);
  static const unselectTabBar = Color(0xffA0A09C);
  static const iconButtonBack = Color(0xFFE9E9E6);
  static const backgroundColor = Color(0xFFF8F8F8);
  static const whiteWithOpacity = Color(0x30ffffff);
  static const shimmerHighlight = Color(0xFFF5F5F5);
  static const socialButtonDark = Color(0xff33393F);
  static const tabBarBorderColor = Color(0xFFDEDFE1);
  static const toggleShadowColor = Color(0xFF6B6B6B);
  static const socialButtonLight = Color(0x40ffffff);
  static const differBorderColor = Color(0xFFE0E0E0);
  static const bottomBarColorDark = Color(0xff444444);
  static const bottomBarColorLight = Color(0xff000000);
  static const bottomSheetIconColor = Color(0xFFC4C5C7);
  static const colorGrey = Color.fromRGBO(179, 181, 193, 1);
  static const bottomNavigationBarColor = Color(0xFF191919);
  static const Color defaultBorderColor = Color(0xffdddddd);
  static const Color defaultLiveTimeIndicatorColor = Color(0xff444444);

  static const walletGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xffFFB300),
        Color(0xffFEB101),
        Color(0xffFF38AB),
        Color(0xffFE0000),
      ]);

  static List<BoxShadow> walletShadow = [
    BoxShadow(
      color: pink.withOpacity(0.4),
      offset: const Offset(0.6, 4),
      blurRadius: 10,
      spreadRadius: 0.1,
    ), //BoxShadow
  ];
  static List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: primary.withOpacity(0.6),
      blurRadius: 30,
      offset: const Offset(0, 6),
      spreadRadius: 0,
    )
  ];
  static List<BoxShadow> greyShadow = [
    BoxShadow(
      color: colorGrey.withOpacity(0.6),
      blurRadius: 30,
      offset: const Offset(0, 6),
      spreadRadius: 0,
    )
  ];

  static List<Color> primaryGradient = [
    Style.primary.withOpacity(0.5),
    Style.transparent,
  ];

  static const MaterialColor primaryMaterialColor =
      MaterialColor(0xFF9581FF, <int, Color>{
    50: Color(0xFFEFECFF),
    100: Color(0xFFD7D0FF),
    200: Color(0xFFBDB0FF),
    300: Color(0xFFA390FF),
    400: Color(0xFF8F79FF),
    500: Color(0xFF7B61FF),
    600: Color(0xFF7359FF),
    700: Color(0xFF684FFF),
    800: Color(0xFF5E45FF),
    900: Color(0xFF6C56DD),
  });

  /// ------------------ Fonts ---------------- ///

  static interBold({
    double size = 18,
    Color color = black,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.inter(
        fontSize: size.sp,
        fontWeight: FontWeight.bold,
        color: color,
        decoration: TextDecoration.none,
        letterSpacing: letterSpacing,
      );

  static interSemi({
    double size = 18,
    Color color = black,
    TextDecoration decoration = TextDecoration.none,
    double letterSpacing = 0,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.inter(
        fontSize: size.sp,
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: letterSpacing,
        decoration: decoration,
        fontStyle: fontStyle,
      );

  static interNormal({
    double size = 16,
    Color color = black,
    TextDecoration decoration = TextDecoration.none,
    double letterSpacing = 0,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.inter(
        fontSize: size.sp,
        fontWeight: FontWeight.w500,
        color: color,
        letterSpacing: letterSpacing,
        decoration: decoration,
        fontStyle: fontStyle,
      );

  static interRegular({
    double size = 16,
    Color color = black,
    double letterSpacing = 0,
    TextDecoration textDecoration = TextDecoration.none,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.inter(
        fontSize: size.sp,
        fontWeight: FontWeight.w400,
        color: color,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
        fontStyle: fontStyle,
      );
}
