import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'package:venderuzmart/application/providers.dart';

class EditProductGalleryBody extends ConsumerStatefulWidget {
  const EditProductGalleryBody({super.key});

  @override
  ConsumerState<EditProductGalleryBody> createState() =>
      _EditProductGalleryBodyState();
}

class _EditProductGalleryBodyState
    extends ConsumerState<EditProductGalleryBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(editProductGalleryProvider.notifier)
          .initial(ref.read(editFoodDetailsProvider).product?.stocks);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editProductGalleryProvider);
    final notifier = ref.read(editProductGalleryProvider.notifier);
    return (ref.read(editFoodDetailsProvider).product?.digital ?? false)
        ? const SizedBox.shrink()
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                    padding: REdgeInsets.symmetric(vertical: 16),
                    itemCount: state.extras.length,
                    itemBuilder: (context, index) {
                      final key = state.extras[index].stockId.toString();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: REdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              children: [
                                ColorItem(
                                  extras: (state.extras[index]),
                                  size: 24,
                                ),
                                6.horizontalSpace,
                                Text(
                                  "(${state.extras[index].value ?? " "})",
                                  style: Style.interNormal(),
                                ),
                              ],
                            ),
                          ),
                          DraggableImagePicker(
                            isExtras: true,
                            onDelete: (p) =>
                                notifier.deleteImage(path: p, key: key),
                            imageUrls: state.listOfUrls[key],
                            listOfImages: state.images[key],
                            onImageChange: (p) =>
                                notifier.setImageFile(path: p, key: key),
                          ),
                        ],
                      );
                    }),
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  title: AppHelpers.getTranslation(TrKeys.save),
                  isLoading: state.isSaving,
                  onPressed: () {
                    notifier.updateGallery(context, updated: () {
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
              24.verticalSpace,
            ],
          );
  }
}
