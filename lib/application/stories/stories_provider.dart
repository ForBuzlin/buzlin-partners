import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'stories_notifier.dart';
import 'stories_state.dart';

final storiesProvider = StateNotifierProvider<StoriesNotifier, StoriesState>(
  (ref) => StoriesNotifier(storiesRepository),
);
