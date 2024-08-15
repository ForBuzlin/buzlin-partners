import 'enums.dart';
import 'tr_keys.dart';

abstract class DropDownValues {
  DropDownValues._();

  static const filterLayouts = [
    LayoutType.twoV,
    LayoutType.twoH,
    LayoutType.threeH,
    LayoutType.threeV,
  ];

  static List<String> timeOptionsList = [
    TrKeys.oneDay,
    TrKeys.threeDays,
    TrKeys.sevenDays,
    TrKeys.fourteenDays,
    TrKeys.oneMonth,
    TrKeys.twoMonth,
    TrKeys.threeMonth,
    TrKeys.fourMonth,
    TrKeys.fiveMonth,
    TrKeys.sixMonth,
    TrKeys.eightMonth,
    TrKeys.eighteenMonth,
    TrKeys.oneYear,
    TrKeys.twoYears,
    TrKeys.fiveYears,
  ];

  static List<String> sessionsList = [TrKeys.limited, TrKeys.unlimited];

  static List<String> deliveryTypeList = [TrKeys.inHouse, TrKeys.ownSeller];
  static List<String> deliveryTimeTypeList = [
    "minute",
    "hour",
    "day",
    "week",
    "month"
  ];
  static List<String> serviceTypeList = [
    TrKeys.online,
    TrKeys.offlineIn,
    TrKeys.offlineOut,
  ];
  static List<String> genderList = [
    TrKeys.male,
    TrKeys.female,
    TrKeys.all,
  ];
  static List<String> gender = [
    TrKeys.male,
    TrKeys.female,
  ];
  static List<String> repeatsList = [
    'dont_repeat',
    'day',
    'week',
    'month',
    'custom',
  ];
  static List<String> endTypeList = [
    'never',
    'date',
    'after',
  ];
  static List<String> customRepeatType = ["day", "week", "month"];

  static List<String> answerType = [
    "short_answer",
    "long_answer",
    "single_answer",
    "multiple_choice",
    "drop_down",
    "yes_or_no",
    "description_text",
  ];
}
