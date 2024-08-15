import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/service_extras/add/add_service_master_provider.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

import '../../masters/service_masters/widgets/services_modal.dart';

@RoutePage()
class AddExtrasPage extends ConsumerStatefulWidget {
  const AddExtrasPage({super.key});

  @override
  ConsumerState<AddExtrasPage> createState() => _AddExtrasPageState();
}

class _AddExtrasPageState extends ConsumerState<AddExtrasPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController price;
  late TextEditingController service;
  ServiceData? selectService;

  @override
  void initState() {
    title = TextEditingController();
    service = TextEditingController();
    price = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(addServiceExtrasProvider.notifier).clear();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addServiceExtrasProvider);
    final notifier = ref.read(addServiceExtrasProvider.notifier);
    return KeyboardDisable(
      child: Scaffold(
        body: Column(
          children: [
            const CommonAppBar(
              child: Row(
                children: [
                  PopButton(),
                  Expanded(child: TitleAndIcon(title: TrKeys.addServiceExtras)),
                ],
              ),
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        24.verticalSpace,
                        SingleImagePicker(
                          isEdit: true,
                          height: MediaQuery.sizeOf(context).width / 3,
                          width: MediaQuery.sizeOf(context).width / 3,
                          isAdding: state.extrasData?.img == null,
                          imageFilePath: state.imageFile,
                          imageUrl: state.extrasData?.img,
                          onImageChange: notifier.setImageFile,
                          onDelete: () => notifier.setImageFile(null),
                        ),
                        24.verticalSpace,
                        UnderlinedTextField(
                          readOnly: true,
                          onTap: () {
                            AppHelpers.showCustomModalBottomSheet(
                              context: context,
                              modal: ModalWrap(
                                body: ServicesModal(
                                  onChange: (value) {
                                    selectService = value;
                                    service.text =
                                        value.translation?.title ?? '';
                                  },
                                ),
                              ),
                            );
                          },
                          label:
                              "${AppHelpers.getTranslation(TrKeys.service)}*",
                          textInputAction: TextInputAction.next,
                          validator: AppValidators.emptyCheck,
                          textController: service,
                        ),
                        16.horizontalSpace,
                        UnderlinedTextField(
                          label: AppHelpers.getTranslation(TrKeys.title),
                          inputType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          textController: title,
                          validator: AppValidators.emptyCheck,
                        ),
                        16.horizontalSpace,
                        UnderlinedTextField(
                          label: AppHelpers.getPriceLabel,
                          inputType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          textController: price,
                          inputFormatters: [InputFormatter.currency],
                          validator: AppValidators.emptyCheck,
                        ),
                        24.verticalSpace,
                        CustomRadio(
                          title: TrKeys.active,
                          subTitle: TrKeys.active,
                          onChanged: notifier.changeActive,
                          isActive: state.active,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            title: AppHelpers.getTranslation(TrKeys.save),
            isLoading: state.isLoading,
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                notifier.createService(context,
                    request: ServiceExtraRequest(
                      title: title.text,
                      price: num.tryParse(price.text) ?? 0,
                      serviceId:
                          selectService?.id ?? state.extrasData?.serviceId,
                    ), created: (s) {
                  ref
                      .read(serviceExtrasProvider.notifier)
                      .fetchServices(isRefresh: true, context: context);
                  Navigator.pop(context);
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
