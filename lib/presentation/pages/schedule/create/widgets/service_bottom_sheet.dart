import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/models/data/service_data.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/component/custom_read_more.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class ServiceBottomSheet extends StatelessWidget {
  final ServiceData? service;
  final ScrollController controller;
  final ValueChanged<List<ServiceData>>? onChange;

  const ServiceBottomSheet({
    super.key,
    required this.controller,
    required this.service,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Consumer(builder: (context, ref, child) {
        final state = ref.watch(createBookingProvider);
        final notifier = ref.read(createBookingProvider.notifier);
        num totalPrice = (service?.price ?? 0);
        for (var e in state.selectExtras) {
          totalPrice += e.price ?? 0;
        }
        return ListView(
          controller: controller,
          padding: REdgeInsets.only(top: 8, bottom: 16, left: 16, right: 16),
          children: [
            Container(
              height: 4.r,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width / 2 - 48.r),
              decoration: BoxDecoration(
                  color: Style.icon,
                  borderRadius: BorderRadius.circular(100.r)),
            ),
            28.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Text(
                    service?.translation?.title ?? "",
                    style: Style.interSemi(size: 22),
                  ),
                ),
                // const Spacer(),
                Text(
                  AppHelpers.numberFormat(number: service?.price),
                  style: Style.interSemi(size: 18),
                ),
              ],
            ),
            20.verticalSpace,
            Wrap(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: Style.textHint)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                  child: Text(
                    "${AppHelpers.getTranslation(TrKeys.from)} ${AppHelpers.numberFormat(number: service?.price)}",
                    style: Style.interNormal(color: Style.textHint, size: 12),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 8.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: Style.textHint)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                  child: Text(
                    "${service?.interval ?? 0} ${AppHelpers.getTranslation(TrKeys.minute)}",
                    style: Style.interNormal(color: Style.textHint, size: 12),
                  ),
                )
              ],
            ),
            24.verticalSpace,
            CustomReadMoreText(
              service?.translation?.description ?? "",
              trimLines: 4,
            ),
            12.verticalSpace,
            ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: service?.extras?.length ?? 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: REdgeInsets.only(bottom: 8),
                    child: GestureDetector(
                      onTap: () {
                        if (state.selectServices
                            .any((e) => e.id == service?.id)) {
                          notifier.setSelectedService(
                            service: service?.copyWith(
                              selectExtras: state.selectExtras,
                            ),
                            extra: service?.extras?[index],
                            onChange: onChange,
                          );
                        } else {
                          notifier.selectExtraIndex(service?.extras?[index]);
                        }
                      },
                      child: Container(
                        padding:
                            REdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              color: state.selectExtras.any(
                                      (e) => service?.extras?[index].id == e.id)
                                  ? Style.black
                                  : Style.textHint,
                              width: state.selectExtras.any(
                                      (e) => service?.extras?[index].id == e.id)
                                  ? 1.2
                                  : 1),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    service?.extras?[index].translation
                                            ?.title ??
                                        '',
                                    style: Style.interRegular(
                                      size: 16,
                                    ),
                                  ),
                                  Text(
                                    AppHelpers.numberFormat(
                                        number: service?.extras?[index].price),
                                    style: Style.interRegular(
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (state.selectExtras
                                .any((e) => service?.extras?[index].id == e.id))
                              Container(
                                height: 18.r,
                                width: 18.r,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 6.r),
                                  shape: BoxShape.circle,
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            26.verticalSpace,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.price),
                      style: Style.interNormal(color: Style.textHint, size: 14),
                    ),
                    Text(
                      AppHelpers.numberFormat(number: totalPrice),
                      style: Style.interSemi(size: 26),
                    ),
                  ],
                ),
                24.horizontalSpace,
                Expanded(
                  child: CustomButton(
                      title:
                          state.selectServices.any((e) => e.id == service?.id)
                              ? TrKeys.remove
                              : TrKeys.bookNow,
                      background: Style.black,
                      textColor: Style.white,
                      onPressed: () {
                        notifier.setSelectedService(
                          service: service?.copyWith(
                            selectExtras: state.selectExtras,
                          ),
                          onChange: onChange,
                        );
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
