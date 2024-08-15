import '../handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

abstract class OrdersFacade {
  Future<ApiResult<TransactionsResponse>> createTransaction({
    required int orderId,
    required int paymentId,
  });

  Future<ApiResult<CreateOrderResponse>> createOrder(
    BagData bag, {
    required DeliveryType deliveryType,
    UserData? user,
    required String deliveryTime,
    required List<Stocks> stocks,
  });

  Future<ApiResult<OrderStatusResponse>> updateOrderStatus({
    required OrderStatus status,
    int? orderId,
  });

  Future<ApiResult<SingleOrderResponse>> getOrderDetails({int? orderId});

  Future<ApiResult<OrdersPaginateResponse>> getOrders({
    OrderStatus? status,
    int? page,
    String? from,
    String? to,
    String? deliveryType,
    String? paymentStatus,
    int? paymentId,
    List<int>? paymentIds,
  });

  Future<ApiResult<OrdersPaginateResponse>> getHistoryOrders({
    int? page,
    String? from,
    String? to,
  });

  Future<ApiResult<CouponData>> checkCoupon({
    required String coupon,
  });

  Future<ApiResult> updateOrder({
    required StockReplaceData? replaceData,
    required OrderData? order,
    required int? currencyId,
    required String? phone,
  });

  Future<ApiResult<ProductCalculateResponse>> getAllCalculations(
    BagData bag,
    String type, {
    int? bagIndex,
    int? deliveryPriceId,
  });

  Future<ApiResult> updateOrderTracking({
    required int? orderId,
    required String name,
    required String id,
    String? url,
  });

  Future<ApiResult> updateStatusNote({
    required OrderStatus status,
    required List<Notes> notes,
    int? orderId,
  });
}
