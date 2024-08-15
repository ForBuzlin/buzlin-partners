import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import '../models/models.dart';
import '../services/services.dart';
import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class OrdersRepository implements OrdersFacade {
  @override
  Future<ApiResult<TransactionsResponse>> createTransaction({
    required int orderId,
    required int paymentId,
  }) async {
    final data = {'payment_sys_id': paymentId};
    debugPrint('===> create transaction body: ${jsonEncode(data)}');
    debugPrint('===> create transaction order id: $orderId');
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/payments/order/$orderId/transactions',
        data: data,
      );
      return ApiResult.success(
        data: TransactionsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create transaction failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<CreateOrderResponse>> createOrder(
    BagData bag, {
    required DeliveryType deliveryType,
    UserData? user,
    required String deliveryTime,
    required List<Stocks> stocks,
  }) async {
    int? shopId = LocalStorage.getShop()?.id;
    List<Map<String, dynamic>> products = [];
    for (final stock in stocks) {
      products.add({
        'stock_id': stock.id,
        'quantity': stock.quantity,
        if (stock.bonus ?? false) 'bonus': true,
      });
    }
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
      'currency_id': LocalStorage.getSelectedCurrency()?.id,
      'rate': LocalStorage.getSelectedCurrency()?.rate,
      'payment_id': bag.selectedPayment?.id,
      if (bag.coupon?.name != null) "coupon": {"$shopId": bag.coupon?.name},
      if (bag.phone != null)
        'phone': (bag.phone ?? user?.phone ?? bag.deliveryAddress?.phone)
            ?.replaceAll("+", "")
            .replaceAll(" ", "")
            .replaceAll("-", ""),
      'delivery_type': deliveryType == DeliveryType.delivery
          ? TrKeys.delivery
          : TrKeys.pickup,
      'user_id': user?.id,
      'data': [
        {
          'shop_id': shopId,
          'products': products,
        }
      ],
      'delivery_date': deliveryTime,
      if (bag.pickupAddress?.deliveryPoint?.id != null &&
          deliveryType != DeliveryType.delivery)
        'delivery_point_id': bag.pickupAddress?.deliveryPoint?.id,
      if (deliveryType == DeliveryType.delivery)
        'address_id': bag.deliveryAddress?.id,
      if (deliveryType == DeliveryType.delivery &&
          bag.deliveryAddress?.deliveryPrice != null)
        'delivery_price_id': bag.deliveryAddress?.deliveryPrice?.id
    };
    debugPrint('===> create order body ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/seller/orders',
        data: data,
      );
      return ApiResult.success(
        data: CreateOrderResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> create order failure: $e,$s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<OrderStatusResponse>> updateOrderStatus({
    required OrderStatus status,
    int? orderId,
  }) async {
    String? statusText;
    switch (status) {
      case OrderStatus.newOrder:
        statusText = 'new';
        break;
      case OrderStatus.accepted:
        statusText = 'accepted';
        break;
      case OrderStatus.ready:
        statusText = 'ready';
        break;
      case OrderStatus.onAWay:
        statusText = 'on_a_way';
        break;
      case OrderStatus.pause:
        statusText = 'pause';
        break;
      case OrderStatus.delivered:
        statusText = 'delivered';
        break;
      case OrderStatus.canceled:
        statusText = 'canceled';
        break;
    }
    final data = {'status': statusText};
    debugPrint('===> update order status request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/seller/order/$orderId/status',
        data: data,
      );
      return ApiResult.success(
        data: OrderStatusResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update order status failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SingleOrderResponse>> getOrderDetails({int? orderId}) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final data = {
        'lang': LocalStorage.getLanguage()?.locale,
      };
      final response = await client.get(
          '/api/v1/dashboard/seller/orders/$orderId',
          queryParameters: data);
      return ApiResult.success(
        data: SingleOrderResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get order details failure: $e,$s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<OrdersPaginateResponse>> getOrders({
    OrderStatus? status,
    int? page,
    String? from,
    String? to,
    String? deliveryType,
    String? paymentStatus,
    int? paymentId,
    List<int>? paymentIds,
  }) async {
    String? statusText;
    switch (status) {
      case OrderStatus.accepted:
        statusText = 'accepted';
        break;
      case OrderStatus.ready:
        statusText = 'ready';
        break;
      case OrderStatus.onAWay:
        statusText = 'on_a_way';
        break;
      case OrderStatus.pause:
        statusText = 'pause';
        break;
      case OrderStatus.delivered:
        statusText = 'delivered';
        break;
      case OrderStatus.canceled:
        statusText = 'canceled';
        break;
      case OrderStatus.newOrder:
        statusText = 'new';
        break;
      default:
        statusText = null;
        break;
    }
    final data = {
      if (page != null) 'page': page,
      if (statusText != null) 'status': statusText,
      if (from != null) 'date_from': from,
      if (to != null) 'date_to': to,
      if (deliveryType != null) 'delivery_type': deliveryType,
      if (paymentStatus != null) 'payment_status': paymentStatus,
      if (paymentId != null && paymentId != -1) 'payment_id': paymentId,
      if (paymentId == -1) "payment_ids": paymentIds,
      'perPage': 10,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/orders/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrdersPaginateResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get order $status failure: $e, $s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<OrdersPaginateResponse>> getHistoryOrders({
    int? page,
    String? from,
    String? to,
  }) async {
    final data = {
      if (page != null) 'page': page,
      'statuses[0]': 'delivered',
      'statuses[1]': 'canceled',
      if (from != null) 'date_from': from,
      if (to != null) 'date_to': to,
      'perPage': 10,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/orders/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrdersPaginateResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> get order failure: $e,$s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<CouponData>> checkCoupon({
    required String coupon,
  }) async {
    final data = {
      'coupon': coupon,
      'shop_id': LocalStorage.getShop()?.id,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final res = await client.post(
        '/api/v1/rest/coupons/check',
        data: data,
      );
      return ApiResult.success(data: CouponData.fromJson(res.data['data']));
    } catch (e) {
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult> updateOrder({
    required StockReplaceData? replaceData,
    required OrderData? order,
    required int? currencyId,
    required String? phone,
  }) async {
    final data = {
      "products": [
        {
          "stock_id": replaceData?.stockId,
          "quantity": replaceData?.quantity,
          "replace_stock_id": replaceData?.replaceStockId,
          "replace_quantity": replaceData?.replaceQuantity,
          "replace_note": replaceData?.replaceNote
        }
      ],
      "currency_id": currencyId,
      if (phone != null) "phone": phone,
      "delivery_type": order?.deliveryType,
      if (order?.myAddress != null) "address": order?.myAddress?.toJson(),
      if (order?.deliveryPoint != null)
        "delivery_point_id": order?.deliveryPoint?.id,
    };
    debugPrint("replace order body: ${jsonEncode(data)}");
    try {
      final client = dioHttp.client(requireAuth: true);
      final res = await client.put(
        '/api/v1/dashboard/seller/orders/${order?.id}',
        data: data,
      );
      return ApiResult.success(data: res);
    } catch (e) {
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<ProductCalculateResponse>> getAllCalculations(
    BagData bag,
    String type, {
    int? bagIndex,
    int? deliveryPriceId,
  }) async {
    int? shopId = LocalStorage.getShop()?.id;
    final data = {
      'currency_id':
          bag.selectedCurrency?.id ?? LocalStorage.getSelectedCurrency()?.id,
      'shop_id': shopId,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
      if (bag.pickupAddress?.deliveryPoint?.id != null && type != 'delivery')
        'delivery_type': type.isEmpty ? TrKeys.delivery : type,
      if (deliveryPriceId != null && type != 'point')
        'delivery_type': type.isEmpty ? TrKeys.delivery : type,
      if (bag.coupon?.name != null) "coupon[$shopId]": bag.coupon?.name,
      if (bag.pickupAddress?.deliveryPoint?.id != null && type != 'delivery')
        'delivery_point_id': bag.pickupAddress?.deliveryPoint?.id,
      if (deliveryPriceId != null) 'delivery_price_id': deliveryPriceId,
    };
    for (int i = 0; i < (bag.bagProducts?.length ?? 0); i++) {
      data['products[$i][stock_id]'] = bag.bagProducts?[i].stockId;
      data['products[$i][quantity]'] = bag.bagProducts?[i].quantity;
      for (int j = 0; j < (bag.bagProducts?[i].carts?.length ?? 0); j++) {
        data['products[$i$j][stock_id]'] =
            bag.bagProducts?[i].carts?[j].stockId;
        data['products[$i$j][quantity]'] =
            bag.bagProducts?[i].carts?[j].quantity;
        data['products[$i$j][parent_id]'] =
            bag.bagProducts?[i].carts?[j].parentId;
      }
    }

    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/order/products/calculate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductCalculateResponse.fromJson(response.data),
      );
    } catch (e, s) {
      AppHelpers.stockHandler(
        e,
        bagIndex: bagIndex ?? 0,
        success: () {
          getAllCalculations(bag, type, bagIndex: bagIndex);
        },
      );
      debugPrint('==> get order calculate failure: $e,$s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> updateOrderTracking({
    required int? orderId,
    required String name,
    required String id,
    String? url,
  }) async {
    final data = {
      'track_name': name,
      'track_id': id,
      if (url != null) 'track_url': url,
    };
    debugPrint('==> update order tracking request: ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/seller/order/$orderId/tracking',
        queryParameters: data,
      );
      return ApiResult.success(
        data: response.data,
      );
    } catch (e, s) {
      debugPrint('==> update order tracking failure: $e,$s');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult> updateStatusNote({
    required OrderStatus status,
    required List<Notes> notes,
    int? orderId,
  }) async {
    String? statusText;
    switch (status) {
      case OrderStatus.newOrder:
        statusText = 'new';
        break;
      case OrderStatus.accepted:
        statusText = 'accepted';
        break;
      case OrderStatus.ready:
        statusText = 'ready';
        break;
      case OrderStatus.onAWay:
        statusText = 'on_a_way';
        break;
      case OrderStatus.pause:
        statusText = 'pause';
        break;
      case OrderStatus.delivered:
        statusText = 'delivered';
        break;
      case OrderStatus.canceled:
        statusText = 'canceled';
        break;
    }
    final data = {
      'status': statusText,
      "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
    };
    debugPrint('===> update order status request ${jsonEncode(data)}');
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/seller/order/$orderId/status',
        data: data,
      );
      return ApiResult.success(
        data: OrderStatusResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update order status failure: $e');
      return ApiResult.failure(
          error: AppHelpers.errorHandler(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }
}
