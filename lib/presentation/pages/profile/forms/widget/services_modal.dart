import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'service_list_item.dart';

class ServicesModal extends ConsumerStatefulWidget {
  final ValueChanged<ServiceData> onSelect;

  const ServicesModal({super.key, required this.onSelect}) ;

  @override
  ConsumerState<ServicesModal> createState() => _ServicesModalState();
}

class _ServicesModalState extends ConsumerState<ServicesModal> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (ref.read(serviceMasterProvider).services.isEmpty) {
          ref
              .read(serviceMasterProvider.notifier)
              .fetchServices(isRefresh: true, context: context);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(serviceMasterProvider);
    final notifier = ref.read(serviceMasterProvider.notifier);
    return ModalWrap(
      color: Style.background,
      body: Column(
        children: [
          const ModalDrag(),
          Expanded(
            child: state.isLoading
                ? const Loading()
                : SmartRefresher(
                    controller: _refreshController,
                    enablePullDown: true,
                    enablePullUp: true,
                    onRefresh: () => notifier.fetchServices(
                      context: context,
                      isRefresh: true,
                      controller: _refreshController,
                    ),
                    onLoading: () => notifier.fetchServices(
                      context: context,
                      controller: _refreshController,
                    ),
                    child: state.services.isEmpty
                        ? const NoItem(title: TrKeys.noService)
                        : AnimationLimiter(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: REdgeInsets.only(
                                  top: 16, bottom: 56.r, left: 12, right: 12),
                              shrinkWrap: true,
                              itemCount: state.services.length,
                              itemBuilder: (context, index) =>
                                  AnimationConfiguration.staggeredList(
                                position: index,
                                duration: AppConstants.animationDuration,
                                child: ScaleAnimation(
                                  scale: 0.5,
                                  child: FadeInAnimation(
                                    child: ServiceListItem(
                                      service: state.services[index],
                                      spacing: 10,
                                      onTap: () {
                                        widget.onSelect
                                            .call(state.services[index]);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
