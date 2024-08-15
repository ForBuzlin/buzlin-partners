import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remixicon/remixicon.dart';
import 'package:auto_route/auto_route.dart';
import 'widgets/select_master_bottom.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SelectMastersPage extends ConsumerWidget {
  const SelectMastersPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(createBookingProvider);
    return Scaffold(
      body: KeyboardDismisser(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              height: 90,
              bottomPadding: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppHelpers.getTranslation(TrKeys.selectMaster)),
                ],
              ),
            ),
            24.verticalSpace,
            ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                shrinkWrap: true,
                itemCount: state.selectServices.length,
                itemBuilder: (context, index) {
                  final UserData? master =
                      state.selectMasters[state.selectServices[index].id];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.selectServices[index].translation?.title ?? "",
                        style: Style.interNormal(size: 18),
                      ),
                      8.verticalSpace,
                      _addMaster(context, state, index, master),
                      8.verticalSpace,
                      const Divider(),
                      8.verticalSpace,
                    ],
                  );
                })
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Row(
          children: [
            const BlackPopButton(),
            10.horizontalSpace,
            Expanded(
              child: CustomButton(
                  title: TrKeys.next,
                  onPressed: () {
                    List list = state.selectMasters.keys.toList()..sort();
                    if (listEquals(
                        list,
                        state.selectServices.map((e) => e.id).toList()
                          ..sort())) {
                      context.pushRoute(const SelectBookTimeRoute());
                      return;
                    }
                    AppHelpers.openDialog(
                        context: context,
                        title: AppHelpers.getTranslation(
                            TrKeys.youMustSelectMaster));
                  }),
            )
          ],
        ),
      ),
    );
  }

  ButtonEffectAnimation _addMaster(BuildContext context,
      CreateBookingState state, int index, UserData? master) {
    return ButtonEffectAnimation(
      onTap: () {
        AppHelpers.showCustomModalBottomDragSheet(
          initSize: 0.7,
          context: context,
          modal: (c) => SizedBox(
              child: SelectMasterBottomSheet(
                controller: c,
                title: state.selectServices[index].translation?.title ?? "",
                serviceId: state.selectServices[index].id,
              )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Style.icon),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
        child: master == null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Remix.account_circle_line,
                    size: 24.r,
                  ),
                  8.horizontalSpace,
                  Text(
                    AppHelpers.getTranslation(TrKeys.addMaster),
                    style: Style.interNormal(size: 16),
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonImage(
                    url: master.img ?? "",
                    height: 32,
                    width: 32,
                    radius: 4,
                  ),
                  8.horizontalSpace,
                  Text(
                    master.firstname ?? "",
                    style: Style.interNormal(size: 16),
                  )
                ],
              ),
      ),
    );
  }
}
