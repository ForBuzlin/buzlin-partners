import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'booking_masters_notifier.dart';
import 'booking_masters_state.dart';

final bookingMastersProvider =
    StateNotifierProvider<BookingMastersNotifier, BookingMastersState>(
  (ref) => BookingMastersNotifier(usersRepository),
);
