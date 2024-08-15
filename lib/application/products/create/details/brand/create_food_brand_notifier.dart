// ignore_for_file: sdk_version_since

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/brands_facade.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'create_food_brand_state.dart';

class CreateFoodBrandNotifier extends StateNotifier<CreateFoodBrandState> {
  final BrandsFacade _brandsRepository;
  int _page = 0;

  CreateFoodBrandNotifier(this._brandsRepository)
      : super(CreateFoodBrandState(brandController: TextEditingController()));

  void clearAll() {
    state.brandController?.clear();
    state = state.copyWith(activeIndex: 0);
  }

  Future<void> updateBrands(BuildContext context) async {
    _page = 0;
    final response = await _brandsRepository.getAllBrands(page: ++_page);
    response.when(
      success: (data) {
        List<Brand> brands = List.from(state.brands);
        final List<Brand> newBrands = data.data ?? [];
        for (final brand in newBrands) {
          bool contains = false;
          for (final oldBrand in brands) {
            if (brand.id == oldBrand.id) {
              contains = true;
            }
          }
          if (!contains) {
            brands.insert(0, brand);
          }
        }
        state = state.copyWith(brands: brands, activeIndex: 0);
        if (brands.isNotEmpty) {
          state.brandController?.text = state.brands[0].title ?? '';
        }
      },
      failure: (failure, status) {
        debugPrint('====> fetch categories fail $failure');
        _page--;
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  void setActiveIndex(int index) {
    if (state.activeIndex == index) {
      return;
    }
    state = state.copyWith(activeIndex: index);
    state.brandController?.text = state.brands[index].title ?? '';
  }

  void setBrands(List<Brand> brands) {
    _page = 0;
    if (state.brands.isEmpty) {
      if (brands.isNotEmpty) {
        state.brandController?.text = brands[0].title ?? '';
      }
    }

    state = state.copyWith(brands: brands, activeIndex: 0);
  }
}
