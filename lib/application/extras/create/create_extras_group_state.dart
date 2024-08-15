import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

part 'create_extras_group_state.freezed.dart';

@freezed
class CreateExtrasGroupState with _$CreateExtrasGroupState {
  const factory CreateExtrasGroupState({
    @Default(false) bool isLoading,
    @Default(TrKeys.text) String type,
    @Default("") String title,
  }) = _CreateExtrasGroupState;

  const CreateExtrasGroupState._();
}
