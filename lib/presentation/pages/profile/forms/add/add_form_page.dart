import 'package:venderuzmart/application/forms/add/add_forms_notifier.dart';
import 'package:venderuzmart/application/forms/add/add_forms_provider.dart';
import 'package:venderuzmart/presentation/pages/profile/edit_shop/widgets/location_button.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remixicon/remixicon.dart';
import 'package:auto_route/auto_route.dart';
import '../widget/parent_form_modal.dart';
import 'package:flutter/material.dart';
import '../widget/services_modal.dart';

@RoutePage()
class AddFormPage extends ConsumerStatefulWidget {
  const AddFormPage({super.key});

  @override
  ConsumerState<AddFormPage> createState() => _AddFormPageState();
}

class _AddFormPageState extends ConsumerState<AddFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController desc;
  late TextEditingController service;
  late TextEditingController template;
  late AddFormNotifier notifier;

  @override
  void initState() {
    title = TextEditingController();
    desc = TextEditingController();
    service = TextEditingController();
    template = TextEditingController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(addFormProvider.notifier).initialForm(context: context),
    );
  }

  @override
  void didChangeDependencies() {
    notifier = ref.read(addFormProvider.notifier);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    title.dispose();
    desc.dispose();
    service.dispose();
    template.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addFormProvider);
    return KeyboardDisable(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppBar(
              child: Row(
                children: [
                  const PopButton(),
                  Text(AppHelpers.getTranslation(TrKeys.addFormOption)),
                ],
              ),
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: REdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    children: [
                      24.verticalSpace,
                      UnderlinedTextField(
                        label: AppHelpers.getTranslation(TrKeys.selectTemplate),
                        readOnly: true,
                        textController: template,
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        onTap: () {
                          AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            modal: ParentFormModal(onSelect: (form) {
                              template.text = form.translation?.title ?? '';
                              title.text = form.translation?.title ?? '';
                              desc.text = form.translation?.description ?? '';
                              notifier.setTemplate(form);
                            }),
                          );
                        },
                      ),
                      16.verticalSpace,
                      UnderlinedTextField(
                        label: '${AppHelpers.getTranslation(TrKeys.title)}*',
                        textInputAction: TextInputAction.next,
                        textController: title,
                        validator: AppValidators.emptyCheck,
                      ),
                      12.verticalSpace,
                      UnderlinedTextField(
                        label: AppHelpers.getTranslation(TrKeys.description),
                        textInputAction: TextInputAction.next,
                        textController: desc,
                      ),
                      12.verticalSpace,
                      UnderlinedTextField(
                        readOnly: true,
                        label: "${AppHelpers.getTranslation(TrKeys.service)}*",
                        textInputAction: TextInputAction.next,
                        validator: AppValidators.emptyCheck,
                        textController: service,
                        onTap: () {
                          AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            modal: ServicesModal(onSelect: (s) {
                              service.text = s.service?.translation?.title ?? '';
                              notifier.setService(s);
                            }),
                          );
                        },
                      ),
                      12.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomToggle(
                            label: TrKeys.active,
                            controller: ValueNotifier<bool>(state.active),
                            onChange: (v) => notifier.setActive(),
                          ),
                          16.horizontalSpace,
                          CustomToggle(
                            label: TrKeys.required,
                            controller: ValueNotifier<bool>(state.required),
                            onChange: (v) => notifier.setRequired(),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      Container(
                        padding:
                            REdgeInsets.symmetric(vertical: 8, horizontal: 6),
                        decoration: BoxDecoration(
                          color: Style.whiteWithOpacity,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Style.white),
                        ),
                        child: Column(children: [
                          ...state.questions.mapIndexed(
                            (e, i) => _questionField(e, i),
                          ),
                          LocationButton(
                            title: TrKeys.add,
                            icon: Icons.add,
                            onTap: () => notifier.addQuestion(),
                          ),
                        ]),
                      ),
                      24.verticalSpace,
                      CustomButton(
                        title: AppHelpers.getTranslation(TrKeys.save),
                        isLoading: state.isLoading,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            notifier.createForm(
                              context,
                              created: (value) {
                                ref.read(formProvider.notifier).fetchForms(
                                      context: context,
                                      isRefresh: true,
                                    );
                                Navigator.pop(context);
                              },
                              title: title.text,
                              description: desc.text,
                            );
                          }
                        },
                      ),
                      56.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _questionField(QuestionData question, int index) {
    return Container(
      margin: REdgeInsets.only(bottom: 8),
      padding: REdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Style.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDropDown(
            value: question.answerType,
            list: DropDownValues.answerType,
            onChanged: (e) => notifier.changeAnswerType(e, index),
            label: TrKeys.answerType,
          ),
          8.verticalSpace,
          CustomTextFormField(
            initialText: question.question,
            onChanged: (e) {
              notifier.setQuestion(e, index);
            },
            validation: AppValidators.emptyCheck,
            label: TrKeys.question,
          ),
          12.verticalSpace,
          if (AppHelpers.getQuestionAnswer(question.answerType))
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${AppHelpers.getTranslation(TrKeys.answer)}*",
                  style: Style.interNormal(size: 14),
                ),
                ...?question.answer?.mapIndexed((e, i) => Padding(
                      padding: REdgeInsets.only(top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              initialText: e,
                              onChanged: (e) {
                                notifier.setQuestionAnswer(e, index, i);
                              },
                              validation: AppValidators.emptyCheck,
                            ),
                          ),
                          if (i != 0)
                            ButtonEffectAnimation(
                              child: GestureDetector(
                                onTap: () =>
                                    notifier.deleteQuestionAnswer(index, i),
                                child: Container(
                                  width: 36.r,
                                  height: 36.r,
                                  margin: REdgeInsets.only(left: 10, top: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        (AppConstants.radius / 1.6).r),
                                    color: Style.greyColor,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Remix.close_circle_line,
                                    size: 21.r,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    )),
                TextButton(
                    onPressed: () => notifier.addQuestionAnswer(index),
                    child: Text(
                      "+ ${AppHelpers.getTranslation(TrKeys.addAnswer)}",
                      style: Style.interNormal(size: 14, color: Style.primary),
                    )),
                8.verticalSpace,
              ],
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (question.answerType != 'description_text')
                CustomToggle(
                  label: TrKeys.required,
                  controller: ValueNotifier<bool>(question.required == 1),
                  onChange: (value) => notifier.setQuestionRequired(index),
                ),
              const Spacer(),
              if (index != 0)
                ButtonEffectAnimation(
                  child: GestureDetector(
                    onTap: () => notifier.deleteQuestion(index),
                    child: Container(
                      width: 38.r,
                      height: 38.r,
                      margin: REdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            (AppConstants.radius / 1.6).r),
                        color: Style.greyColor,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Remix.delete_bin_line,
                        size: 19.r,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
