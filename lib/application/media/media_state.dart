import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_state.freezed.dart';

@freezed
class MediaState with _$MediaState {
  const factory MediaState({
    @Default(false) bool isLoading,
    @Default(null) String? videoPath,
    @Default(null) String? imagePath,
  }) = _MediaState;
}
