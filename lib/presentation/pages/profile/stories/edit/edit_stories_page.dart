import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

import '../widgets/products_modal.dart';

@RoutePage()
class EditStoriesPage extends ConsumerWidget {
  const EditStoriesPage(this.onSave, {super.key}) ;
  final Function() onSave;

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(editStoriesProvider);
    final notifier = ref.read(editStoriesProvider.notifier);
    return KeyboardDisable(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppBar(
              child: Row(
                children: [
                  const PopButton(),
                  Expanded(
                      child: TitleAndIcon(
                          title: AppHelpers.getTranslation(TrKeys.stories))),
                ],
              ),
            ),
            state.story == null
                ? const Loading()
                : Padding(
                    padding: REdgeInsets.symmetric(horizontal: 16),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            24.verticalSpace,
                            StoriesImagePicker(
                              listOfImages: state.images,
                              imageUrls: state.listOfUrls,
                              onImageChange: notifier.setImageFile,
                              onDelete: notifier.deleteImage,
                            ),
                            24.verticalSpace,
                            UnderlinedTextField(
                              readOnly: true,
                              textController: state.textEditingController,
                              label: AppHelpers.getTranslation(TrKeys.product),
                              onTap: () {
                                AppHelpers.showCustomModalBottomSheet(
                                    paddingTop: 260,
                                    context: context,
                                    modal: const ProductsModal());
                              },
                            ),
                            24.verticalSpace,
                          ],
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
              if (state.listOfUrls.isEmpty && state.images.isEmpty) {
                AppHelpers.errorSnackBar(context, text: TrKeys.imageCantEmpty);
                return;
              }
              notifier.updateStories(context, updated: () {
                ref
                    .read(storiesProvider.notifier)
                    .fetchStories(isRefresh: true);
                Navigator.pop(context);
              });
            },
          ),
        ),
      ),
    );
  }
}
