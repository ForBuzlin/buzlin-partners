import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';

import 'add_delivery_address_modal.dart';
import 'address_item.dart';

class SelectAddressModal extends ConsumerStatefulWidget {
  final PickupAddress? address;

  const SelectAddressModal({super.key, required this.address});

  @override
  ConsumerState<SelectAddressModal> createState() => _SelectAddressModalState();
}

class _SelectAddressModalState extends ConsumerState<SelectAddressModal> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _fetchAddress(isRefresh: true);
      },
    );
  }

  _fetchAddress({bool isRefresh = false}) {
    ref.read(userAddressProvider.notifier).fetchUserUserAddress(
          context: context,
          controller: _refreshController,
          isRefresh: isRefresh ? true : false,
          userId: ref.read(orderUserProvider).selectedUser?.id,
          cityId: widget.address?.city?.id,
          countryId: widget.address?.country?.id,
          regionId: widget.address?.country?.regionId,
        );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userAddressProvider);
    return Container(
      margin: MediaQuery.viewInsetsOf(context),
      child: ModalWrap(
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ModalDrag(),
              Row(
                children: [
                  Text(
                    AppHelpers.getTranslation(TrKeys.addressBilling),
                    style: Style.interNormal(),
                  ),
                  const Spacer(),
                  ButtonEffectAnimation(
                    onTap: () async {
                      AppHelpers.showCustomModalBottomSheet(
                          context: context,
                          modal:
                              AddDeliveryAddressModal(address: widget.address));
                    },
                    child: Text(
                      AppHelpers.getTranslation(TrKeys.addAddress),
                      style: Style.interRegular(color: Style.primary, size: 14),
                    ),
                  ),
                ],
              ),
              4.verticalSpace,
              Expanded(
                child: state.isLoading
                    ? const Loading(size: 30)
                    : SmartRefresher(
                        controller: _refreshController,
                        enablePullUp: true,
                        onRefresh: () => _fetchAddress(isRefresh: true),
                        onLoading: () => _fetchAddress(),
                        child: state.list.isEmpty
                            ? const NoItem(title: TrKeys.noAddress)
                            : ListView.builder(
                                padding: REdgeInsets.symmetric(vertical: 12),
                                physics: const BouncingScrollPhysics(),
                                itemCount: state.list.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => AddressItem(
                                  address: state.list[index],
                                  onTap: () {
                                    ref
                                        .read(orderCartProvider.notifier)
                                        .setDeliveryAddress(
                                          state.list[index],
                                        );
                                    Navigator.pop(context);
                                  },
                                  active: true,
                                ),
                              ),
                      ),
              ),
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
