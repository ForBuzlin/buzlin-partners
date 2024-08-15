import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'forms_state.freezed.dart';

@freezed
class FormOptionState with _$FormOptionState {
  const factory FormOptionState({
    @Default(false) bool isLoading,
    @Default(false) bool isParentLoading,
    @Default([]) List<FormOptionsData> list,
    @Default([]) List<FormOptionsData> parentForms,
  }) = _FormOptionState;

  const FormOptionState._();
}
