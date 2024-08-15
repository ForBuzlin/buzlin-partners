import 'package:flutter/material.dart';
import 'package:venderuzmart/domain/handlers/api_result.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

abstract class MembershipFacade {
  Future<ApiResult<SingleMembershipResponse>> getMembershipsDetails(int? id);

  Future<ApiResult<MembershipResponse>> getMemberships({int? page});

  Future<ApiResult<void>> deleteMembership(int? id);

  Future<ApiResult<SingleMembershipResponse>> addMembership({
    required String title,
    required String description,
    required String term,
    required Color? color,
    required String? time,
    required List<int?> services,
    required num price,
    required int? sessions,
  });

  Future<ApiResult<SingleMembershipResponse>> updateMembership({
    required String title,
    required String description,
    required String term,
    required Color? color,
    required String? time,
    required List<int?> services,
    required num price,
    required int? sessions,
    required int? id,
  });

  Future<ApiResult<UserMembershipsResponse>> getUserMemberships({
    int? page,
    String? search,
  });
}
