import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'shop_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class ShopNotifier extends StateNotifier<ShopState> {
  final UsersFacade _usersRepository;
  final SettingsFacade _settingsRepository;
  final ShopsFacade _shopsRepository;
  String _title = '';
  String _description = '';
  String _phone = '';
  String _deliveryTimeType = '';
  String _deliveryType = '';
  String _deliveryTimeTo = '';
  String _deliveryTimeFrom = '';
  String _minAmount = '';
  String _tax = '';
  String _address = '';
  double? _latitude;
  double? _longitude;

  ShopNotifier(
      this._usersRepository, this._settingsRepository, this._shopsRepository)
      : super(const ShopState());

  Future<void> updateWorkingDays(List<WorkingDay> days) async {
    final shop = state.shop?.copyWith(shopWorkingDays: days);
    LocalStorage.setShop(shop);
    state = state.copyWith(shop: shop);
  }

  Future<void> fetchMyShop({VoidCallback? afterFetched}) async {
    final response = await _usersRepository.getMyShop();
    response.when(
      success: (data) async {
        await LocalStorage.setShop(data.data);
        state = state.copyWith(shop: data.data);
        afterFetched?.call();
      },
      failure: (failure, status) {
        state = state.copyWith(shop: LocalStorage.getShop());
        afterFetched?.call();
        debugPrint('==> error with fetching my shop $failure');
      },
    );
  }

  void setPhone(String value) {
    _phone = value.trim();
  }

  void setCategoryId(int value) {
    state = state.copyWith(categoryId: value);
  }

  void setLocation(double latitude, double longitude) {
    _latitude = latitude;
    _longitude = longitude;
  }

  void setDeliveryType(String value) {
    _deliveryType = value.trim();
  }

  void setDeliveryTimeType(String value) {
    _deliveryTimeType = value.trim();
  }

  void setDeliveryTimeTo(String value) {
    _deliveryTimeTo = value.trim();
  }

  void setDeliveryTimeFrom(String value) {
    _deliveryTimeFrom = value.trim();
  }

  void setMinAmount(String value) {
    _minAmount = value.trim();
  }

  void setTax(String value) {
    _tax = value.trim();
  }

  void setAddress(String value) {
    _address = value.trim();
  }

  void setDescription(String value) {
    _description = value.trim();
  }



  void setTitle(String value) {
    _title = value.trim();
  }

  void setLogoImageFile(String? file) {
    state = state.copyWith(logoImageFile: file);
  }

  Future<void> updateShop(BuildContext context,
      {VoidCallback? updateSuccess}) async {
    state = state.copyWith(isLoading: true);
    String? backUrl;
    if (state.backgroundImageFile != null) {
      final imageResponse = await _settingsRepository.uploadImage(
        state.backgroundImageFile!,
        UploadType.shopsBack,
      );
      imageResponse.when(
        success: (data) {
          backUrl = data.imageData?.title;
        },
        failure: (failure, status) {
          debugPrint('==> upload shop back image fail: $failure');
          AppHelpers.errorSnackBar(context, text: failure);
        },
      );
    }
    String? logoUrl;
    if (state.logoImageFile != null) {
      final imageResponse = await _settingsRepository.uploadImage(
        state.logoImageFile!,
        UploadType.shopsLogo,
      );
      imageResponse.when(
        success: (data) {
          logoUrl = data.imageData?.title;
        },
        failure: (failure, status) {
          debugPrint('==> upload shop logo image fail: $failure');
          AppHelpers.errorSnackBar(context, text: failure);
        },
      );
    }
    Translation? newTranslation = state.shop?.translation;
    newTranslation = Translation(
        title: _title.isNotEmpty ? _title : (newTranslation?.title ?? ""),
        description: _description.isNotEmpty
            ? _description
            : (newTranslation?.description ?? ""),
        address:
            _address.isNotEmpty ? _address : (newTranslation?.address ?? ""));

    final response = await _shopsRepository.updateShop(
      backImg: backUrl ?? state.shop?.backgroundImg,
      logoImg: logoUrl ?? state.shop?.logoImg,
      tax: _tax.isNotEmpty ? _tax : (state.shop?.tax ?? 0).toString(),
      percentage: state.shop?.percentage.toString(),
      phone: _phone.isNotEmpty ? _phone : state.shop?.phone,
      //pricePerKm: state.shop?.pricePerKm,
      minAmount:
          _minAmount.isNotEmpty ? _minAmount : state.shop?.minAmount.toString(),
      //price: state.shop?.price,
      translation: newTranslation,
      categoryId: state.categoryId,
      deliveryTime: DeliveryTime(
        type: _deliveryTimeType.isNotEmpty
            ? _deliveryTimeType
            : state.shop?.deliveryTime?.type,
        to: _deliveryTimeTo.isNotEmpty
            ? _deliveryTimeTo
            : state.shop?.deliveryTime?.to,
        from: _deliveryTimeFrom.isNotEmpty
            ? _deliveryTimeFrom
            : state.shop?.deliveryTime?.from,
      ),
      //tags: state.shop?.tags,
      latLong: _latitude != null
          ? LocationData(latitude: _latitude, longitude: _longitude)
          : LocalStorage.getShop()?.latLong,
      deliveryType: _deliveryType,
    );
    response.when(
      success: (data) {
        _title = '';
        _description = '';
        _phone = '';
        _address = '';
        state = state.copyWith(
          isLoading: false,
          shop: data.data,
          backgroundImageFile: null,
          logoImageFile: null,
        );

        updateSuccess?.call();
      },
      failure: (failure, status) {
        debugPrint('===> update shop fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  void setBackgroundImageFile(String? file) {
    state = state.copyWith(backgroundImageFile: file);
  }

  void setOnlineOffline() {
    _usersRepository.setOnlineOffline();
  }
}
