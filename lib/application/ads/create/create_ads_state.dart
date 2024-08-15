import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'create_ads_state.freezed.dart';

@freezed
class CreateExtrasGroupState with _$CreateExtrasGroupState {
  const factory CreateExtrasGroupState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> products,
    @Default(null) AdsPackage? package,
  }) = _CreateExtrasGroupState;

  const CreateExtrasGroupState._();
}
