import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';

class CityModal extends ConsumerStatefulWidget {
  final int countryId;
  final bool isDelivery;

  const CityModal(
      {super.key, required this.countryId, this.isDelivery = false});

  @override
  ConsumerState<CityModal> createState() => _CityModalState();
}

class _CityModalState extends ConsumerState<CityModal> {
  final RefreshController controller = RefreshController();
  final Delayed delayed = Delayed(milliseconds: 700);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(addressProvider.notifier).fetchCity(
            context: context,
            countyId: widget.countryId,
            isRefresh: true,
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: KeyboardDisable(
        child: SafeArea(
          bottom: false,
          child: Consumer(builder: (context, ref, child) {
            final state = ref.watch(addressProvider);
            final notifier = ref.read(addressProvider.notifier);
            return Column(
              children: [
                const ModalDrag(),
                Row(
                  children: [
                    18.horizontalSpace,
                    Text(
                      AppHelpers.getTranslation(TrKeys.selectCity),
                      style: Style.interSemi(size: 18),
                    ),
                  ],
                ),
                8.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: SearchTextField(
                    isBorder: true,
                    hintText: AppHelpers.getTranslation(TrKeys.search),
                    onChanged: (s) {
                      if (s.trim().isNotEmpty) {
                        delayed.run(() {
                          notifier.searchCity(
                            context: context,
                            search: s,
                            countyId: widget.countryId,
                          );
                        });
                      }
                    },
                  ),
                ),
                state.isCityLoading
                    ? Padding(
                        padding: EdgeInsets.only(top: 32.r),
                        child: const Loading(),
                      )
                    : Expanded(
                        child: SmartRefresher(
                          controller: controller,
                          enablePullDown: false,
                          enablePullUp: true,
                          onLoading: () {
                            notifier.fetchCity(
                              context: context,
                              countyId: widget.countryId,
                              controller: controller,
                            );
                          },
                          child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(16.r),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.8.r,
                              crossAxisCount: 3,
                              mainAxisSpacing: 12.r,
                              crossAxisSpacing: 8.r,
                              mainAxisExtent: 56.r,
                            ),
                            itemCount: state.cities.length,
                            itemBuilder: (context, index) {
                              return _cityItem(state.cities[index]);
                            },
                          ),
                        ),
                      )
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _cityItem(CityData? city) {
    return ButtonEffectAnimation(
      onTap: () {
        final cartNotifier = ref.read(orderCartProvider.notifier);
        if (widget.isDelivery) {
          cartNotifier.setCity(city);
          cartNotifier.getDeliveryPrices();
        } else {
          cartNotifier.setCity(city);
          ref.read(pickupPointsProvider.notifier).fetchPoints(
                countyId: city?.countryId,
                context: context,
                regionId: city?.id,
                isRefresh: true,
                orderCartNotifier: cartNotifier,
              );
        }

        if (context.mounted) {
          Navigator.pop(context);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Style.greyColor,
          border: Border.all(color: Style.icon),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.r),
            child: AutoSizeText(
              city?.translation?.title ?? "",
              style: Style.interNormal(color: Style.black, size: 12),
              minFontSize: 6,
              maxFontSize: 14,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
