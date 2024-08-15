import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'zoom_state.dart';

class ZoomNotifier extends StateNotifier<ZoomState> {
  ZoomNotifier() : super(const ZoomState());

  changeZoom(double i) => state = state.copyWith(calendarZoom: i);
}
