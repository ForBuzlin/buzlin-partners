import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'edit_masters_state.dart';

class EditMastersNotifier extends StateNotifier<EditMastersState> {
  final MastersFacade _mastersRepository;
  final SettingsFacade _settingsRepository;

  EditMastersNotifier(this._mastersRepository, this._settingsRepository)
      : super(const EditMastersState());

  void setImageFile(String? file) {
    state = state.copyWith(imageFile: file);
  }

  String? _phone;
  String? _gender;

  void setPhone(String? phone) => _phone = phone;

  void setGender(String? gender) => _gender = gender;

  void setMaster(UserData? master) => state = state.copyWith(master: master);

  Future<void> fetchMasterDetails({
    required BuildContext context,
    UserData? master,
  }) async {
    state = state.copyWith(isLoading: true, isUpdating: false);
    final res = await _mastersRepository.getMastersDetails(master?.uuid);
    res.when(success: (data) {
      state = state.copyWith(isLoading: false, master: data.data);
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  Future<void> updateWorkingDays(List<WorkingDay> days) async {
    final master = state.master?.copyWith(workingDays: days);
    state = state.copyWith(master: master);
  }

  Future<void> updateMaster(
    BuildContext context, {
    required String firstname,
    required String lastname,
    required String email,
    ValueChanged<UserData?>? updated,
    VoidCallback? failed,
  }) async {
    state = state.copyWith(isUpdating: true);
    String? imageUrl;
    if (state.imageFile != null) {
      final imageResponse = await _settingsRepository.uploadImage(
        state.imageFile!,
        UploadType.products,
      );
      imageResponse.when(
        success: (data) {
          imageUrl = data.imageData?.title;
        },
        failure: (failure, status) {
          debugPrint('==> upload master image fail: $failure');
          AppHelpers.errorSnackBar(context, text: failure);
        },
      );
    }
    final response = await _mastersRepository.updateMaster(
      state.master?.copyWith(
        firstname: firstname,
        lastname: lastname,
        img: imageUrl,
        email: email,
        phone: _phone,
        gender: _gender,
      ),
    );
    response.when(
      success: (data) {
        state =
            state.copyWith(imageFile: null, isUpdating: false, master: null);
        updated?.call(data.data);
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
        state = state.copyWith(isUpdating: false);
        debugPrint('===>  update master #${state.master?.id} fail $failure');
        failed?.call();
      },
    );
  }
}
