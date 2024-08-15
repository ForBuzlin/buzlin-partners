import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'edit_forms_notifier.dart';
import 'edit_forms_state.dart';

final editFormProvider =
    StateNotifierProvider<EditFormNotifier, EditFormOptionState>(
  (ref) => EditFormNotifier(formRepository),
);
