import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

import 'city_modal.dart';

class CountryModal extends ConsumerStatefulWidget {
  final int bagIndex;
  final bool isDelivery;

  const CountryModal({
    super.key,
    this.isDelivery = false,
    required this.bagIndex,
  });

  @override
  ConsumerState<CountryModal> createState() => _CountryPageState();
}

class _CountryPageState extends ConsumerState<CountryModal> {
  final RefreshController controller = RefreshController();
  final Delayed delayed = Delayed(milliseconds: 700);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(addressProvider.notifier).fetchCountry(context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addressProvider);
    final notifier = ref.read(addressProvider.notifier);
    return ModalWrap(
      body: KeyboardDisable(
        child: Column(
          children: [
            const ModalDrag(),
            Row(
              children: [
                18.horizontalSpace,
                Text(
                  AppHelpers.getTranslation(TrKeys.selectCountry),
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
                      notifier.searchCountry(context: context, search: s);
                    });
                  }
                },
              ),
            ),
            state.isLoading
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
                        notifier.fetchCountry(
                          context: context,
                          controller: controller,
                        );
                      },
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(16.r),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.8.r,
                          crossAxisCount: 3,
                          mainAxisSpacing: 12.r,
                          crossAxisSpacing: 8.r,
                          mainAxisExtent: 60.r,
                        ),
                        itemCount: state.countries.length,
                        itemBuilder: (context, index) {
                          return _countryItem(state.countries[index]);
                        },
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget _countryItem(CountryData country) {
    final pickupAddress = LocalStorage.getBags()[widget.bagIndex].pickupAddress;

    return ButtonEffectAnimation(
      onTap: () {
        ref.read(orderCartProvider.notifier).setCountry(country);
        Navigator.pop(context);
        if ((country.citiesCount ?? 0) > 0) {
          AppHelpers.showCustomModalBottomDragSheet(
            initSize: 0.7,
            context: context,
            paddingTop: 80,
            modal: (s) => CityModal(
              countryId: country.id ?? 0,
              isDelivery: widget.isDelivery,
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Style.bg,
          border: Border.all(
              color: pickupAddress?.country?.id == country.id
                  ? Style.primary
                  : Style.icon),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CommonImage(
                url: country.img ?? "",
                height: 20,
                width: 30,
                radius: 4,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.r),
                child: AutoSizeText(
                  country.translation?.title ?? "",
                  style: Style.interNormal(size: 12),
                  minFontSize: 6,
                  maxFontSize: 14,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
