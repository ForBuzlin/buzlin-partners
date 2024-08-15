import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'widgets/delete_discount_modal.dart';
import 'widgets/discount_item.dart';

@RoutePage()
class DiscountPage extends ConsumerStatefulWidget {
  const DiscountPage({super.key}) ;

  @override
  ConsumerState<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends ConsumerState<DiscountPage> {
  late RefreshController discountController;

  @override
  void initState() {
    discountController = RefreshController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(discountProvider.notifier)
          .fetchDiscounts(context: context, isRefresh: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            CommonAppBar(
                height: 72,
                bottomPadding: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const PopButton(),
                    Text(
                      AppHelpers.getTranslation(TrKeys.discount),
                      style: Style.interNormal(size: 16),
                    ),
                    const Spacer(),
                    SecondButton(
                      title: TrKeys.add,
                      onTap: () {
                        discountController.resetNoData();
                        context.pushRoute(const AddDiscountRoute());
                      },
                      prefix: Icon(
                        Remix.add_line,
                        size: 20.r,
                        color: Style.white,
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final discountState = ref.watch(discountProvider);
                  final discountEvent = ref.read(discountProvider.notifier);
                  return discountState.isLoading
                      ? const LoadingList(
                          verticalPadding: 16,
                          itemBorderRadius: 12,
                          horizontalPadding: 12,
                          itemPadding: 10,
                          itemHeight: 100,
                        )
                      : SmartRefresher(
                          controller: discountController,
                          enablePullDown: true,
                          enablePullUp: true,
                          onRefresh: () => discountEvent.fetchDiscounts(
                            context: context,
                            isRefresh: true,
                            controller: discountController,
                          ),
                          onLoading: () => discountEvent.fetchDiscounts(
                            context: context,
                            controller: discountController,
                          ),
                          child: discountState.discounts.isEmpty
                              ? const NoItem(title: TrKeys.noDiscount)
                              : AnimationLimiter(
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: REdgeInsets.only(
                                        top: 16,
                                        bottom: 56.r,
                                        left: 12,
                                        right: 12),
                                    shrinkWrap: true,
                                    itemCount: discountState.discounts.length,
                                    itemBuilder: (context, index) =>
                                        AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration: AppConstants.animationDuration,
                                      child: ScaleAnimation(
                                        scale: 0.5,
                                        child: FadeInAnimation(
                                          child: DiscountItem(
                                            discountData:
                                                discountState.discounts[index],
                                            spacing: 10,
                                            onTap: () {
                                              discountController.resetNoData();
                                              ref
                                                  .read(editDiscountProvider
                                                      .notifier)
                                                  .setDiscountDetails(
                                                      discountState
                                                          .discounts[index],
                                                      (fullBrand) {});
                                              context.pushRoute(
                                                  EditDiscountRoute(
                                                      id: discountState
                                                              .discounts[index]
                                                              .id ??
                                                          0));
                                            },
                                            onDelete: () => AppHelpers
                                                .showCustomModalBottomSheet(
                                              context: context,
                                              modal: DeleteDiscountModal(
                                                id: discountState
                                                        .discounts[index].id ??
                                                    0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
