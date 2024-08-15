import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/shop/galleries/shop_galleries_provider.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class ShopGallery extends ConsumerStatefulWidget {
  const ShopGallery({super.key});

  @override
  ConsumerState<ShopGallery> createState() => _ShopGalleryState();
}

class _ShopGalleryState extends ConsumerState<ShopGallery> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(shopGalleriesProvider.notifier).fetchShopGalleries();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(shopGalleriesProvider);
    final notifier = ref.read(shopGalleriesProvider.notifier);
    return Padding(
      padding: REdgeInsets.all(16),
      child: Stack(
        children: [
          state.isLoading
              ? const Loading()
              : MultiImagePicker(
                  onDelete: notifier.deleteImage,
                  imageUrls: state.listOfUrls,
                  listOfImages: state.images,
                  onImageChange: notifier.setImageFile,
                  onUpload: notifier.setUploadImage,
                  isShopGallery: true,
                ),
          Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: CustomButton(
                  isLoading: state.isUpdating,
                  title: TrKeys.save,
                  onPressed: () {
                    notifier.setGalleries(context);
                  }))
        ],
      ),
    );
  }
}
