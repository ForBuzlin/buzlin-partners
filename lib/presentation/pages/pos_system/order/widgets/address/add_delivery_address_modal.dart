import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class AddDeliveryAddressModal extends StatefulWidget {
  final PickupAddress? address;

  const AddDeliveryAddressModal({super.key, this.address});

  @override
  State<AddDeliveryAddressModal> createState() =>
      _AddDeliveryAddressModalState();
}

class _AddDeliveryAddressModalState extends State<AddDeliveryAddressModal> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController homeNumber;
  late TextEditingController zipCode;
  late TextEditingController detail;
  late TextEditingController phone;

  @override
  void initState() {
    phone = TextEditingController();
    homeNumber = TextEditingController();
    zipCode = TextEditingController();
    detail = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    homeNumber.dispose();
    zipCode.dispose();
    detail.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: REdgeInsets.symmetric(horizontal: 16),
          children: [
            const ModalDrag(),
            16.verticalSpace,
            UnderlinedTextField(
              textController: homeNumber,
              label: AppHelpers.getTranslation(TrKeys.homeNumber),
              textInputAction: TextInputAction.next,
              validator: AppValidators.emptyCheck,
            ),
            24.verticalSpace,
            UnderlinedTextField(
              textController: zipCode,
              label: AppHelpers.getTranslation(TrKeys.zipCode),
              inputType: TextInputType.number,
              textInputAction: TextInputAction.next,
              validator: AppValidators.emptyCheck,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            24.verticalSpace,
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final orderUserState = ref.watch(orderUserProvider);
                return UnderlinePhoneField(
                  initialValue: orderUserState.userPhoneTextController?.text,
                  onchange: (value) {
                    phone.text = value;
                  },
                );
              },
            ),
            24.verticalSpace,
            UnderlinedTextField(
              textController: detail,
              label: AppHelpers.getTranslation(TrKeys.details),
              validator: AppValidators.emptyCheck,
            ),
            24.verticalSpace,
            ButtonEffectAnimation(
              onTap: () {
                context.pushRoute(const AddressMapRoute());
              },
              child: Container(
                width: double.infinity,
                padding: REdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                  color: Style.greyColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final orderState = ref.watch(selectAddressProvider);
                      return (orderState.location?.address?.isNotEmpty ?? false)
                          ? Text(
                              orderState.location?.address ?? '',
                              style: Style.interNormal(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                5.horizontalSpace,
                                Icon(
                                  Remix.navigation_fill,
                                  size: 18.r,
                                ),
                                8.horizontalSpace,
                                Text(
                                  AppHelpers.getTranslation(
                                      TrKeys.selectedAddress),
                                  style: Style.interNormal(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )
                              ],
                            );
                    },
                  ),
                ),
              ),
            ),
            24.verticalSpace,
            Consumer(builder: (context, ref, child) {
              final notifier = ref.read(orderCartProvider.notifier);
              return CustomButton(
                title: AppHelpers.getTranslation(TrKeys.save),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    if (ref.read(selectAddressProvider).location?.address?.isEmpty ??
                        true) {
                      AppHelpers.errorSnackBar(context,
                          text: AppHelpers.getTranslation(
                              TrKeys.pleaseSelectAddress));
                      return;
                    }
                    final user = ref.read(orderUserProvider).selectedUser;
                    ref.read(userAddressProvider.notifier).setDeliveryAddress(
                          context: context,
                          userId: user?.id,
                          address: MyAddress(
                            zipcode: zipCode.text,
                            streetHouseNumber: homeNumber.text,
                            phone: phone.text,
                            additionalDetails: detail.text,
                            location: ref.read(selectAddressProvider).location,
                            cityId: widget.address?.city?.id,
                            countryId: widget.address?.country?.id,
                            regionId: widget.address?.country?.regionId,
                            firstname: user?.firstname,
                            lastname: user?.lastname,
                          ),
                          onSuccess: (address) {
                            notifier.setDeliveryAddress(address);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        );
                    Navigator.pop(context);
                  }
                },
              );
            }),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
