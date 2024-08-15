import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/data/faq_data.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'service_faqs_state.freezed.dart';

@freezed
class ServiceFaqsState with _$ServiceFaqsState {
  const factory ServiceFaqsState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default([])  List<FaqData> faqs,
    @Default(null) ServiceData? service,
  }) = _ServiceFaqsState;

  const ServiceFaqsState._();
}
