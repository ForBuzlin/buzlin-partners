import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'add_discount_state.dart';

class AddDiscountNotifier extends StateNotifier<AddDiscountState> {
  final DiscountsFacade _discountsRepository;
  final SettingsFacade _settingsRepository;

  AddDiscountNotifier(this._discountsRepository, this._settingsRepository)
      : super(AddDiscountState(dateController: TextEditingController()));

  void setActiveIndex(String? value) {
    if (state.type == value || value == null) {
      return;
    }
    state = state.copyWith(type: value);
  }

  void setActive(bool? value) {
    state = state.copyWith(active: !state.active);
  }

  void clear() {
    state = state.copyWith(
        active: true,
        stocks: [],
        price: 0,
        imageFile: null,
        startDate: null,
        endDate: null);
    state.dateController?.clear();
  }

  void setPrice(String value) {
    state = state.copyWith(price: int.parse(value));
  }

  void setDate(List<DateTime?> list) {
    if (list.isNotEmpty) {
      final startDate = DateService.dateFormat(list.first!);
      final endDate = DateService.dateFormat(list.last!);
      state.dateController?.text = '$startDate - $endDate';
      state = state.copyWith(startDate: list.first, endDate: list.last);
    }
  }

  void setDiscountProducts(Stocks stockData) {
    if (state.stocks.any((element) => element.id == stockData.id)) {
      deleteFromAddedProducts(stockData.id);
      return;
    }
    List<Stocks> temp = List.from(state.stocks);
    temp.add(stockData);
    state = state.copyWith(stocks: temp);
  }

  void deleteFromAddedProducts(int? id) {
    List<Stocks> temp = List.from(state.stocks);
    temp.removeWhere((element) => element.id == id);
    state = state.copyWith(stocks: temp);
  }

  void setImageFile(String? file) {
    state = state.copyWith(imageFile: file);
  }

  Future<void> createDiscount(
    BuildContext context, {
    VoidCallback? created,
    VoidCallback? onError,
  }) async {
    if (state.stocks.isEmpty) {
      AppHelpers.errorSnackBar(context,
          text: AppHelpers.getTranslation(TrKeys.errorQuantity));
      return;
    }
    state = state.copyWith(isLoading: true);
    String? imageUrl;
    if (state.imageFile != null) {
      final imageResponse = await _settingsRepository.uploadImage(
        state.imageFile!,
        UploadType.discounts,
      );
      imageResponse.when(
        success: (data) {
          imageUrl = data.imageData?.title;
        },
        failure: (failure, status) {
          debugPrint('==> upload product image fail: $failure');
          AppHelpers.errorSnackBar(context, text: failure);
        },
      );
    }
    final response = await _discountsRepository.addDiscount(
      active: state.active,
      image: imageUrl,
      type: state.type,
      price: state.price,
      startDate: DateService.dateFormatDay(state.startDate),
      endDate: DateService.dateFormatDay(state.endDate),
      ids: state.stocks.map((e) => e.id).toList(),
    );
    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
        );
        created?.call();
      },
      failure: (failure, status) {
        debugPrint('===> create product fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
        onError?.call();
      },
    );
  }
}
