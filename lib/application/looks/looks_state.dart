import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'looks_state.freezed.dart';

@freezed
class LooksState with _$LooksState {
  const factory LooksState({
    @Default(false) bool isLoading,
    @Default([]) List<LooksData> looks,
  }) = _LooksState;

  const LooksState._();
}
