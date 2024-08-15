import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'add_forms_state.freezed.dart';

@freezed
class AddFormOptionState with _$AddFormOptionState {
  const factory AddFormOptionState({
    @Default(false) bool isLoading,
    @Default(true) bool active,
    @Default(true) bool required,
    FormOptionsData? form,
    @Default([]) List<QuestionData> questions,
  }) = _AddFormOptionState;

  const AddFormOptionState._();
}
