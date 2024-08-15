import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'shop_locations_country_modal.dart';

@RoutePage()
class ShopLocationsPage extends ConsumerStatefulWidget {
  final int type;

  const ShopLocationsPage({
    super.key,
    required this.type,
  });

  @override
  ConsumerState<ShopLocationsPage> createState() => _ShopLocationsPageState();
}

class _ShopLocationsPageState extends ConsumerState<ShopLocationsPage> {
  late RefreshController refreshController;

  @override
  void initState() {
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(shopLocationsProvider.notifier).fetchLocations(
            context: context,
            isRefresh: true,
            type: widget.type,
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(shopLocationsProvider);
    final notifier = ref.read(shopLocationsProvider.notifier);
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomAppBar(
            bottomPadding: 10,
            child: Row(
              children: [
                const PopButton(),
                Text(AppHelpers.getTranslation(
                  widget.type == 2
                      ? TrKeys.serviceLocations
                      : TrKeys.shopLocations,
                )),
                const Spacer(),
                SecondButton(
                  title: TrKeys.add,
                  onTap: () {
                    AppHelpers.showCustomModalBottomDragSheet(
                        context: context,
                        paddingTop: 80,
                        initSize: 0.9,
                        modal: (s) => ShopLocationsCountryModal(
                              onSuccess: () {
                                ref.read(shopLocationsProvider.notifier).fetchLocations(context: context, type: widget.type,isRefresh: true);
                              },
                              type: widget.type,
                            ),);
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
          child: state.isLoading
              ? const Center(
                  child: Loading(),
                )
              : state.locations.isEmpty
                  ? NoDataInfo(title: AppHelpers.getTranslation(TrKeys.noData))
                  : SmartRefresher(
                      controller: refreshController,
                      onRefresh: () {
                        notifier.fetchLocations(
                          context: context,
                          controller: refreshController,
                          isRefresh: true,
                          type: widget.type,
                        );
                      },
                      onLoading: () {
                        notifier.fetchLocations(
                          context: context,
                          controller: refreshController,
                          type: widget.type,
                        );
                      },
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(16.r),
                        itemCount: state.locations.length,
                        itemBuilder: (context, index) {
                          return CountryItem(
                              countryData: state.locations[index].country ??
                                  CountryData(),
                              cityData: state.locations[index].city,
                              id: state.locations[index].id ?? 0,
                              onTap: () => notifier.deleteShopLocation(
                                  context, state.locations[index].id ?? 0));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return 8.verticalSpace;
                        },
                      )),
        ),
      ],
    ));
  }
}

class CountryItem extends StatelessWidget {
  final CountryData countryData;
  final City? cityData;
  final int id;
  final VoidCallback onTap;
  final int spacing;

  const CountryItem({
    super.key,
    required this.countryData,
    required this.onTap,
    this.spacing = 1,
    required this.id,
    this.cityData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
         borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
      ),
      margin: EdgeInsets.only(bottom: spacing.r),
      padding: REdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                width: 4.r,
                height: 48.r,
                decoration: BoxDecoration(
                    color: countryData.active == null
                        ? Style.red
                        : countryData.active!
                            ? Style.green
                            : Style.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    )),
              ),
              12.horizontalSpace,
              CommonImage(
                width: 48,
                height: 48,
                url: countryData.img,
                errorRadius: 0,
                fit: BoxFit.cover,
              ),
              8.horizontalSpace,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: cityData == null
                          ? Text(
                              countryData.translation?.title ?? AppHelpers.getTranslation(TrKeys.unKnow),
                              style: Style.interRegular(
                                size: 14,
                                color: Style.black,
                                letterSpacing: -0.3,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          : RichText(
                              text: TextSpan(
                                  text: countryData.translation?.title ?? AppHelpers.getTranslation(TrKeys.unKnow),
                                  style: Style.interRegular(
                                    size: 14,
                                    color: Style.black,
                                    letterSpacing: -0.3,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ', ${cityData?.translation?.title ?? ''}',
                                      style: Style.interRegular(
                                        size: 14,
                                        color: Style.black,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                  ]),
                            ),
                    ),
                    8.verticalSpace,
                    Row(
                      children: [
                        CircleButton(
                          onTap: onTap,
                          icon: Remix.delete_bin_line,
                        ),
                        8.horizontalSpace,
                      ],
                    ),
                  ],
                ),
              ),
              12.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
