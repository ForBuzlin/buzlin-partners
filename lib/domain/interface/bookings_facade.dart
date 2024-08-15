import 'package:venderuzmart/infrastructure/services/services.dart';

import '../handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

abstract class BookingsFacade {
  Future<ApiResult<BookingsCalculateResponse>> calculateBooking({
    int? userId,
    DateTime? startDate,
    Map<int, UserData>? serviceMasters,
  });

  Future<ApiResult<BookingResponse>> createBooking({
    int? userId,
    int? paymentId,
    DateTime? startDate,
    List<UserData>? serviceMasters,
  });

  Future<ApiResult<SingleBookingResponse>> updateBooking({
    required int? id,
    required int? userId,
    required ServiceData? serviceData,
    required DateTime? startDate,
    required DateTime? endDate,
  });

  Future<ApiResult<BookingResponse>> getBookings({
    int? page,
    DateTime? startDate,
    DateTime? endDate,
    int? masterId,
    String? status,
  });

  Future<ApiResult<SingleBookingResponse>> fetchSingleBooking(int? id);

  Future<ApiResult<OrderStatusResponse>> updateBookingStatus({
    required BookingStatus status,
    int? id,
  });

  Future<ApiResult> deleteBooking(int? id);

  Future<ApiResult<CheckTimeResponse>> checkTime({
    required DateTime start,
    required List<int> serviceId,
  });

  Future<ApiResult<SingleBookingResponse>> updateBookingNotes({
    required int? id,
    required String? note,
  });
}
