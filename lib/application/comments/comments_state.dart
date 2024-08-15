import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'comments_state.freezed.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState({
    @Default(false) bool isLoading,
    @Default([]) List<CommentsData> productComments,
    @Default([]) List<ShopCommentsData> shopComments,
    @Default(1) int activeIndex,
  }) = _CommentsState;

  const CommentsState._();
}
