class StockReplaceData {
  int? stockId;
  int? quantity;
  int? replaceStockId;
  int? replaceQuantity;
  String? replaceNote;

  StockReplaceData({
    this.stockId,
    this.quantity,
    this.replaceStockId,
    this.replaceQuantity,
    this.replaceNote,
  });

  StockReplaceData copyWith({
    int? stockId,
    int? quantity,
    int? replaceStockId,
    int? replaceQuantity,
    String? replaceNote,
  }) =>
      StockReplaceData(
        stockId: stockId ?? this.stockId,
        quantity: quantity ?? this.quantity,
        replaceStockId: replaceStockId ?? this.replaceStockId,
        replaceQuantity: replaceQuantity ?? this.replaceQuantity,
        replaceNote: replaceNote ?? this.replaceNote,
      );

  factory StockReplaceData.fromJson(Map<String, dynamic> json) => StockReplaceData(
    stockId: json["id"],
    quantity: json["quantity"],
    replaceStockId: json["replace_stock_id"],
    replaceQuantity: json["replace_quantity"],
    replaceNote: json["replace_note"],
  );

  Map<String, dynamic> toJson() => {
    "id": stockId,
    "quantity": quantity,
    "replace_stock_id": replaceStockId,
    "replace_quantity": replaceQuantity,
    "replace_note": replaceNote,
  };
}
