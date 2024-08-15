import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'media_notifier.dart';
import 'media_state.dart';

final mediaProvider =
    StateNotifierProvider.autoDispose<MediaNotifier, MediaState>(
  (ref) => MediaNotifier(settingsRepository),
);
