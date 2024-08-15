import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/application/providers.dart';
import 'social_item.dart';

class ShopSocials extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const ShopSocials({super.key, required this.onNext});

  @override
  ConsumerState<ShopSocials> createState() => _ShopSocialsState();
}

class _ShopSocialsState extends ConsumerState<ShopSocials> {
  late TextEditingController type;
  late TextEditingController value;
  late RefreshController refreshController;

  @override
  void initState() {
    type = TextEditingController();
    value = TextEditingController();
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.watch(shopSocialsProvider).socialData?.isEmpty ?? true) {
        ref.read(shopSocialsProvider.notifier).fetchShopSocials();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    type.dispose();
    refreshController.dispose();
    value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(shopSocialsProvider);
    final notifier = ref.read(shopSocialsProvider.notifier);
    return Stack(
      children: [
        KeyboardDisable(
          child: SmartRefresher(
            controller: refreshController,
            onRefresh: () {
              refreshController.refreshCompleted();
              notifier.fetchShopSocials();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  8.verticalSpace,
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            AppHelpers.getTranslation(TrKeys.type),
                            style: Style.interNormal(size: 14),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            AppHelpers.getTranslation(TrKeys.value),
                            style: Style.interNormal(size: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  state.isSocialLoading
                      ? const LoadingList(
                          itemBorderRadius: 12,
                          horizontalPadding: 8,
                          itemPadding: 8,
                          itemHeight: 64,
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: (state.socialControllers.length) + 1,
                          itemBuilder: (context, index) {
                            final typeController =
                                index == (state.socialControllers.length)
                                    ? type
                                    : state.socialTypesController[index];
                            final valueController =
                                index == (state.socialControllers.length)
                                    ? value
                                    : state.socialControllers[index];
                            return SocialItem(
                              onDelete:
                                  index == (state.socialControllers.length)
                                      ? null
                                      : () {
                                          notifier.deleteShopSocials(
                                              context, index);
                                        },
                              typeController: typeController,
                              valueController: valueController,
                              onChange: () {
                                notifier.addSocial(
                                    type: typeController.text,
                                    value: valueController.text);
                                type.clear();
                                value.clear();
                              },
                            );
                          },
                        ),
                  24.verticalSpace,
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 18),
                    child: CustomButton(
                      title: TrKeys.save,
                      isLoading: state.isSocialLoading,
                      onPressed: () {
                        notifier.saveSocials(onSuccess: widget.onNext);
                      },
                    ),
                  ),
                  80.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
