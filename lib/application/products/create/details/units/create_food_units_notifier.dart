import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'create_food_units_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class CreateFoodUnitsNotifier extends StateNotifier<CreateFoodUnitsState> {
  final CatalogFacade _catalogRepository;

  CreateFoodUnitsNotifier(this._catalogRepository)
      : super(CreateFoodUnitsState(unitController: TextEditingController()));

  void clearAll() {
    state.unitController?.clear();
    state = state.copyWith(activeIndex: 0);
  }

  Future<void> fetchUnits(BuildContext context) async {
    if (state.units.isNotEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _catalogRepository.getUnits();
    response.when(
      success: (data) {
        final List<UnitData> units = data.data ?? [];
        state = state.copyWith(units: units, isLoading: false);
        if (units.isNotEmpty) {
          state.unitController?.text =
              units[state.activeIndex].translation?.title ?? '';
        }
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
     AppHelpers.errorSnackBar(context, text: failure);
        debugPrint('====> fetch units fail $failure');
      },
    );
  }

  void setActiveIndex(int index) {
    if (state.activeIndex == index) {
      return;
    }
    state = state.copyWith(activeIndex: index);
    state.unitController?.text = state.units[index].translation?.title ?? '';
  }
}
