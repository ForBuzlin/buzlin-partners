import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import '../widgets/services_modal.dart';

@RoutePage()
class AddServiceMasterPage extends ConsumerStatefulWidget {
  const AddServiceMasterPage({super.key});

  @override
  ConsumerState<AddServiceMasterPage> createState() => _AddServicePageState();
}

class _AddServicePageState extends ConsumerState<AddServiceMasterPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController commission;
  late TextEditingController discount;
  late TextEditingController pause;
  late TextEditingController price;
  late TextEditingController interval;
  late TextEditingController master;
  late TextEditingController service;
  ServiceData? selectService;

  @override
  void initState() {
    commission = TextEditingController();
    discount = TextEditingController();
    pause = TextEditingController();
    price = TextEditingController();
    interval = TextEditingController();
    master = TextEditingController();
    service = TextEditingController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => ref.read(addServiceMasterProvider.notifier).clear());
  }

  @override
  void dispose() {
    commission.dispose();
    discount.dispose();
    pause.dispose();
    price.dispose();
    interval.dispose();
    master.dispose();
    service.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addServiceMasterProvider);
    final notifier = ref.read(addServiceMasterProvider.notifier);
    return KeyboardDisable(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBar(
                child: Row(
              children: [
                const PopButton(),
                Text(AppHelpers.getTranslation(TrKeys.addService)),
              ],
            )),
            Expanded(
              child: SingleChildScrollView(
                padding: REdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      16.verticalSpace,
                      UnderlinedTextField(
                        readOnly: true,
                        onTap: () {
                          AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            modal: ModalWrap(
                              body: ServicesModal(
                                onChange: (value) {
                                  selectService = value;
                                  service.text = value.translation?.title ?? '';
                                  interval.text = "${value.interval ?? 0}";
                                  pause.text = "${value.pause ?? 0}";
                                  price.text = "${value.price ?? 0}";
                                },
                              ),
                            ),
                          );
                        },
                        label: "${AppHelpers.getTranslation(TrKeys.service)}*",
                        textInputAction: TextInputAction.next,
                        validator: AppValidators.emptyCheck,
                        textController: service,
                      ),
                      16.verticalSpace,
                      UnderlinedTextField(
                        label: '${AppHelpers.getTranslation(TrKeys.interval)}*',
                        textInputAction: TextInputAction.next,
                        textController: interval,
                        inputType: TextInputType.number,
                        validator: (p0) {


                          final res =  AppValidators.isNumberValidator(p0);
                          if(res!=null){
                            return res;
                          }else{
                            if(int.parse(p0??"0")>30000){
                              return "Interval must be less than 30000";
                            }
                          }
                          return null;

                        },
                        inputFormatters: [InputFormatter.digitsOnly],
                      ),
                      16.verticalSpace,
                      UnderlinedTextField(
                        label: '${AppHelpers.getTranslation(TrKeys.pause)}*',
                        textInputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                        textController: pause,
                        validator: AppValidators.isNumberValidator,
                        inputFormatters: [InputFormatter.digitsOnly],
                      ),
                      16.verticalSpace,
                      UnderlinedTextField(
                        label: AppHelpers.getPriceLabel,
                        textInputAction: TextInputAction.next,
                        textController: price,
                        inputType: TextInputType.number,
                        validator: AppValidators.emptyCheck,
                        inputFormatters: [InputFormatter.currency],
                      ),
                      12.verticalSpace,
                      UnderlinedTextField(
                        label:
                            "${AppHelpers.customPriceLabel(TrKeys.commissionFee)}",
                        textInputAction: TextInputAction.done,
                        textController: commission,
                        inputType: TextInputType.number,
                        inputFormatters: [InputFormatter.currency],
                      ),
                      12.verticalSpace,
                      UnderlinedTextField(
                        label:
                            "${AppHelpers.customPriceLabel(TrKeys.discount)}",
                        textInputAction: TextInputAction.done,
                        textController: discount,
                        inputType: TextInputType.number,
                        inputFormatters: [InputFormatter.currency],
                      ),
                      60.verticalSpace,
                      CustomButton(
                        textColor: Style.white,
                        title: AppHelpers.getTranslation(TrKeys.save),
                        isLoading: state.isLoading,
                        onPressed: () {
                          if ((_formKey.currentState?.validate() ?? false)) {
                            notifier.createService(
                              context,
                              created: (service) {
                                AppHelpers.successSnackBar(
                                  context,
                                  text: AppHelpers.getTranslation(
                                      TrKeys.successfullyCreated),
                                );
                                ref
                                    .read(serviceMasterProvider.notifier)
                                    .fetchServices(
                                        context: context, isRefresh: true);
                                Navigator.pop(context);
                              },
                              onError: () {},
                              price: price.text,
                              interval: interval.text,
                              pause: pause.text,
                              masterId:
                                  ref.read(editMastersProvider).master?.id,
                              serviceId: selectService?.id ?? 0,
                              commissionFee: commission.text,
                              discount: discount.text,
                            );
                          }
                        },
                      ),
                      60.verticalSpace,
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
}
