import 'package:venderuzmart/domain/handlers/api_result.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/models/response/gift_card_response.dart';
import 'package:venderuzmart/infrastructure/models/response/single_gift_card_response.dart';

abstract class GiftCardFacade {
  Future<ApiResult<SingleGiftCardResponse>> getGiftCardDetails(int? id);

  Future<ApiResult<GiftCardResponse>> getGiftCarts({int? page});

  Future<ApiResult<void>> deleteGiftCard(int? id);

  Future<ApiResult> addGiftCards({
    required String title,
    required String description,
    required String? time,
    required num price,
    required bool active
  });

  Future<ApiResult> updateGiftCard({
    required String title,
    required String description,
    required String? time,
    required num price,
    required int? id,
    required bool active
  });

  Future<ApiResult<UserGiftCardResponse>> getUserGiftCards({
    int? page,
    String? search,
  });
}
