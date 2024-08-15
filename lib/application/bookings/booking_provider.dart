import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'booking_notifier.dart';
import 'booking_state.dart';

final bookingProvider = StateNotifierProvider<BookingNotifier, BookingState>(
  (ref) => BookingNotifier(bookingRepository),
);
