import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';
import '../widgets/product_multi_selection.dart';

@RoutePage()
class AddLooksPage extends ConsumerStatefulWidget {
  const AddLooksPage({super.key}) ;

  @override
  ConsumerState<AddLooksPage> createState() => _AddLooksPageState();
}

class _AddLooksPageState extends ConsumerState<AddLooksPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController desc;

  @override
  void initState() {
    title = TextEditingController();
    desc = TextEditingController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => ref.read(addLooksProvider.notifier).clear());
  }

  @override
  void dispose() {
    title.dispose();
    desc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBar(
                child: Row(
              children: [
                const PopButton(),
                Text(AppHelpers.getTranslation(TrKeys.addLooks)),
              ],
            )),
            Expanded(
              child: SingleChildScrollView(
                padding: REdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                child: Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(addLooksProvider);
                    final notifier = ref.read(addLooksProvider.notifier);
                    return Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          16.verticalSpace,
                          SingleImagePicker(
                            height: MediaQuery.sizeOf(context).width / 3,
                            width: MediaQuery.sizeOf(context).width / 3,
                            imageFilePath: state.imageFile,
                            onImageChange: notifier.setImageFile,
                            onDelete: () => notifier.setImageFile(null),
                          ),
                          16.verticalSpace,
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
                                AppHelpers.getTranslation(TrKeys.description),
                            textInputAction: TextInputAction.next,
                            textController: desc,
                          ),
                          16.verticalSpace,
                          GestureDetector(
                            onTap: () {
                              AppHelpers.showCustomModalBottomSheet(
                                  context: context,
                                  modal: const ModalWrap(
                                      body: MultiSelectionWidget()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Style.colorGrey,
                                          width: 0.5.r))),
                              height: 30.r,
                              width: MediaQuery.sizeOf(context).width,
                              child: state.products.isEmpty
                                  ? Text(
                                      AppHelpers.getTranslation(TrKeys.select),
                                      style: Style.interNormal(
                                          size: 14, color: Style.textHint),
                                    )
                                  : ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.products.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Chip(
                                          backgroundColor: Style.primary,
                                          deleteIcon: Icon(
                                            Remix.close_circle_fill,
                                            size: 20.r,
                                            color: Style.white,
                                          ),
                                          onDeleted: () {
                                            notifier.deleteFromAddedProducts(
                                                state.products[index].id);
                                          },
                                          label: Text(
                                            state.products[index].translation
                                                    ?.title ??
                                                "",
                                            style: Style.interNormal(
                                                color: Style.white),
                                          ),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return 10.horizontalSpace;
                                      },
                                    ),
                            ),
                          ),
                          24.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: CustomRadio(
                                    title: TrKeys.status,
                                    subTitle: state.active
                                        ? state.active
                                            ? TrKeys.active
                                            : TrKeys.nonActive
                                        : TrKeys.nonActive,
                                    onChanged: (c) =>
                                        notifier.setActive(!(state.active)),
                                    isActive: state.active),
                              ),
                            ],
                          ),
                          120.verticalSpace,
                          CustomButton(
                            textColor: Style.white,
                            title: AppHelpers.getTranslation(TrKeys.save),
                            isLoading: state.isLoading,
                            onPressed: () {
                              if (state.imageFile?.isEmpty ?? true) {
                                AppHelpers.errorSnackBar(context,
                                    text: TrKeys.imageCantEmpty);
                              }
                              if (_formKey.currentState?.validate() ?? false) {
                                notifier.createLooks(
                                  context,
                                  created: (look) {
                                    //widget.onSave();
                                    AppHelpers.successSnackBar(
                                      context,
                                      text: AppHelpers.getTranslation(
                                          TrKeys.successfullyCreated),
                                    
                                    );
                                    ref.read(looksProvider.notifier).fetchLooks(
                                        context: context, isRefresh: true);
                                    Navigator.pop(context);
                                  },
                                  onError: () {},
                                  title: title.text,
                                  description: desc.text,
                                );
                              }
                            },
                          ),
                          20.verticalSpace,
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
