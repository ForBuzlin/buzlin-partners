import 'package:auto_route/auto_route.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

@RoutePage()
class MasterGalleryPage extends ConsumerStatefulWidget {
  const MasterGalleryPage({super.key});

  @override
  ConsumerState<MasterGalleryPage> createState() => _ShopGalleryState();
}

class _ShopGalleryState extends ConsumerState<MasterGalleryPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(masterGalleriesProvider.notifier).fetchMasterGalleries();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(masterGalleriesProvider);
    final notifier = ref.read(masterGalleriesProvider.notifier);
    return Scaffold(
      body: Column(
        children: [
          AppHelpers.getUserRole == TrKeys.master
              ? CommonAppBar(
                  height: 72,
                  bottomPadding: 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const PopButton(),
                      Text(
                        AppHelpers.getTranslation(TrKeys.masterGalleries),
                        style: Style.interNormal(size: 16),
                      ),
                    ],
                  ))
              : const SizedBox.shrink(),
          Expanded(
            child: state.isLoading
                ? const Loading()
                : Padding(
                    padding: REdgeInsets.symmetric(horizontal: 16),
                    child: MultiImagePicker(
                      onDelete: notifier.deleteImage,
                      imageUrls: state.listOfUrls,
                      listOfImages: state.images,
                      onImageChange: notifier.setImageFile,
                      onUpload: notifier.setUploadImage,
                      isShopGallery: true,
                    ),
                  ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
                isLoading: state.isUpdating,
                title: TrKeys.save,
                onPressed: () {
                  notifier.setGalleries(context);
                }),
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
