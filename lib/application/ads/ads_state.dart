import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'ads_state.freezed.dart';

@freezed
class AdsState with _$AdsState {
  const factory AdsState({
    @Default(false) bool isLoading,
    @Default([]) List<AdsData> list,
  }) = _AdsState;

  const AdsState._();
}
