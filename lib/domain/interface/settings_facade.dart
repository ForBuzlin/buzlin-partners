import '../handlers/handlers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

abstract class SettingsFacade {
  Future<ApiResult<GalleryUploadResponse>> uploadImage(
    String filePath,
    UploadType uploadType,
  );

  Future<ApiResult<MultiGalleryUploadResponse>> uploadMultiImage(
    List<String?> filePaths,
    UploadType uploadType,
  );

  Future<ApiResult<CurrenciesResponse>> getCurrencies();

  Future<ApiResult<SettingsResponse>> getGlobalSettings();

  Future<ApiResult<ProfileResponse>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String birthday,
    required String gender,
    String? image,
    String? password,
    String? confirmPassword,
  });

  Future<ApiResult<MobileTranslationsResponse>> getTranslations({
    String? lang,
    int? id,
  });

  Future<ApiResult<LanguagesResponse>> getLanguages();
}
