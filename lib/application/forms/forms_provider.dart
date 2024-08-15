import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'forms_state.dart';
import 'forms_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final formProvider = StateNotifierProvider<FormNotifier, FormOptionState>(
  (ref) => FormNotifier(formRepository),
);
