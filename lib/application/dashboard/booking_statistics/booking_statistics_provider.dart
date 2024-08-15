import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'booking_statistics_state.dart';
import 'booking_statistics_notifier.dart';

final bookingStatisticsProvider =
    StateNotifierProvider<BookingStatisticsNotifier, BookingStatisticsState>(
  (ref) => BookingStatisticsNotifier(statisticsRepository),
);
