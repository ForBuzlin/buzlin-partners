import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'product_detail_state.freezed.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState({
    @Default(false) bool isLoading,
    @Default([]) List<TypedExtra> typedExtras,
    @Default([]) List<Stocks> initialStocks,
    @Default([]) List<int> selectedIndexes,
    @Default(null) Galleries? selectImage,
    @Default(null) Stocks? selectedStock,
    ProductData? productData,
    PriceData? paginateResponse,
  }) = _ProductDetailState;

  const ProductDetailState._();
}
