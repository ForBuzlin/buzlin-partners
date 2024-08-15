import 'tr_keys.dart';
import 'app_helpers.dart';

abstract class AppValidators {
  AppValidators._();
  static String? passwordCheck(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if (text.length < 6) {
      return AppHelpers.getTranslation(
          TrKeys.passwordShouldContainMinimum6Characters);
    }
    return null;
  }

  static String? confirmPasswordCheck(String? text, String? password) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if (text.length < 6) {
      return AppHelpers.getTranslation(
          TrKeys.passwordShouldContainMinimum6Characters);
    }
    if (password != text) {
      return AppHelpers.getTranslation(TrKeys.confirmPasswordIsNotTheSame);
    }
    return null;
  }

  static bool checkEmail(String email) =>
      RegExp("/^[0-9 ()+-]+\$/").hasMatch(email);

  static String? emailCheck(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if (!isValidEmail(text)) {
      return AppHelpers.getTranslation(TrKeys.emailIsNotValid);
    }
    return null;
  }

  static String? maxQtyCheck(String? max, String? min) {
    if (max == null || max.isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if (min != null) {
      if ((num.tryParse(min) ?? 0) > (num.tryParse(max) ?? 0)) {
        return AppHelpers.getTranslation(
            TrKeys.maxQtyShouldBeGreaterThanMinQty);
      }
    }
    return null;
  }

  static String? minQtyCheck(String? min) {
    if (min == null || min.isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if (double.tryParse(min)?.isNegative ?? true) {
      return AppHelpers.getTranslation(TrKeys.minQuantityError);
    }
    return null;
  }

  static String? emptyCheck(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    return null;
  }

  static String? isNumberValidator(String? title) {
    if (title?.isEmpty ?? true) {
      return AppHelpers.getTranslation(TrKeys.thisFieldIsRequired);
    }
    if ((num.tryParse(title ?? "") ?? 0.0).isNegative) {
      return AppHelpers.getTranslation(TrKeys.thisFieldIsNotMinusOrZero);
    }
    return null;
  }

  static bool isValidEmail(String email) => RegExp(
        "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$",
      ).hasMatch(email);

  static bool isValidPassword(String password) => password.length > 5;

  // static bool isValidConfirmPassword(String password,String confirmPassword) => password == confirmPassword;

  static String? isValidConfirmPassword(
      String password, String? confirmPassword) {
    if (confirmPassword?.isEmpty ?? true) {
      return AppHelpers.getTranslation(TrKeys.thisFieldIsRequired);
    } else if (confirmPassword != password) {
      return AppHelpers.getTranslation(TrKeys.passwordNoCorrect);
    }
    return null;
  }
}
