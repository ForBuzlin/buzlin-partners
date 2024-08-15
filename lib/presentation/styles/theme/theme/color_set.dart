part of 'theme.dart';

class CustomColorSet {
  final Color primary;

  final Color white;

  final Color textHint;

  final Color textBlack;

  final Color textWhite;

  final Color icon;

  final Color success;

  final Color error;

  final Color transparent;

  final Color backgroundColor;

  final Color socialButtonColor;

  final Color newBoxColor;

  final Color bottomBarColor;

  final Color categoryColor;

  final Color categoryTitleColor;

  CustomColorSet._({
    required this.textHint,
    required this.textBlack,
    required this.textWhite,
    required this.primary,
    required this.white,
    required this.icon,
    required this.success,
    required this.error,
    required this.transparent,
    required this.backgroundColor,
    required this.socialButtonColor,
    required this.bottomBarColor,
    required this.categoryColor,
    required this.categoryTitleColor,
    required this.newBoxColor,
  });

  factory CustomColorSet._create(CustomThemeMode mode) {
    final isLight = mode.isLight;

    final textHint = isLight ? Style.textHint : Style.white;

    final textBlack = isLight ? Style.black : Style.white;

    final textWhite = isLight ? Style.white : Style.black;

    final categoryColor = isLight ? Style.black : Style.categoryDark;

    final categoryTitleColor = isLight ? Style.black : Style.whiteWithOpacity;

    const primary = Style.primary;

    const white = Style.white;

    const icon = Style.icon;

    final backgroundColor = isLight ? Style.bg : Style.bgDark;

    final newBoxColor = isLight ? Style.subCategory : Style.categoryDark;

    const success = Style.success;

    const error = Style.red;

    const transparent = Style.transparent;

    final socialButtonColor =
        isLight ? Style.socialButtonLight : Style.socialButtonDark;

    final bottomBarColor = isLight
        ? Style.bottomBarColorLight.withOpacity(0.8)
        : Style.bottomBarColorDark;

    return CustomColorSet._(
      categoryColor: categoryColor,
      textHint: textHint,
      textBlack: textBlack,
      textWhite: textWhite,
      primary: primary,
      white: white,
      icon: icon,
      backgroundColor: backgroundColor,
      success: success,
      error: error,
      transparent: transparent,
      socialButtonColor: socialButtonColor,
      bottomBarColor: bottomBarColor,
      categoryTitleColor: categoryTitleColor,
      newBoxColor: newBoxColor,
    );
  }

  static CustomColorSet createOrUpdate(CustomThemeMode mode) {
    return CustomColorSet._create(mode);
  }
}
