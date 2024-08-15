class StatisticsData {
  int? todayCount;
  int? ordersCount;
  int? cancelOrdersCount;
  int? dataNew;
  int? accepted;
  int? ready;
  int? onAWay;
  int? deliveredOrdersCount;
  int? progressOrdersCount;
  num? totalEarned;
  num? deliveryEarned;
  num? commissionEarned;
  int? productsOutOfCount;
  int? productsCount;
  int? reviewsCount;

  StatisticsData({
    this.todayCount,
    this.ordersCount,
    this.cancelOrdersCount,
    this.dataNew,
    this.accepted,
    this.ready,
    this.onAWay,
    this.deliveredOrdersCount,
    this.progressOrdersCount,
    this.totalEarned,
    this.deliveryEarned,
    this.commissionEarned,
    this.productsOutOfCount,
    this.productsCount,
    this.reviewsCount,
  });

  StatisticsData copyWith({
    int? todayCount,
    int? ordersCount,
    int? cancelOrdersCount,
    int? dataNew,
    int? accepted,
    int? ready,
    int? onAWay,
    int? deliveredOrdersCount,
    int? progressOrdersCount,
    num? totalEarned,
    num? deliveryEarned,
    num? commissionEarned,
    int? productsOutOfCount,
    int? productsCount,
    int? reviewsCount,
  }) =>
      StatisticsData(
        todayCount: todayCount ?? this.todayCount,
        ordersCount: ordersCount ?? this.ordersCount,
        cancelOrdersCount: cancelOrdersCount ?? this.cancelOrdersCount,
        dataNew: dataNew ?? this.dataNew,
        accepted: accepted ?? this.accepted,
        ready: ready ?? this.ready,
        onAWay: onAWay ?? this.onAWay,
        deliveredOrdersCount: deliveredOrdersCount ?? this.deliveredOrdersCount,
        progressOrdersCount: progressOrdersCount ?? this.progressOrdersCount,
        totalEarned: totalEarned ?? this.totalEarned,
        deliveryEarned: deliveryEarned ?? this.deliveryEarned,
        commissionEarned: commissionEarned ?? this.commissionEarned,
        productsOutOfCount: productsOutOfCount ?? this.productsOutOfCount,
        productsCount: productsCount ?? this.productsCount,
        reviewsCount: reviewsCount ?? this.reviewsCount,
      );

  factory StatisticsData.fromJson(Map<String, dynamic> json) => StatisticsData(
        todayCount: json["today_count"],
        ordersCount: json["orders_count"],
        cancelOrdersCount: json["cancel_orders_count"],
        dataNew: json["new"],
        accepted: json["accepted"],
        ready: json["ready"],
        onAWay: json["on_a_way"],
        deliveredOrdersCount: json["delivered_orders_count"],
        progressOrdersCount: json["progress_orders_count"],
        totalEarned: json["total_earned"]?.toDouble(),
        deliveryEarned: json["delivery_earned"],
        commissionEarned: json["commission_earned"],
        productsOutOfCount: json["products_out_of_count"],
        productsCount: json["products_count"],
        reviewsCount: json["reviews_count"],
      );

  Map<String, dynamic> toJson() => {
        "today_count": todayCount,
        "orders_count": ordersCount,
        "cancel_orders_count": cancelOrdersCount,
        "new": dataNew,
        "accepted": accepted,
        "ready": ready,
        "on_a_way": onAWay,
        "delivered_orders_count": deliveredOrdersCount,
        "progress_orders_count": progressOrdersCount,
        "total_earned": totalEarned,
        "delivery_earned": deliveryEarned,
        "commission_earned": commissionEarned,
        "products_out_of_count": productsOutOfCount,
        "products_count": productsCount,
        "reviews_count": reviewsCount,
      };
}
