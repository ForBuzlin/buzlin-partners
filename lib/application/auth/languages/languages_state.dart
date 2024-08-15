import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'languages_state.freezed.dart';

@freezed
class LanguagesState with _$LanguagesState {
  const factory LanguagesState({
    @Default([]) List<LanguageData> languages,
    @Default(0) int index,
    @Default(false) bool isLoading,
    @Default(true) bool isSelectLanguage,
  }) = _LanguagesState;

  const LanguagesState._();
}
