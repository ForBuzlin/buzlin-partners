import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'zoom_notifier.dart';
import 'zoom_state.dart';

final zoomProvider = StateNotifierProvider.autoDispose<ZoomNotifier, ZoomState>(
  (ref) => ZoomNotifier(),
);
