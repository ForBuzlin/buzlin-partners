import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_looks_state.freezed.dart';

@freezed
class EditLooksState with _$EditLooksState {
  const factory EditLooksState({
    @Default(true) bool active,
    String? imageFile,
    @Default([]) List<ProductData> products,
    @Default(false) bool isLoading,
    LooksData? looksData,
  }) = _EditLooksState;

  const EditLooksState._();
}
