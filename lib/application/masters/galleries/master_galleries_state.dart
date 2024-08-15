import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'master_galleries_state.freezed.dart';

@freezed
class MasterGalleriesState with _$MasterGalleriesState {
  const factory MasterGalleriesState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    @Default([]) List<String> images,
    @Default([]) List<Galleries> listOfUrls,
  }) = _MasterGalleriesState;

  const MasterGalleriesState._();
}
