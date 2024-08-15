import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'service_faqs_notifier.dart';
import 'service_faqs_state.dart';

final serviceFaqsProvider =
    StateNotifierProvider<ServiceFaqsNotifier, ServiceFaqsState>(
  (ref) => ServiceFaqsNotifier(),
);
