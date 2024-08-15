import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'edit_booking_notifier.dart';
import 'edit_booking_state.dart';

final editBookingProvider =
    StateNotifierProvider<EditBookingNotifier, EditBookingState>(
  (ref) => EditBookingNotifier(bookingRepository),
);
