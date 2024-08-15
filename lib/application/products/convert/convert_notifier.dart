import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'convert_state.dart';

class ConvertNotifier extends StateNotifier<ConvertState> {
  final ProductsFacade _productRepository;

  ConvertNotifier(this._productRepository) : super(const ConvertState());

  changeProgress(double value) {
    state = state.copyWith(progress: value);
  }

  setFile(File value) {
    state = state.copyWith(file: value);
  }

  setName(String value) {
    state = state.copyWith(name: value);
  }

  Future<void> uploadFile(BuildContext context,
      {required int? productId}) async {
    final res = await _productRepository.updateDigitalFile(
        filePath: state.file?.path ?? '', productId: productId);
    res.when(
        success: (success) {},
        failure: (failure, status) {
          AppHelpers.errorSnackBar(context,text: failure);
        });
  }
}
