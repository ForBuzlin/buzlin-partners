import 'package:venderuzmart/presentation/component/components.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remixicon/remixicon.dart';
import 'package:google_fonts/google_fonts.dart';
import '../local_storage/local_storage.dart';
import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:intl/intl.dart';
import '../models/models.dart';
import 'package:dio/dio.dart';
import 'app_constants.dart';
import 'drop_down_values.dart';
import 'enums.dart';
import 'marker_image_cropper.dart';
import 'tr_keys.dart';

abstract class AppHelpers {
  AppHelpers._();

  static String get getUserRole => LocalStorage.getUser()?.role ?? 'seller';

  static String numberFormat({
    num? number,
    String? symbol,
    bool? isOrder,
    int? decimalDigits,
  }) {
    number = number ?? 0;
    if (LocalStorage.getSelectedCurrency()?.position == "before") {
      return NumberFormat.currency(
        customPattern: '\u00a4 #,###.#',
        symbol: (isOrder ?? false)
            ? (symbol ?? LocalStorage.getSelectedCurrency()?.symbol)
            : LocalStorage.getSelectedCurrency()?.symbol,
        decimalDigits: decimalDigits ?? (number > 99999 ? 0 : 2),
      ).format(number);
    } else {
      return NumberFormat.currency(
        customPattern: '#,###.# \u00a4',
        symbol: (isOrder ?? false)
            ? (symbol ?? LocalStorage.getSelectedCurrency()?.symbol)
            : LocalStorage.getSelectedCurrency()?.symbol,
        decimalDigits: decimalDigits ?? (number > 99999 ? 0 : 2),
      ).format(number);
    }
  }

  static bool checkIfHex(String? type) {
    if (type == null || type.isEmpty) {
      return false;
    }
    if (type.length == 7 && type[0] == '#') {
      return true;
    } else {
      return false;
    }
  }

  static String getShopWorkingTimeForToday() {
    final shop = LocalStorage.getShop();
    if (shop == null) {
      return getTranslation(TrKeys.theShopIsClosedToday);
    }
    final currentWeekday =
        DateFormat('EEEE').format(DateTime.now()).toLowerCase();
    final List<WorkingDay> workingDays = shop.shopWorkingDays ?? [];
    for (final day in workingDays) {
      if (day.day?.toLowerCase() == currentWeekday) {
        if (day.disabled ?? false) {
          return getTranslation(TrKeys.theShopIsClosedToday);
        }
        return '${day.from?.substring(0, 2)}:${day.from?.substring(3, 5)} - ${day.to?.substring(0, 2)}:${day.to?.substring(3, 5)}';
      }
    }
    return '';
  }

