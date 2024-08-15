import 'package:freezed_annotation/freezed_annotation.dart';

part 'zoom_state.freezed.dart';

@freezed
class ZoomState with _$ZoomState {
  const factory ZoomState({@Default(2.2) double calendarZoom}) = _ZoomState;

  const ZoomState._();
}
