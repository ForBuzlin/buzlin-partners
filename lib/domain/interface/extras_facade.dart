import '../handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

abstract class ExtrasFacade {
  Future<ApiResult<void>> deleteExtrasGroup({int? groupId});

  Future<ApiResult<SingleExtrasGroupResponse>> updateExtrasGroup({
    required String title,
    int? groupId,
  });

  Future<ApiResult<void>> deleteExtrasItem({
    required int extrasId,
  });

  Future<ApiResult<CreateGroupExtrasResponse>> updateExtrasItem({
    required int extrasId,
    required int groupId,
    required String title,
  });

  Future<ApiResult<CreateGroupExtrasResponse>> createExtrasItem({
    required int groupId,
    required String title,
  });

  Future<ApiResult<SingleExtrasGroupResponse>> createExtrasGroup({
    required String title,
    required String type,
  });

  Future<ApiResult<GroupExtrasResponse>> getExtras({int? groupId});

  Future<ApiResult<SingleProductResponse>> updateExtras({
    required List<int> extrasIds,
    String? productUuid,
  });

  Future<ApiResult<ExtrasGroupsResponse>> getExtrasGroups({
    bool needOnlyValid = true,
  });
}
