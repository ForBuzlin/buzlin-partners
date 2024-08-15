import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:remixicon/remixicon.dart';
import 'widgets/order_address_modal.dart';
import 'widgets/order_status_modal.dart';
import 'widgets/replace_product_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'widgets/order_status_item.dart';
import 'package:flutter/material.dart';
import 'widgets/tracking_dialog.dart';
import 'widgets/phone_dialog.dart';

@RoutePage()
class OrderDetailsPage extends ConsumerStatefulWidget {
  final RefreshController? acceptedOrdersController;
  final RefreshController? onAWayOrdersController;
  final RefreshController? readyOrdersController;
  final RefreshController? newOrdersController;
  final bool isHistoryOrder;
  final String? heroTag;
  final OrderData order;

  const OrderDetailsPage({
    super.key,
    this.acceptedOrdersController,
    this.isHistoryOrder = false,
    this.onAWayOrdersController,
    this.readyOrdersController,
    this.newOrdersController,
    required this.order,
    this.heroTag,
  });

  @override
  ConsumerState<OrderDetailsPage> createState() => _OrderDetailsModalState();
}

class _OrderDetailsModalState extends ConsumerState<OrderDetailsPage> {
  late OrderDetailsNotifier notifier;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(orderDetailsProvider.notifier).fetchOrderDetails(
            order: widget.order,
            onSuccess: (order) {
              ref.read(orderStatusProvider.notifier).setOrder(order);
            });
      },
    );
  }

  @override
  void didChangeDependencies() {
    notifier = ref.read(orderDetailsProvider.notifier);
    super.didChangeDependencies();
  }

  _updateStatus(String? status) {
    notifier.updateOrderStatus(
      context,
      status: AppHelpers.getUpdatableStatus(status),
      success: () {
        Navigator.pop(context);
        switch (AppHelpers.getOrderStatus(status)) {
          case OrderStatus.newOrder:
            ref.read(newOrdersProvider.notifier).fetchNewOrders(
                  context: context,
                  isRefresh: true,
                  activeTabIndex: ref.read(homeAppbarProvider).index,
                );
            ref.read(acceptedOrdersProvider.notifier).fetchAcceptedOrders(
                  isRefresh: true,
                  refreshController: widget.acceptedOrdersController,
                );
            break;
          case OrderStatus.accepted:
            ref.read(acceptedOrdersProvider.notifier).fetchAcceptedOrders(
                  isRefresh: true,
                  refreshController: widget.acceptedOrdersController,
                );
            ref.read(readyOrdersProvider.notifier).fetchReadyOrders(
                  isRefresh: true,
                  refreshController: widget.readyOrdersController,
                );
            break;
          case OrderStatus.ready:
            ref.read(readyOrdersProvider.notifier).fetchReadyOrders(
                  isRefresh: true,
                  refreshController: widget.readyOrdersController,
                );
            ref.read(onAWayOrdersProvider.notifier).fetchOnAWayOrders(
                  isRefresh: true,
                  refreshController: widget.onAWayOrdersController,
                );
            break;
          case OrderStatus.onAWay:
            ref.read(onAWayOrdersProvider.notifier).fetchOnAWayOrders(
                  isRefresh: true,
                  refreshController: widget.onAWayOrdersController,
                );
            ref.read(onAWayOrdersProvider.notifier).fetchOnAWayOrders(
                  isRefresh: true,
                  refreshController: widget.onAWayOrdersController,
                );
            break;
          default:
            ref.read(newOrdersProvider.notifier).fetchNewOrders(
                  context: context,
                  isRefresh: true,
                  activeTabIndex: ref.read(homeAppbarProvider).index,
                );
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderDetailsProvider);
    final statusState = ref.watch(orderStatusProvider);
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Style.background,
        body: Column(
          children: [
            CommonAppBar(
              height: 68,
              bottomPadding: 10,
              child: Row(
                children: [
                  PopButton(heroTag: widget.heroTag),
                  6.horizontalSpace,
                  Text(
                    "${AppHelpers.getTranslation(TrKeys.order)} — #${state.order?.id ?? 0}",
                    style: Style.interSemi(size: 16),
                  )
                ],
              ),
            ),
            12.verticalSpace,
            Expanded(
              child: state.isLoading
                  ? const Loading()
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: REdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            CustomDetailItem(
                              title: TrKeys.name,
                              value: state.order?.user == null
                                  ? AppHelpers.getTranslation(
                                      TrKeys.deletedUser)
                                  : state.order?.user?.firstname ??
                                      AppHelpers.getTranslation(TrKeys.noName),
                            ),
                            const Divider(color: Style.colorGrey),
                            CustomDetailItem(
                              title: TrKeys.amount,
                              value: AppHelpers.numberFormat(
                                  number: state.order?.totalPrice),
                            ),
                            const Divider(color: Style.colorGrey),
                            CustomDetailItem(
                              title: TrKeys.orderDate,
                              value: DateService.dateFormatForOrder(
                                state.order?.createdAt,
                              ),
                            ),
                            if (state.order?.createdAt !=
                                state.order?.updatedAt)
                              Column(
                                children: [
                                  const Divider(color: Style.colorGrey),
                                  CustomDetailItem(
                                    title: TrKeys.updateDate,
                                    value: DateService.dateFormatForOrder(
                                        state.order?.updatedAt),
                                  ),
                                ],
                              ),
                            if (state.order?.deliveryType ==
                                DeliveryType.delivery.name)
                              Column(
                                children: [
                                  const Divider(color: Style.colorGrey),
                                  CustomDetailItem(
                                    title: TrKeys.deliveryTime,
                                    value: DateService.dateFormatForOrder(
                                        state.order?.deliveryDate),
                                  ),
                                ],
                              ),
                            if (state.order?.deliveryType ==
                                DeliveryType.delivery.name)
                              Column(
                                children: [
                                  const Divider(color: Style.colorGrey),
                                  CustomDetailItem(
                                    title: TrKeys.deliveryAddress,
                                    value: state.order?.myAddress?.location
                                            ?.address ??
                                        '',
                                    onTap: () {
                                      AppHelpers.showCustomModalBottomSheet(
                                        paddingTop: 100,
                                        context: context,
                                        modal: OrderAddressModal(
                                          address: state.order?.myAddress,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            16.verticalSpace,
                            OrderStatusItem(
                              title: TrKeys.deliveryType,
                              status: state.order?.deliveryType ?? "",
                            ),
                            _statusItem(
                                order: state.order, notes: statusState.notes),
                            OrderStatusItem(
                              title: TrKeys.paymentStatus,
                              status: state.order?.transaction?.status ??
                                  TrKeys.notPaid,
                            ),
                            if (state.order?.transaction?.status != null)
                              OrderStatusItem(
                                title: TrKeys.paymentMethod,
                                status: state.order?.transaction?.paymentSystem
                                        ?.tag ??
                                    TrKeys.noPayment,
                              ),
                            if (widget.isHistoryOrder) 8.verticalSpace,
                            if (state.order?.details != null &&
                                (state.order?.details?.isNotEmpty ?? false))
                              _orderProducts(state.order),
                            if (state.order?.note != null)
                              Container(
                                decoration: BoxDecoration(
                                  color: Style.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                margin: REdgeInsets.only(top: 8),
                                padding: REdgeInsets.symmetric(
                                    vertical: 14, horizontal: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Remix.chat_1_fill,
                                      size: 24.r,
                                      color: Style.black,
                                    ),
                                    12.horizontalSpace,
                                    Expanded(
                                      child: Text(
                                        state.order?.note ?? '',
                                        style: Style.interRegular(
                                          size: 13,
                                          color: Style.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            100.verticalSpace,
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: state.order?.type == 1 ||
                widget.isHistoryOrder ||
                state.order?.status == OrderStatus.delivered.name ||
                state.order?.status == OrderStatus.canceled.name ||
                state.isLoading ||
                state.order?.status == null
            ? const SizedBox.shrink()
            : state.isUpdating
                ? const Loading()
                : Padding(
                    padding: REdgeInsets.symmetric(horizontal: 16),
                    child: CustomButton(
                      title: AppHelpers.changeStatusButtonText(
                          state.order?.status),
                      onPressed: () {
                        if (AppHelpers.getOrderStatus(state.order?.status) ==
                                OrderStatus.ready &&
                            state.order?.deliveryType == TrKeys.delivery) {
                          AppHelpers.showAlertDialog(
                            context: context,
                            child: TrackingDialog(
                              onSuccess: () {
                                _updateStatus(state.order?.status);
                              },
                            ),
                          );
                          return null;
                        } else {
                          _updateStatus(state.order?.status);
                        }
                      },
                    ),
                  ),
      ),
    );
  }

  _statusItem({OrderData? order, List<Notes>? notes}) {
    return !(widget.isHistoryOrder ||
            order?.status == OrderStatus.delivered.name ||
            order?.status == OrderStatus.canceled.name ||
            (notes?.isEmpty ?? true))
        ? Container(
            decoration: BoxDecoration(
              color: Style.white,
              borderRadius: BorderRadius.circular(
                AppConstants.radius.r,
              ),
            ),
            child: ExpansionTile(
              backgroundColor: Style.white,
              shape: const CircleBorder(),
              maintainState: true,
              tilePadding: REdgeInsets.symmetric(horizontal: 16, vertical: 6),
              childrenPadding:
                  REdgeInsets.symmetric(horizontal: 16, vertical: 6),
              title: OrderStatusItem(
                padding: EdgeInsets.zero,
                title: TrKeys.orderStatus,
                status: order?.status ?? "",
                onTap: () {
                  if (!(widget.isHistoryOrder ||
                      order?.status == OrderStatus.delivered.name ||
                      order?.status == OrderStatus.canceled.name)) {
                    AppHelpers.showCustomModalBottomSheet(
                      paddingTop: 100,
                      context: context,
                      modal: OrderStatusModal(
                        onlyShow: (order?.type == 1),
                      ),
                    );
                  }
                },
              ),
              children: List.generate(
                  notes?.length ?? 0,
                  (index) => Padding(
                        padding: REdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    notes?[index].title?[
                                            LocalStorage.getLanguage()
                                                ?.locale] ??
                                        AppHelpers.getTranslation(
                                            TrKeys.unKnow),
                                    style: Style.interNormal(size: 14),
                                  ),
                                  4.verticalSpace,
                                  Text(
                                    DateService.dateFormatForOrder(
                                        notes?[index].createdAt),
                                    style: Style.interNormal(
                                      color: Style.textColor,
                                      size: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
            ),
          )
        : OrderStatusItem(
            title: TrKeys.orderStatus,
            status: order?.status ?? "",
          );
  }

  _orderProducts(OrderData? order) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: REdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: (order?.details?.length ?? 0) == 0
          ? Text(
              TrKeys.productReplaceOrDelete,
              style: Style.interNormal(size: 14),
            )
          : ListView.builder(
              itemCount: order?.details?.length ?? 0,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                Stocks? stock = order?.details?[index];
                return OrderProductItem(
                  stock: stock,
                  isLoading: false,
                  isLast: order?.details?.length == index + 1,
                  onEdit: (order?.status == TrKeys.newOrder ||
                              order?.status == TrKeys.accepted) &&
                          (stock?.bonus ?? false) == false
                      ? () {
                          if (AppHelpers.getPhoneRequired() &&
                              (order?.user?.phone == null ||
                                  order?.myAddress?.phone == null)) {
                            AppHelpers.showAlertDialog(
                              context: context,
                              child: PhoneDialog(onSuccess: (phone) {
                                notifier.setPhone(phone);
                                context.pushRoute(const ReplaceProductRoute());
                              }),
                            );
                          } else {
                            if (AppHelpers.getPhoneRequired()) {
                              notifier.setPhone((order?.user?.phone ??
                                  order?.myAddress?.phone));
                            }
                            notifier.setOldStock(stock);
                            context.pushRoute(const ReplaceProductRoute());
                          }
                        }
                      : null,
                  onShowReplace: () {
                    AppHelpers.showAlertDialog(
                        context: context,
                        child: ReplaceProductDialog(stocks: stock));
                  },
                );
              },
            ),
    );
  }
}
