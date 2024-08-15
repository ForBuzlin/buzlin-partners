import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'edit_stories_notifier.dart';
import 'edit_stories_state.dart';

final editStoriesProvider =
    StateNotifierProvider<EditStoriesNotifier, EditStoriesState>(
  (ref) => EditStoriesNotifier(storiesRepository, settingsRepository),
);
