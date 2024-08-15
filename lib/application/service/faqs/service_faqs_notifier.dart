import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/infrastructure/models/data/faq_data.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'service_faqs_state.dart';

class ServiceFaqsNotifier extends StateNotifier<ServiceFaqsState> {
  ServiceFaqsNotifier() : super(const ServiceFaqsState());
  List<FaqData> _localFaqs = [];

  void deleteFaq({required int index}) {
    _localFaqs.removeAt(index);
    state = state.copyWith(faqs: _localFaqs);
  }

  void setQuestion({required String value, required int index}) {
    _localFaqs[index] = _localFaqs[index].copyWith(
      translation: (_localFaqs[index].translation ?? FaqTranslation())
          .copyWith(question: value),
    );
  }

  void setAnswer({required String value, required int index}) {
    _localFaqs[index] = _localFaqs[index].copyWith(
      translation: (_localFaqs[index].translation ?? FaqTranslation())
          .copyWith(answer: value),
    );
  }

  Future<void> updateFaq(
    BuildContext context, {
    int? serviceId,
    VoidCallback? updated,
  }) async {
    state = state.copyWith(isSaving: true);
    final response = await serviceRepository.updateFaqs(
      faqs: _localFaqs,
      serviceId: serviceId ?? state.service?.id,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isSaving: false);
        updated?.call();
      },
      failure: (failure, status) {
        state = state.copyWith(isSaving: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  void setInitialFaqs({ServiceData? service}) {
    List<FaqData> faqs = List.from(service?.faqs ?? []);
    if (faqs.isEmpty) faqs.add(FaqData());
    state = state.copyWith(faqs: faqs, service: service);
    _localFaqs = faqs;
  }

  void addEmptyStock() {
    _localFaqs.add(FaqData());
    state = state.copyWith(faqs: _localFaqs);
  }
}
