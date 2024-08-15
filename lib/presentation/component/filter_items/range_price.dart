import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/response/filter_response.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class RangePrice extends StatefulWidget {
  final Price? filterPrices;
  final RangeValues? rangeValues;
  final List<int> prices;
  final ValueChanged<RangeValues> onChange;

  const RangePrice({
    super.key,
    required this.onChange,
    required this.filterPrices,
    required this.rangeValues,
    required this.prices,
  });

  @override
  State<RangePrice> createState() => _RangePriceState();
}

class _RangePriceState extends State<RangePrice> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.circular(AppConstants.radius.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppHelpers.getTranslation(TrKeys.priceRange),
              style: Style.interNormal(
                size: 16,
                color: Style.black,
              ),
            ),
            Text(
              "${AppHelpers.numberFormat(
                number: widget.rangeValues?.start,
              )} ${AppHelpers.getTranslation(TrKeys.to).toLowerCase()} ${AppHelpers.numberFormat(
                number: widget.rangeValues?.end,
              )} ${AppHelpers.getTranslation(TrKeys.selected).toLowerCase()}",
              style: Style.interNormal(
                size: 14,
                color: Style.textColor,
              ),
            ),
            18.verticalSpace,
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...(widget.prices).mapIndexed((e, i) => Container(
                            width: 8.w,
                            height: 100.h / e,
                            decoration: BoxDecoration(
                              color: ((((widget.rangeValues?.start ?? 0) -
                                                      (widget.filterPrices
                                                              ?.min ??
                                                          0)) /
                                                  (((widget.filterPrices?.max ??
                                                              0) -
                                                          (widget.filterPrices
                                                                  ?.min ??
                                                              0)) /
                                                      30))
                                              .round() <=
                                          i) &&
                                      (((widget.rangeValues?.end ?? 100) /
                                                  ((widget.filterPrices?.max ??
                                                          0) /
                                                      30))
                                              .round() >=
                                          i)
                                  ? Style.primary
                                  : Style.backgroundColor,
                              borderRadius: BorderRadius.circular(48.r),
                            ),
                          )),
                    ],
                  ),
                ),
                8.verticalSpace,
                RangeSlider(
                  activeColor: Style.black,
                  inactiveColor: Style.white,
                  min: (widget.filterPrices?.min ?? 0).toDouble(),
                  max: (widget.filterPrices?.max ?? 100).toDouble(),
                  values: widget.rangeValues ?? const RangeValues(0, 100),
                  onChanged: (s) {
                    Delayed(milliseconds: 700).run(() {
                      widget.onChange(s);
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppHelpers.numberFormat(number: widget.rangeValues?.start),
                  style: Style.interNormal(
                    size: 14,
                    color: Style.black,
                  ),
                ),
                Text(
                  AppHelpers.numberFormat(number: widget.rangeValues?.end),
                  style: Style.interNormal(
                    size: 12,
                    color: Style.black,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
