import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';

class ServiceCategoriesModal extends ConsumerStatefulWidget {
  final ValueChanged<CategoryData> onChange;

  const ServiceCategoriesModal({super.key, required this.onChange})
      ;

  @override
  ConsumerState<ServiceCategoriesModal> createState() =>
      _MultiSelectionWidgetState();
}

class _MultiSelectionWidgetState extends ConsumerState<ServiceCategoriesModal> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (ref.watch(serviceCategoriesProvider).categories.isEmpty) {
          ref
              .read(serviceCategoriesProvider.notifier)
              .fetchCategories(context: context, isRefresh: true);
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
    final state = ref.watch(serviceCategoriesProvider);
    final notifier = ref.read(serviceCategoriesProvider.notifier);
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const ModalDrag(),
            Expanded(
              child: state.isLoading
                  ? const Loading()
                  : SmartRefresher(
                      controller: _refreshController,
                      enablePullUp: true,
                      onRefresh: () => notifier.fetchCategories(
                        controller: _refreshController,
                        isRefresh: true,
                        context: context,
                      ),
                      onLoading: () => notifier.fetchCategories(
                        controller: _refreshController,
                        context: context,
                      ),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.categories.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return FoodCategoryItem(
                            category: state.categories[index],
                            onSelect: (category) {},
                            onChange: (category) {
                              widget.onChange(category);
                            },
                          );
                        },
                      ),
                    ),
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
