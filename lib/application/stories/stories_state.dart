import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'stories_state.freezed.dart';

@freezed
class StoriesState with _$StoriesState {
  const factory StoriesState({
    @Default(false) bool isLoading,
    @Default([]) List<StoriesData> stories,
  }) = _StoriesState;

  const StoriesState._();
}
