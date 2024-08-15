import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

abstract class UsersFacade {
  Future<ApiResult<ProfileResponse>> createUser({
    required String firstname,
    required String phone,
    required String email,
    String? lastname,
    String? title,
    String? desc,
    String? role,
    String? image,
    String? password,
  });

  Future<ApiResult<UsersPaginateResponse>> searchUsers({
    String? query,
    String? role,
    String? inviteStatus,
    int? page,
    int? serviceId,
  });

  Future<ApiResult<SingleShopResponse>> getMyShop();

  Future<ApiResult<ShopCategoryResponse>> getCategory();

  Future<ApiResult<dynamic>> setOnlineOffline();

  Future<ApiResult<ProfileResponse>> getProfileDetails();

  Future<ApiResult<ProfileResponse>> editProfile({required EditProfile? user});

  Future<ApiResult<ProfileResponse>> updateProfileImage({
    required String firstName,
    required String imageUrl,
  });

  Future<ApiResult<ProfileResponse>> updatePassword({
    required String password,
    required String passwordConfirmation,
  });

  Future<ApiResult<void>> updateFirebaseToken(String? token);

  Future<ApiResult<bool>> checkDriverZone(LatLng location, {int? shopId});

  Future<ApiResult<dynamic>> deleteAccount();

  Future<ApiResult<dynamic>> logOut();

  Future<ApiResult<TransactionPaginationResponse>> getTransactions(int page);

  Future<ApiResult> updateStatus({
    required int? id,
    required String status,
  });

}
