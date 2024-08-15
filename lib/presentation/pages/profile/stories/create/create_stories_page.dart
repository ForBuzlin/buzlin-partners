import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

import '../widgets/products_modal.dart';

@RoutePage()
class CreateStoriesPage extends ConsumerStatefulWidget {
  const CreateStoriesPage({super.key}) ;

  @override
  ConsumerState<CreateStoriesPage> createState() => _CreateStoriesPageState();
}

class _CreateStoriesPageState extends ConsumerState<CreateStoriesPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(editStoriesProvider.notifier).setStoryDetails(null);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        title: AppHelpers.getTranslation(TrKeys.addNewStory)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
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
                    label: AppHelpers.getTranslation(TrKeys.product),
                    textController: state.textEditingController,
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
              notifier.createStories(
                context,
                created: () {
                  ref
                      .read(storiesProvider.notifier)
                      .fetchStories(context: context, isRefresh: true);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
