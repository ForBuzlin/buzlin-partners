import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/looks/edit/edit_looks_provider.dart';
import 'package:venderuzmart/application/looks/looks_provider.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import '../../../../component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import '../widgets/product_multi_selection.dart';

@RoutePage()
class EditLooksPage extends ConsumerStatefulWidget {
  final int id;

  const EditLooksPage(this.id, {super.key}) ;

  @override
  ConsumerState<EditLooksPage> createState() => _EditLooksPageState();
}

class _EditLooksPageState extends ConsumerState<EditLooksPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController desc;

  @override
  void initState() {
    title = TextEditingController(
      text: ref.read(editLooksProvider).looksData?.translation?.title ?? '',
    );
    desc = TextEditingController(
      text:
          ref.read(editLooksProvider).looksData?.translation?.description ?? '',
    );
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(editLooksProvider.notifier)
          .fetchLookDetails(context: context, id: widget.id),
    );
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
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(editLooksProvider);
            final notifier = ref.read(editLooksProvider.notifier);
            return state.looksData == null || state.isLoading
                ? const Loading()
                : SafeArea(
                    child: Padding(
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const PopButton(),
                                  Expanded(
                                      child: TitleAndIcon(
                                          title: AppHelpers.getTranslation(
                                              TrKeys.editLooks))),
                                ],
                              ),
                              24.verticalSpace,
                              SingleImagePicker(
                                isEdit: true,
                                height: MediaQuery.sizeOf(context).width / 3,
                                width: MediaQuery.sizeOf(context).width / 3,
                                isAdding: state.looksData?.img == null,
                                imageFilePath: state.imageFile,
                                imageUrl: state.looksData?.img,
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
                                label: AppHelpers.getTranslation(
                                    TrKeys.description),
                                textInputAction: TextInputAction.next,
                                textController: desc,
                              ),
                              16.verticalSpace,
                              GestureDetector(
                                onTap: () {
                                  AppHelpers.showCustomModalBottomSheet(
                                      context: context,
                                      modal: const ModalWrap(
                                          body: MultiSelectionWidget(
                                              isEdit: true)));
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
                                          AppHelpers.getTranslation(
                                              TrKeys.select),
                                          style: Style.interNormal(
                                              size: 14, color: Style.colorGrey),
                                        )
                                      : ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: state.products.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Chip(
                                              backgroundColor: Style.primary,
                                              deleteIcon: Icon(
                                                Remix.close_circle_fill,
                                                size: 20.r,
                                                color: Style.white,
                                              ),
                                              onDeleted: () {
                                                notifier
                                                    .deleteFromAddedProducts(
                                                        state.products[index]
                                                            .id);
                                              },
                                              label: Text(
                                                state.products[index]
                                                        .translation?.title ??
                                                    "",
                                                style: Style.interNormal(
                                                    color: Style.white),
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return 10.horizontalSpace;
                                          },
                                        ),
                                ),
                              ),
                              24.verticalSpace,
                              CustomRadio(
                                  title: TrKeys.active,
                                  subTitle: TrKeys.active,
                                  onChanged: notifier.changeActive,
                                  isActive: state.active),
                              24.verticalSpace,
                              CustomButton(
                                title: AppHelpers.getTranslation(TrKeys.save),
                                isLoading: state.isLoading,
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    notifier.updateLook(
                                      context,
                                      updated: (look) {
                                        ref
                                            .read(looksProvider.notifier)
                                            .fetchLooks(
                                                context: context,
                                                isRefresh: true);
                                        Navigator.pop(context);
                                      },
                                      title: title.text,
                                      description: desc.text,
                                    );
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
