import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'product_extras_state.freezed.dart';

@freezed
class ProductExtrasState with _$ProductExtrasState {
  const factory ProductExtrasState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default([]) List<Group> groups,
  }) = _ProductExtrasState;

  const ProductExtrasState._();
}
