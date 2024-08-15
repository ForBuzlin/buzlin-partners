import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';
import '../../../../component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'location_button.dart';

class EditShop extends StatelessWidget {
  final VoidCallback onSuccess;

  const EditShop({super.key, required this.onSuccess});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(shopProvider);
        // final categoryState = ref.watch(editShopCategoryProvider);
        final notifier = ref.read(shopProvider.notifier);
        return state.shop == null
            ? const Loading()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: REdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            30.verticalSpace,
                            Text(
                              AppHelpers.getTranslation(TrKeys.logo),
                              style: Style.interNormal(size: 16),
                            ),
                            12.verticalSpace,
                            //logo changer
                            Container(
                              padding: REdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Style.white,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                children: [
                                  ButtonEffectAnimation(
                                      child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CommonImage(
                                        fileImage: state.logoImageFile != null
                                            ? File(state.logoImageFile!)
                                            : null,
                                        url: state.logoImageFile != null
                                            ? null
                                            : state.shop?.logoImg,
                                        height: 52,
                                        width: 52,
                                        radius: 26,
                                      ),
                                    ],
                                  )),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () async {
                                      ImgService.getPhotoGallery((value) =>
                                          notifier.setLogoImageFile(value));
                                    },
                                    child: CustomTextButton(
                                      text: AppHelpers.getTranslation(
                                          TrKeys.changePhoto),
                                      backGroundColor: Style.greyColor,
                                    ),
                                  ),
                                  8.horizontalSpace,
                                  if (state.logoImageFile?.isNotEmpty ?? false)
                                    CircleButton(
                                      icon: Remix.delete_bin_line,
                                      onTap: () =>
                                          notifier.setLogoImageFile(null),
                                      size: 36,
                                    )
                                ],
                              ),
                            ),
                            24.verticalSpace,
                            TitleAndIcon(
                              title: AppHelpers.getTranslation(
                                  TrKeys.backgroundImage),
                            ),
                            24.verticalSpace,
                            HorizontalImagePicker(
                              onImageChange: notifier.setBackgroundImageFile,
                              onDelete: () =>
                                  notifier.setBackgroundImageFile(null),
                              imageFilePath: state.backgroundImageFile,
                              imageUrl: state.shop?.backgroundImg,
                            ),
                            24.verticalSpace,

                            UnderlinedTextField(
                              initialText: state.shop?.translation?.title ?? '',
                              label: AppHelpers.getTranslation(TrKeys.shopName),
                              onChanged: notifier.setTitle,
                              validator: AppValidators.emptyCheck,
                            ),
                            24.verticalSpace,
                            UnderlinedTextField(
                              initialText:
                                  state.shop?.translation?.description ?? '',
                              label:
                                  AppHelpers.getTranslation(TrKeys.description),
                              onChanged: notifier.setDescription,
                              validator: AppValidators.emptyCheck,
                            ),
                            24.verticalSpace,
                            UnderlinePhoneField(
                              onchange: (v) => notifier.setPhone(v),
                              initialValue: state.shop?.phone ?? '',
                            ),
                            24.verticalSpace,
                            // UnderlinedTextField(
                            //   textController:
                            //       categoryState.shopCategoryController,
                            //   label:
                            //       '${AppHelpers.getTranslation(TrKeys.shopCategory)}*',
                            //   suffixIcon: Icon(
                            //     Remix.arrow_down_s_line,
                            //     color: Style.black,
                            //     size: 18.r,
                            //   ),
                            //   readOnly: true,
                            //   onTap: () {
                            //     AppHelpers.showCustomModalBottomSheet(
                            //       paddingTop:
                            //           MediaQuery.paddingOf(context).top +
                            //               250.h,
                            //       context: context,
                            //       modal: const EditShopCategoryModal(),
                            //     );
                            //   },
                            //   validator: AppValidators.emptyCheck,
                            // ),
                            // 24.verticalSpace,

                            UnderlineDropDown(
                              label: TrKeys.deliveryType,
                              value: LocalStorage.getShop()?.deliveryType == 1
                                  ? TrKeys.inHouse
                                  : LocalStorage.getShop()?.deliveryType == 2
                                      ? TrKeys.ownSeller
                                      : null,
                              list: DropDownValues.deliveryTypeList,
                              onChanged: notifier.setDeliveryType,
                            ),
                            24.verticalSpace,
                            Text(
                              AppHelpers.getTranslation(TrKeys.deliveryTime),
                              style: Style.interNormal(size: 14),
                            ),
                            24.verticalSpace,
                            UnderlineDropDown(
                              value: state.shop?.deliveryTime?.type,
                              list: DropDownValues.deliveryTimeTypeList,
                              onChanged: notifier.setDeliveryTimeType,
                              label: TrKeys.deliveryTimeType,
                            ),
                            24.verticalSpace,
                            Row(
                              children: [
                                Expanded(
                                  child: UnderlinedTextField(
                                    initialText: LocalStorage.getShop()
                                            ?.deliveryTime
                                            ?.from ??
                                        '',
                                    label: AppHelpers.getTranslation(
                                        TrKeys.deliveryTimeFrom),
                                    onChanged: notifier.setDeliveryTimeFrom,
                                    validator: AppValidators.emptyCheck,
                                    inputFormatters: [InputFormatter.digitsOnly],
                                  ),
                                ),
                                16.horizontalSpace,
                                Expanded(
                                  child: UnderlinedTextField(
                                    initialText: state.shop?.deliveryTime?.to,
                                    label: AppHelpers.getTranslation(
                                        TrKeys.deliveryTimeTo),
                                    onChanged: notifier.setDeliveryTimeTo,
                                    validator: AppValidators.emptyCheck,
                                    inputFormatters: [InputFormatter.digitsOnly],
                                  ),
                                ),
                              ],
                            ),
                            24.verticalSpace,
                            UnderlinedTextField(
                              initialText: "${state.shop?.tax ?? 0}",
                              label: AppHelpers.getTranslation(TrKeys.tax),
                              onChanged: notifier.setTax,
                              validator: AppValidators.emptyCheck,
                              inputFormatters: [InputFormatter.currency],
                            ),
                            24.verticalSpace,
                            UnderlinedTextField(
                              initialText:
                                  state.shop?.translation?.address ?? '',
                              label: AppHelpers.getTranslation(TrKeys.address),
                              onChanged: notifier.setAddress,
                              validator: AppValidators.emptyCheck,
                            ),

                            24.verticalSpace,
                            LocationButton(
                              title: AppHelpers.getTranslation(TrKeys.address),
                              icon: Remix.map_pin_range_fill,
                              onTap: () => context.pushRoute(ViewMapRoute(
                                  onChanged: () => notifier.setLocation)),
                            ),
                            16.verticalSpace,
                            LocationButton(
                                title:
                                    TrKeys.shopLocations,
                                icon: Remix.navigation_fill,
                                onTap: () => context
                                    .pushRoute(ShopLocationsRoute(type: 1))),
                            12.verticalSpace,
                            LocationButton(
                                title:
                                    TrKeys.serviceLocations,
                                icon: Remix.navigation_fill,
                                onTap: () => context
                                    .pushRoute(ShopLocationsRoute(type: 2))),
                          ],
                        ),
                      ),
                      24.verticalSpace,
                      Padding(
                        padding: REdgeInsets.all(16),
                        child: CustomButton(
                          title: AppHelpers.getTranslation(TrKeys.save),
                          isLoading: state.isLoading,
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              notifier.updateShop(
                                context,
                                updateSuccess: () {
                                  onSuccess.call();
                                  notifier.fetchMyShop();
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
