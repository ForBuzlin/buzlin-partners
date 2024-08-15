import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/application/providers.dart';

class OrdersFilterModal extends ConsumerStatefulWidget {
  const OrdersFilterModal({super.key});

  @override
  ConsumerState<OrdersFilterModal> createState() => _OrdersFilterModalState();
}

class _OrdersFilterModalState extends ConsumerState<OrdersFilterModal>
    with TickerProviderStateMixin {
  late TabController _orderTypeController;
  late TabController _paymentStatusController;
  late TabController _paymentTypeController;

  @override
  void initState() {
    final state = ref.read(ordersFilterProvider);
    _orderTypeController =
        TabController(length: state.orderTypes.length, vsync: this);
    _paymentTypeController =
        TabController(length: state.payments.length, vsync: this);
    _paymentStatusController =
        TabController(length: state.paymentStatus.length, vsync: this);
    if (state.payments.isNotEmpty) {
      scrollController();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(ordersFilterProvider.notifier).fetchPayments((v) {
          final state = ref.watch(ordersFilterProvider);
          _paymentTypeController = TabController(length: v, vsync: this);
          _orderTypeController =
              TabController(length: state.orderTypes.length, vsync: this);
          _paymentStatusController =
              TabController(length: state.paymentStatus.length, vsync: this);
          scrollController();
        });
      });
    }
    super.initState();
  }

  scrollController() {
    final state = ref.read(ordersFilterProvider);
    _orderTypeController.animateTo(state.orderTypeIndex);
    _paymentTypeController.animateTo(state.paymentTypeIndex);
    _paymentStatusController.animateTo(state.paymentStatusIndex);
  }

  @override
  void dispose() {
    _orderTypeController.dispose();
    _paymentStatusController.dispose();
    _paymentTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(ordersFilterProvider.notifier);
    final state = ref.watch(ordersFilterProvider);
    return ModalWrap(
        body: Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const ModalDrag(),
        TitleAndIcon(
          title: AppHelpers.getTranslation(TrKeys.filter),
          titleSize: 18,
          rightTitle: AppHelpers.getTranslation(TrKeys.clearAll),
          rightTitleColor: Style.red,
          onRightTap: () {
            notifier.clearAll();
            scrollController();
          },
        ),
        Expanded(
          child: state.isLoading
              ? const Loading()
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  20.verticalSpace,
                  Text(
                    AppHelpers.getTranslation(TrKeys.orderTime),
                    style: Style.interNormal(size: 15),
                  ),
                  8.verticalSpace,
                  ButtonEffectAnimation(
                    onTap: () {
                      AppHelpers.showCustomModalBottomSheet(
                        context: context,
                        modal: ModalWrap(
                          body: CustomDatePicker(
                            firstDate: LocalStorage.getShop()?.createdAt,
                            lastDate: DateTime.now(),
                            onValueChanged: notifier.setLocalTime,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 40.r,
                      decoration: BoxDecoration(
                        color: Style.borderColor,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Style.borderColor),
                      ),
                      alignment: Alignment.center,
                      child: Text(DateService.dateFormatMulti(state.localTime)),
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    AppHelpers.getTranslation(TrKeys.orderType),
                    style: Style.interNormal(size: 15),
                  ),
                  8.verticalSpace,
                  CustomTabBar(
                    tabController: _orderTypeController,
                    tabs: [
                      ...state.orderTypes.map((e) =>
                          Tab(child: Text(AppHelpers.getTranslation(e)))),
                    ],
                  ),
                  20.verticalSpace,
                  Text(
                    AppHelpers.getTranslation(TrKeys.paymentStatus),
                    style: Style.interNormal(size: 15),
                  ),
                  8.verticalSpace,
                  CustomTabBar(
                    tabController: _paymentStatusController,
                    tabs: [
                      ...state.paymentStatus.map(
                        (e) => Tab(child: Text(AppHelpers.getTranslation(e))),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Text(
                    AppHelpers.getTranslation(TrKeys.paymentType),
                    style: Style.interNormal(size: 15),
                  ),
                  8.verticalSpace,
                  CustomTabBar(
                    tabController: _paymentTypeController,
                    tabs: [
                      ...state.payments.map((e) => Tab(
                            child: Text(AppHelpers.getTranslation(e.tag ?? '')),
                          )),
                    ],
                  ),
                  48.verticalSpace,
                  CustomButton(
                    title: TrKeys.show,
                    onPressed: () {
                      final notifier = ref.read(ordersFilterProvider.notifier);
                      notifier
                        ..setTime()
                        ..setOrderType(_orderTypeController.index)
                        ..setPaymentStatus(_paymentStatusController.index)
                        ..setPaymentType(_paymentTypeController.index);
                      Navigator.pop(context);
                    },
                  )
                ]),
        )
      ]),
    ));
  }
}
