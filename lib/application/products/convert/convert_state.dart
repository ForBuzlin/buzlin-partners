import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'convert_state.freezed.dart';

@freezed
class ConvertState with _$ConvertState {
  const factory ConvertState({
    @Default(null) File? file,
    @Default(null) String? name,
    @Default(false) bool isLoading,
    @Default(0) double progress,
  }) = _ConvertState;
}
