import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../widget/service_multi_selection.dart';

@RoutePage()
class AddMembershipPage extends ConsumerStatefulWidget {
  const AddMembershipPage({super.key});

  @override
  ConsumerState<AddMembershipPage> createState() => _AddMembershipPageState();
}

class _AddMembershipPageState extends ConsumerState<AddMembershipPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController desc;
  late TextEditingController term;
  late TextEditingController price;
  late TextEditingController sessionsCount;
  late AddMembershipNotifier notifier;

  @override
  void initState() {
    title = TextEditingController();
    desc = TextEditingController();
    term = TextEditingController();
    price = TextEditingController();
    sessionsCount = TextEditingController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(addMembershipProvider.notifier).clear(),
    );
  }

  @override
  void didChangeDependencies() {
    notifier = ref.read(addMembershipProvider.notifier);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    title.dispose();
    desc.dispose();
    term.dispose();
    price.dispose();
    sessionsCount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addMembershipProvider);
    return KeyboardDisable(
      child: Scaffold(
        body: state.membership == null || state.isLoading
            ? const Loading()
            : Column(
                children: [
                  CommonAppBar(
                    child: Row(
                      children: [
                        const PopButton(),
                        Text(AppHelpers.getTranslation(TrKeys.addMembership)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        padding: REdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            24.verticalSpace,
                            UnderlinedTextField(
                              label:
                                  '${AppHelpers.getTranslation(TrKeys.title)}*',
                              textInputAction: TextInputAction.next,
                              textController: title,
                              validator: AppValidators.emptyCheck,
                            ),
                            12.verticalSpace,
                            UnderlinedTextField(
                              label:
                                  '${AppHelpers.getTranslation(TrKeys.description)}*',
                              textInputAction: TextInputAction.next,
                              textController: desc,
                              validator: AppValidators.emptyCheck,
                            ),
                            12.verticalSpace,
                            UnderlinedTextField(
                              label:
                                  '${AppHelpers.getTranslation(TrKeys.term)}*',
                              textInputAction: TextInputAction.next,
                              textController: term,
                              validator: AppValidators.emptyCheck,
                            ),
                            12.verticalSpace,
                            _servicesItem(state),
                            12.verticalSpace,
                            UnderlinedTextField(
                              label: AppHelpers.getPriceLabel,
                              textInputAction: TextInputAction.next,
                              textController: price,
                              inputFormatters: [InputFormatter.currency],
                              validator: AppValidators.isNumberValidator,
                            ),
                            12.verticalSpace,
                            UnderlineDropDown(
                              value: state.membership?.time,
                              list: DropDownValues.timeOptionsList,
                              onChanged: notifier.setTime,
                              label: TrKeys.time,
                            ),
                            12.verticalSpace,
                            UnderlineDropDown(
                              value: DropDownValues.sessionsList[
                                  ((state.membership?.sessions ?? 2) - 1)],
                              list: DropDownValues.sessionsList,
                              onChanged: notifier.setSession,
                              label: TrKeys.session,
                            ),
                            12.verticalSpace,
                            if (state.membership?.sessions == 1)
                              UnderlinedTextField(
                                label: TrKeys.sessionsCount,
                                textInputAction: TextInputAction.next,
                                textController: sessionsCount,
                                inputFormatters: [InputFormatter.currency],
                                validator: AppValidators.isNumberValidator,
                              ),
                            16.verticalSpace,
                            ColorPicker(
                              pickerAreaBorderRadius: BorderRadius.circular(
                                AppConstants.radius / 0.8,
                              ),
                              enableAlpha: false,
                              displayThumbColor: true,
                              labelTypes: ColorLabelType.values,
                              colorPickerWidth: 160.r,
                              pickerColor:
                                  state.membership?.color ?? Style.primary,
                              onColorChanged: notifier.setColor,
                            ),
                            16.verticalSpace,
                            CustomButton(
                              title: AppHelpers.getTranslation(TrKeys.save),
                              isLoading: state.isLoading,
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  if (state.services.isEmpty) {
                                    AppHelpers.errorSnackBar(
                                      context,
                                      text: AppHelpers.getTranslation(
                                          TrKeys.serviceIsRequired),
                                    );
                                    return;
                                  }
                                  notifier.createMembership(
                                    context,
                                    created: (value) {
                                      ref
                                          .read(membershipProvider.notifier)
                                          .fetchMemberships(
                                            context: context,
                                            isRefresh: true,
                                          );
                                      Navigator.pop(context);
                                    },
                                    title: title.text,
                                    description: desc.text,
                                    term: term.text,
                                    price: price.text,
                                    sessionCount: sessionsCount.text,
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

  _servicesItem(AddMembershipState state) {
    return GestureDetector(
      onTap: () {
        AppHelpers.showCustomModalBottomSheet(
          context: context,
          modal: const ModalWrap(
            body: ServiceMultiSelection(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Style.colorGrey, width: 0.5.r),
          ),
        ),
        height: 30.r,
        width: MediaQuery.sizeOf(context).width,
        child: state.services.isEmpty
            ? Text(
                AppHelpers.getTranslation(TrKeys.select),
                style: Style.interNormal(size: 14, color: Style.colorGrey),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.services.length,
                itemBuilder: (context, index) {
                  final service = state.services[index];
                  return CustomChip(
                    label: service.translation?.title,
                    onDeleted: () {
                      notifier.deleteService(service.id);
                    },
                  );
                },
              ),
      ),
    );
  }
}
