import 'package:freezed_annotation/freezed_annotation.dart';

part 'masters_state.freezed.dart';

@freezed
class MastersState with _$MastersState {
  const factory MastersState({
    @Default(0) int index,
    @Default(-1) int statusIndex,
    @Default(false) bool isUpdate,
  }) = _MastersState;

  const MastersState._();
}
