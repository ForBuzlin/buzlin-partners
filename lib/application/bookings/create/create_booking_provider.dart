import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'create_booking_notifier.dart';
import 'create_booking_state.dart';

final createBookingProvider = StateNotifierProvider<CreateBookingNotifier, CreateBookingState>(
  (ref) => CreateBookingNotifier(bookingRepository,serviceRepository,paymentRepository,serviceMasterRepository),
);
