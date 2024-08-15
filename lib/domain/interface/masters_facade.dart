import 'package:venderuzmart/domain/handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

abstract class MastersFacade {
  Future<ApiResult<UsersPaginateResponse>> getMasters({
    String? query,
    String? inviteStatus,
    int? page,
    int? serviceId,
  });

  Future<ApiResult> updateMasterStatus({
    required int? id,
    required String status,
  });

  Future<ApiResult<ProfileResponse>> getMastersDetails(String? uuid);

  Future<ApiResult<ProfileResponse>> updateMaster(UserData? user);

  Future<ApiResult<void>> updateDisableTimes({
    required DisableTimes? time,
    int? id,
  });

  Future<ApiResult<void>> addDisableTimes({
    required DisableTimes? time,
  });

  Future<ApiResult<void>> createDisableTimes(DisableTimes? time);

  Future<ApiResult<void>> updateClosedDays({
    required List<DateTime> days,
    int? masterId,
  });

  Future<ApiResult<ClosedDatesResponse>> getClosedDays({
    int? masterId,
    DateTime? to,
    DateTime? from,
  });

  Future<ApiResult<DisableTimesResponse>> getDisableTimes(
      {int? masterId, int? page});

  Future<ApiResult<SingleDisableTimeResponse>> getDisableTimeDetails(int? id);

  Future<ApiResult<void>> updateWorkingDays({
    required List<WorkingDay> workingDays,
    int? id,
  });

  Future<ApiResult<void>> deleteDisableTimes(int? id);

  Future<ApiResult<List<Galleries>>> getGalleries();

  Future<ApiResult> setGalleries({
    required List<String> images,
    List<String>? previews,
  });
}
