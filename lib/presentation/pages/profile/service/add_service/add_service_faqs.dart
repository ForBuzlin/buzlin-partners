import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/application/service/faqs/service_faqs_provider.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/pages/profile/service/edit_service/widgets/editable_faq_item.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class AddServiceFaqs extends ConsumerStatefulWidget {
  const AddServiceFaqs({super.key});

  @override
  ConsumerState<AddServiceFaqs> createState() => _AddServiceFaqsState();
}

class _AddServiceFaqsState extends ConsumerState<AddServiceFaqs> {
  late TextEditingController questions;
  late TextEditingController answers;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    questions = TextEditingController();
    answers = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(serviceFaqsProvider.notifier).setInitialFaqs();
    });
    super.initState();
  }

  @override
  void dispose() {
    questions.dispose();
    answers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(serviceFaqsProvider);
    final notifier = ref.read(serviceFaqsProvider.notifier);
    return KeyboardDisable(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: state.faqs.length,
                      shrinkWrap: true,
                      padding:
                          REdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return EditableFaqItem(
                          key: UniqueKey(),
                          faq: state.faqs[index],
                          onDeleteFaq: state.faqs.length > 1
                              ? () => notifier.deleteFaq(index: index)
                              : null,
                          onAnswerChange: (value) =>
                              notifier.setAnswer(value: value, index: index),
                          onQuestionChange: (value) =>
                              notifier.setQuestion(value: value, index: index),
                        );
                      },
                    ),
                    12.verticalSpace,
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      child: CustomButton(
                        height: 36.r,
                        radius: AppConstants.radius,
                        background: Style.transparent,
                        borderColor: Style.black,
                        textColor: Style.black,
                        title: TrKeys.add,
                        onPressed: () {
                          notifier.addEmptyStock();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              title: AppHelpers.getTranslation(TrKeys.save),
              isLoading: state.isSaving,
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  notifier.updateFaq(
                    context,
                    serviceId: ref.watch(addServiceProvider).serviceData?.id,
                    updated: () {
                      AppHelpers.successSnackBar(
                        context,
                        text: AppHelpers.getTranslation(
                            TrKeys.successfullyUpdated),
                      );
                      Navigator.pop(context);
                    },
                  );
                }
              },
            ),
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
