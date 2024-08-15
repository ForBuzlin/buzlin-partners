import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/pages/profile/widgets/logout_modal.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import '../../../styles/style.dart';

@RoutePage()
class CreateShopPage extends ConsumerStatefulWidget {
  const CreateShopPage({super.key});

  @override
  ConsumerState<CreateShopPage> createState() => _EditShopState();
}

class _EditShopState extends ConsumerState<CreateShopPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ProfileNotifier notifier;
  late TextEditingController shopName;
  late TextEditingController descName;
  late TextEditingController phoneName;
  late TextEditingController tax;
  late TextEditingController deliveryTimeFrom;
  late TextEditingController deliveryTimeTo;
  late TextEditingController startPrice;
  late TextEditingController pricePerKm;
  late RefreshController refreshController;
  dynamic data;

  String value = "minute";

  String deliveryType = TrKeys.ownSeller;

  @override
  void initState() {
    super.initState();
    shopName = TextEditingController();
    descName = TextEditingController();
    phoneName = TextEditingController();
    deliveryTimeFrom = TextEditingController();
    deliveryTimeTo = TextEditingController();
    startPrice = TextEditingController();
    pricePerKm = TextEditingController();
    tax = TextEditingController();
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).resetShopData();
      ref.read(profileProvider.notifier).fetchUser(context, onSuccess: (user) {
        setUserData(user);
      });
    });
  }

  @override
  void didChangeDependencies() {
    notifier = ref.read(profileProvider.notifier);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    shopName.dispose();
    descName.dispose();
    phoneName.dispose();
    deliveryTimeFrom.dispose();
    deliveryTimeTo.dispose();
    startPrice.dispose();
    pricePerKm.dispose();
    tax.dispose();
    refreshController.dispose();
    super.dispose();
  }

  setUserData(UserData? user) {
    phoneName.text = user?.phone ?? user?.shop?.phone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileProvider);
    return KeyboardDisable(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              bottomPadding: 16,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      AppHelpers.getTranslation(TrKeys.becomeSeller),
                      style: Style.interSemi(
                        size: 18,
                        color: Style.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.only(right: 12),
                    child: ButtonEffectAnimation(
                      child: GestureDetector(
                        onTap: () {
                          AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            modal: const LogoutModal(),
                          );
                        },
                        child: Icon(
                          Remix.logout_circle_r_line,
                          size: 24.r,
                          color: Style.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: SmartRefresher(
              controller: refreshController,
              onRefresh: () {
                ref.read(profileProvider.notifier).fetchUser(context,
                    refreshController: refreshController, onSuccess: (user) {
                  if (user?.role == TrKeys.seller) {
                    context.pushRoute(const MainRoute());
                  }
                  setUserData(user);
                });
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: state.userData?.shop == null
                    ? _shopInfo(state)
                    : state.userData?.shop?.status == "new"
                        ? _processing()
                        : _shopInfo(state),
              ),
            )),
          ],
        ),
      ),
    );
  }

  _processing() {
    return Column(
      children: [
        Lottie.asset(Assets.lottieProcessing),
        Text(
          AppHelpers.getTranslation(TrKeys.yourRequest),
          style: Style.interNormal(
            size: 18,
            color: Style.black,
          ),
        ),
        48.verticalSpace,
      ],
    );
  }

  _shopInfo(ProfileState state) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.verticalSpace,
          if (state.userData?.shop?.status == 'rejected')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${AppHelpers.getTranslation(TrKeys.note)}: ${state.userData?.shop?.statusNote ?? ''}",
                  style: Style.interNormal(size: 14),
                ),
              ],
            ),
          24.verticalSpace,
          HorizontalImagePicker(
            onImageChange: (v) => notifier.setBgImage(v),
            onDelete: () => notifier.setBgImage(""),
            imageFilePath: state.bgImage,
            isAdding: true,
          ),
          24.verticalSpace,
          Row(
            children: [
              CustomImagePicker(
                imageFilePath:
                    state.logoImage.isNotEmpty ? state.logoImage : null,
                height: 48,
                width: 48,
                radius: 14,
                onImageChange: (value) {
                  notifier.setLogoImage(value);
                },
              ),
              16.horizontalSpace,
              Expanded(
                child: UnderlinedTextField(
                  textController: shopName,
                  label: AppHelpers.getTranslation(TrKeys.shopName),
                  validator: AppValidators.emptyCheck,
                ),
              ),
            ],
          ),
          24.verticalSpace,
          UnderlinedTextField(
            textController: descName,
            label: AppHelpers.getTranslation(TrKeys.description),
            validator: AppValidators.emptyCheck,
          ),
          24.verticalSpace,
          UnderlinePhoneField(
            onchange: (value) => phoneName.text = value,
            initialValue: phoneName.text,
          ),
          24.verticalSpace,
          UnderlinedTextField(
            textController: tax,
            inputType: TextInputType.number,
            label: AppHelpers.getTranslation(TrKeys.tax),
            validator: AppValidators.emptyCheck,
            inputFormatters: [InputFormatter.currency],
          ),
          24.verticalSpace,
          DropdownButtonFormField(
            value: deliveryType,
            items: DropDownValues.deliveryTypeList
                .map(
                  (e) => DropdownMenuItem(
                      value: e, child: Text(AppHelpers.getTranslation(e))),
                )
                .toList(),
            onChanged: (s) {
              if (s != null) {
                deliveryType = s.toString();
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: AppHelpers.getTranslation(TrKeys.deliveryType),
              labelStyle: Style.interNormal(
                size: 12,
                color: Style.black,
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide.merge(
                      const BorderSide(color: Style.differBorderColor),
                      const BorderSide(color: Style.differBorderColor))),
              errorBorder: InputBorder.none,
              border: const UnderlineInputBorder(),
              focusedErrorBorder: const UnderlineInputBorder(),
              disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide.merge(
                      const BorderSide(color: Style.differBorderColor),
                      const BorderSide(color: Style.differBorderColor))),
              focusedBorder: const UnderlineInputBorder(),
            ),
          ),
          24.verticalSpace,
          UnderlineDropDown(
            value: value,
            list: DropDownValues.deliveryTimeTypeList,
            onChanged: (s) => value = s,
            label: TrKeys.deliveryTimeType,
          ),
          24.verticalSpace,
          UnderlinedTextField(
            textController: deliveryTimeFrom,
            inputType: TextInputType.number,
            label: AppHelpers.getTranslation(TrKeys.deliveryTimeFrom),
            validator: AppValidators.isNumberValidator,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          24.verticalSpace,
          UnderlinedTextField(
            inputType: TextInputType.number,
            textController: deliveryTimeTo,
            label: AppHelpers.getTranslation(TrKeys.deliveryTimeTo),
            validator: AppValidators.isNumberValidator,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          24.verticalSpace,
          24.verticalSpace,
          const Divider(),
          GestureDetector(
            onTap: () async {
              data = await context.pushRoute(ViewMapRoute(onChanged: () {}));
              notifier.setAddress(data);
            },
            child: Container(
              color: Style.transparent,
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Row(
                  children: [
                    Icon(
                      Remix.navigation_fill,
                      size: 20.r,
                    ),
                    8.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppHelpers.getTranslation(TrKeys.address),
                          style:
                              Style.interNormal(size: 12, color: Style.black),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2,
                          child: Text(
                            "${state.addressModel?.title ?? ""}, ${state.addressModel?.address ?? ""}",
                            style:
                                Style.interNormal(size: 12, color: Style.black),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Remix.arrow_right_s_line)
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          24.verticalSpace,
          Padding(
            padding: EdgeInsets.only(bottom: 32.h),
            child: CustomButton(
              isLoading: state.isSaveLoading,
              title: AppHelpers.getTranslation(TrKeys.save),
              onPressed: () {
                if (state.bgImage.isEmpty || state.logoImage.isEmpty) {
                  AppHelpers.errorSnackBar(context,
                      text: TrKeys.pleaseSelectImage);
                  return;
                }
                if (_formKey.currentState?.validate() ?? false) {
                  if (data == null) {
                    AppHelpers.errorSnackBar(context,
                        text: TrKeys.pleaseSelectAddress);
                    return;
                  }
                  notifier.createShop(
                    context: context,
                    tax: tax.text,
                    deliveryTo: deliveryTimeTo.text,
                    deliveryFrom: deliveryTimeFrom.text,
                    phone: phoneName.text,
                    name: shopName.text,
                    desc: descName.text,
                    address: data,
                    deliveryTimeType: value,
                    deliveryType: deliveryType,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