  static double getInitialLatitude() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'location') {
        final String? latString =
            setting.value?.substring(0, setting.value?.indexOf(','));
        if (latString == null) {
          return AppConstants.demoLatitude;
        }
        final double? lat = double.tryParse(latString);
        return lat ?? AppConstants.demoLatitude;
      }
    }
    return AppConstants.demoLatitude;
  }

  static double getInitialLongitude() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'location') {
        final String? latString =
            setting.value?.substring(0, setting.value?.indexOf(','));
        if (latString == null) {
          return AppConstants.demoLongitude;
        }
        final String? lonString = setting.value
            ?.substring((latString.length) + 2, setting.value?.length);
        if (lonString == null) {
          return AppConstants.demoLongitude;
        }
        final double lon = double.parse(lonString);
        return lon;
      }
    }
    return AppConstants.demoLongitude;
  }

  static LatLng getInitialLatLng() =>
      LatLng(getInitialLatitude(), getInitialLongitude());

  static ExtrasType getExtraTypeByValue(String? value) {
    switch (value) {
      case 'color':
        return ExtrasType.color;
      case 'text':
        return ExtrasType.text;
      case 'image':
        return ExtrasType.image;
      default:
        return ExtrasType.text;
    }
  }

  static List<String> getMasterStatuses(String value) {
    switch (value) {
      case TrKeys.newKey:
        return [TrKeys.accepted, TrKeys.rejected];
      case TrKeys.accepted:
        return [TrKeys.newKey, TrKeys.rejected];
      case TrKeys.rejected:
        return [TrKeys.newKey, TrKeys.accepted];
      default:
        return [];
    }
  }

  static String changeStatusButtonText(String? value) {
    switch (value) {
      case 'new':
        return getTranslation(TrKeys.swipeToAccept);
      case 'accepted':
        return getTranslation(TrKeys.swipeToReady);
      case 'ready':
        return getTranslation(TrKeys.swipeToWay);
      case 'on_a_way':
        return getTranslation(TrKeys.swipeToDelivered);
      case 'pause':
        return getTranslation(TrKeys.swipeToDelivered);
      case 'delivered':
        return getTranslation(TrKeys.swipeToAccept);
      case 'canceled':
        return getTranslation(TrKeys.swipeToAccept);
      default:
        return getTranslation(TrKeys.swipeToAccept);
    }
  }

  static String changeBookingStatusButtonText(String? value) {
    switch (value) {
      case 'new':
        return getTranslation(TrKeys.changeToBooked);
      case 'booked':
        return getTranslation(TrKeys.changeTopProgress);
      case 'progress':
        return getTranslation(TrKeys.changeTopEnded);
      default:
        return getTranslation(TrKeys.changeToBooked);
    }
  }

  static OrderStatus getUpdatableStatus(String? value) {
    switch (value) {
      case 'new':
        return OrderStatus.accepted;
      case 'accepted':
        return OrderStatus.ready;
      case 'ready':
        return OrderStatus.onAWay;
      case 'on_a_way':
        return OrderStatus.delivered;
      case 'pause':
        return OrderStatus.delivered;
      case 'delivered':
        return OrderStatus.newOrder;
      case 'canceled':
        return OrderStatus.canceled;
      default:
        return OrderStatus.accepted;
    }
  }

  static BookingStatus getUpdatableBookingStatus(String? value) {
    switch (value) {
      case 'new':
        return BookingStatus.booked;
      case 'booked':
        return BookingStatus.progress;
      case 'progress':
        return BookingStatus.ended;
      default:
        return BookingStatus.booked;
    }
  }

  static OrderStatus getOrderStatus(String? value) {
    switch (value) {
      case 'new':
        return OrderStatus.newOrder;
      case 'accepted':
        return OrderStatus.accepted;
      case 'ready':
        return OrderStatus.ready;
      case 'on_a_way':
        return OrderStatus.onAWay;
      case 'pause':
        return OrderStatus.pause;
      case 'delivered':
        return OrderStatus.delivered;
      case 'canceled':
        return OrderStatus.canceled;
      default:
        return OrderStatus.newOrder;
    }
  }

  static String getBookingStatus(BookingStatus value) {
    switch (value) {
      case BookingStatus.newOrder:
        return TrKeys.newOrder;
      default:
        return value.name;
    }
  }

  static Color getStatusColor(String? value) {
    switch (value) {
      case 'pending':
        return Style.pendingDark;
      case 'new':
        return Style.blueColor;
      case 'accepted':
      case 'booked':
        return Style.deepPurple;
      case 'ready':
      case 'progress':
        return Style.revenueColor;
      case 'on_a_way':
        return Style.black;
      case 'unpublished':
        return Style.orange;
      case '1':
      case 'all':
      case 'true':
      case 'cash':
      case 'paid':
      case 'active':
      case 'viewed':
      case 'approved':
      case 'published':
      case 'delivered':
        return Style.green;
      case '0':
      case 'null':
      case 'false':
      case 'cancel':
      case 'inactive':
      case 'canceled':
      case 'note.paid':
        return Style.red;
      default:
        return Style.primary;
    }
  }

  static Color getServiceStatusColor(String? value) {
    switch (value) {
      case 'new':
        return Style.blueColor;
      case 'accepted':
        return Style.green;
      case 'null':
      case 'canceled':
      case 'cancel':
        return Style.red;
      default:
        return Style.primary;
    }
  }

  static bool getQuestionAnswer(String? value) {
    switch (value) {
      case 'single_answer':
      case 'multiple_choice':
      case 'drop_down':
        return true;
      default:
        return false;
    }
  }

  static bool checkIsSvg(String? url) {
    if (url == null) {
      return false;
    }
    final length = url.length;
    return length > 3 ? url.substring(length - 3, length) == 'svg' : false;
  }

  static String getGender(int? gender) {
    if ((gender ?? 0) < 1) {
      return '';
    }
    return DropDownValues.genderList[gender! - 1];
  }

  static String getAppName() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'title') {
        return setting.value ?? 'Yelpos';
      }
    }
    return 'Yelpos';
  }

  static bool getPhoneRequired() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'before_order_phone_required') {
        return (setting.value ?? "0") == "1";
      }
    }
    return false;
  }

  static bool getDemoMode() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'is_demo') {
        return (setting.value ?? "0") == "1";
      }
    }
    return false;
  }

  static bool getSubscription() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'subscription') {
        return (setting.value ?? "0") == "1";
      }
    }
    return false;
  }

  static bool getAds() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'ads') {
        return (setting.value ?? "0") == "1";
      }
    }
    return false;
  }

  static showNoConnectionSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      backgroundColor: Style.primary,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Text(
        'No internet connection',
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Style.white,
        ),
      ),
      action: SnackBarAction(
        label: 'Close',
        disabledTextColor: Style.white,
        textColor: Style.yellow,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static successSnackBar(
    BuildContext context, {
    String? text,
  }) {
    FToast.toast(context,
        toast: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(16.r),
                margin: EdgeInsets.only(
                  bottom: MediaQuery.sizeOf(context).height / 1.5,
                  left: 32.r,
                  right: 32.r,
                ),
                decoration: BoxDecoration(
                  color: Style.green,
                  borderRadius:
                      BorderRadius.circular((AppConstants.radius / 1.5).r),
                ),
                child: Text(
                  text ??
                      AppHelpers.getTranslation(TrKeys.successfullyCompleted),
                  style: Style.interNormal(color: Style.white, size: 14),
                ))
          ],
        ));
  }

  static errorSnackBar(BuildContext context, {String? text}) {
    FToast.toast(context,
        toast: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(16.r),
                margin: EdgeInsets.only(
                  bottom: MediaQuery.sizeOf(context).height / 1.5 -
                      ((text?.length ?? 0) / 10),
                  left: 32.r,
                  right: 32.r,
                ),
                decoration: BoxDecoration(
                  color: Style.primary,
                  borderRadius:
                      BorderRadius.circular((AppConstants.radius / 1.5).r),
                ),
                child: Text(
                  text ?? AppHelpers.getTranslation(TrKeys.failed),
                  style: Style.interNormal(color: Style.white, size: 14),
                ))
          ],
        ));
  }

  static String getTranslation(String trKey) {
    final Map<String, dynamic> translations = LocalStorage.getTranslations();
    return translations[trKey] ??
        (trKey.isNotEmpty
            ? trKey.replaceAll(".", " ").replaceAll("_", " ").replaceFirst(
                trKey.substring(0, 1), trKey.substring(0, 1).toUpperCase())
            : '');
  }

  static void showCustomModalBottomSheet({
    required BuildContext context,
    required Widget modal,
    double radius = AppConstants.radius,
    bool isDrag = true,
    bool isDismissible = true,
    double paddingTop = 200,
  }) {
    showModalBottomSheet(
      isDismissible: isDismissible,
      enableDrag: isDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height - paddingTop.r,
      ),
      backgroundColor: Style.transparent,
      context: context,
      builder: (context) =>
          Padding(padding: MediaQuery.viewInsetsOf(context), child: modal),
    );
  }

  static Future<void> showCustomModalBottomDragSheet({
    required BuildContext context,
    required Function(ScrollController controller) modal,
    double radius = AppConstants.radius,
    bool isDrag = true,
    bool isDismissible = true,
    double paddingTop = 100,
    double maxChildSize = 0.9,
    double initSize = 0.9,
  }) async {
    return await showModalBottomSheet(
      isDismissible: isDismissible,
      enableDrag: isDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height - paddingTop.r,
      ),
      backgroundColor: Style.transparent,
      context: context,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: initSize,
        maxChildSize: maxChildSize,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return modal(scrollController);
        },
      ),
    );
  }

  static void showCustomModalBottomSheetWithoutIosIcon({
    required BuildContext context,
    required Widget modal,
    required bool isDarkMode,
    double radius = 16,
    bool isDrag = true,
    double paddingTop = 200,
  }) {
    showModalBottomSheet(
      enableDrag: isDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height - paddingTop.r,
      ),
      backgroundColor: Style.transparent,
      context: context,
      builder: (context) => modal,
    );
  }

  static void showAlertDialog({
    required BuildContext context,
    required Widget child,
    double radius = 16,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r),
          ),
          contentPadding: EdgeInsets.all(16.r),
          iconPadding: EdgeInsets.zero,
          content: child,
        );
      },
    );
  }

  static openDialogImagePicker({
    required BuildContext context,
    required VoidCallback openCamera,
    required VoidCallback openGallery,
  }) {
    return showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Style.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            margin: EdgeInsets.all(24.w),
            width: double.infinity,
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: Style.backgroundColor,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  getTranslation(TrKeys.selectPhoto),
                  textAlign: TextAlign.center,
                  style: Style.interNormal(size: 18),
                ),
                const Divider(),
                8.verticalSpace,
                ButtonEffectAnimation(
                  onTap: openCamera,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                    child: Row(
                      children: [
                        const Icon(Remix.camera_lens_line),
                        4.horizontalSpace,
                        Text(
                          getTranslation(TrKeys.takePhoto),
                          textAlign: TextAlign.center,
                          style: Style.interNormal(size: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                8.verticalSpace,
                ButtonEffectAnimation(
                  onTap: openGallery,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                    child: Row(
                      children: [
                        const Icon(Remix.gallery_line),
                        4.horizontalSpace,
                        Text(
                          getTranslation(TrKeys.chooseFromLibrary),
                          textAlign: TextAlign.center,
                          style: Style.interNormal(size: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static openDialog({
    required BuildContext context,
    required String title,
  }) {
    return showDialog(
      context: context,
      builder: (_) {
        return Dialog(
            backgroundColor: Style.transparent,
            insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              margin: EdgeInsets.all(24.w),
              width: double.infinity,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Style.white,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      getTranslation(title),
                      textAlign: TextAlign.center,
                      style: Style.interNormal(size: 18),
                    ),
                    24.verticalSpace,
                    CustomButton(
                      onPressed: () => Navigator.pop(context),
                      title: getTranslation(TrKeys.close),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }

  static String errorHandler(e) {
    try {
      return (e.runtimeType == DioException)
          ? ((e as DioException).response?.data["message"] == "Bad request."
              ? (e.response?.data["params"] as Map).values.first[0]
              : e.response?.data["message"])
          : e.toString();
    } catch (s) {
      try {
        return (e.runtimeType == DioException)
            ? ((e as DioException).response?.data.toString().substring(
                    (e.response?.data.toString().indexOf("<title>") ?? 0) + 7,
                    e.response?.data.toString().indexOf("</title") ?? 0))
                .toString()
            : e.toString();
      } catch (r) {
        try {
          return (e.runtimeType == DioException)
              ? ((e as DioException).response?.data["error"]["message"])
                  .toString()
              : e.toString();
        } catch (f) {
          return e.toString();
        }
      }
    }
  }

  static stockHandler(
    e, {
    int bagIndex = 0,
    VoidCallback? success,
  }) async {
    try {
      final msg = errorHandler(e);
      final temp = msg.substring(msg.indexOf('.') + 1);
      int? index = int.tryParse(temp.substring(0, temp.indexOf('.')));
      if (index == null) {
        return;
      }
      final bags = LocalStorage.getBags();
      final bagProduct = bags[bagIndex].bagProducts;
      bagProduct?.removeAt(index);
      bags[bagIndex] = bags[bagIndex].copyWith(bagProducts: bagProduct);
      await LocalStorage.setBags(bags);
      success?.call();
    } catch (s) {
      return;
    }
  }

  static List<String> extractTextFromControllers(
      List<TextEditingController> controllers) {
    List<String> texts = [];
    for (var controller in controllers) {
      texts.add(controller.text);
    }
    return texts;
  }

  static List<List<Extras>> cartesian(List<List<dynamic>> args) {
    List<List<Extras>> r = [];
    int max = args.length - 1;

    void helper(List<Extras> arr, int i) {
      for (int j = 0, l = args[i].length; j < l; j++) {
        List<Extras> a = List.from(arr);
        a.add(args[i][j]);
        if (i == max) {
          r.add(a);
        } else {
          helper(a, i + 1);
        }
      }
    }

    helper([], 0);
    return r;
  }

  static String getNameColor(String? value) {
    if (checkIfHex(value)) {
      final color = Color(int.parse('0xFF${value?.substring(1, 7)}'));
      return color.colorName;
    }
    return value ?? TrKeys.unKnow;
  }

  static LatLng getOrderLocation(LocationData? location) {
    return LatLng(
      location?.latitude ?? AppConstants.demoLatitude,
      location?.longitude ?? AppConstants.demoLongitude,
    );
  }

  static Future<BitmapDescriptor> getUserImg(UserData? user) async {
    final ImageCropperForMarker image = ImageCropperForMarker();
    return await image.resizeAndCircle(user?.img ?? "", 120);
  }

  static get getPriceLabel =>
      "${getTranslation(TrKeys.price)} (${LocalStorage.getSelectedCurrency()?.symbol})*";

  static customPriceLabel(String label) =>
      "${getTranslation(label)} (${LocalStorage.getSelectedCurrency()?.symbol})";
}
