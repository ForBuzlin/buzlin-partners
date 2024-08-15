import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'add_looks_state.freezed.dart';

@freezed
class AddLooksState with _$AddLooksState {
  const factory AddLooksState({
    @Default(true) bool active,
    String? imageFile,
    @Default([]) List<ProductData> products,
    @Default(false) bool isLoading,
    LooksData? looksData,
  }) = _AddLooksState;

  const AddLooksState._();
}
