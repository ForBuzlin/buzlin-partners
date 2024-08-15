import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_forms_state.freezed.dart';

@freezed
class EditFormOptionState with _$EditFormOptionState {
  const factory EditFormOptionState({
    @Default(false) bool isLoading,
    @Default(true) bool active,
    @Default(true) bool required,
    FormOptionsData? form,
    @Default([]) List<QuestionData> questions,
  }) = _EditFormOptionState;

  const EditFormOptionState._();
}
