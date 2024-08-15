import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class ParentFormModal extends ConsumerStatefulWidget {
  final ValueChanged<FormOptionsData> onSelect;

  const ParentFormModal({super.key, required this.onSelect});

  @override
  ConsumerState<ParentFormModal> createState() => _ParentFormModalState();
}

class _ParentFormModalState extends ConsumerState<ParentFormModal> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(formProvider.notifier).fetchParentForms(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(formProvider);
    final notifier = ref.read(formProvider.notifier);
    return ModalWrap(
      color: Style.background,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const ModalDrag(),
            Expanded(
              child: state.isParentLoading
                  ? const Loading()
                  : SmartRefresher(
                      controller: _refreshController,
                      enablePullUp: true,
                      enablePullDown: true,
                      onRefresh: () => notifier.fetchParentForms(
                        context: context,
                        controller: _refreshController,
                        isRefresh: true,
                      ),
                      onLoading: () => notifier.fetchParentForms(
                        context: context,
                        controller: _refreshController,
                      ),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.parentForms.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return _formItem(
                              form: state.parentForms[index],
                              onTap: () {
                                widget.onSelect.call(state.parentForms[index]);
                                Navigator.pop(context);
                              });
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

  _formItem({required FormOptionsData form, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Style.white,
          borderRadius: BorderRadius.circular(AppConstants.radius/1.4)
        ),
        child: Row(
          children: [
            Expanded(child: Text(form.translation?.title ?? '')),
            Text("${form.data?.length ?? 0} ${AppHelpers.getTranslation(TrKeys.question).toLowerCase()}"),
          ],
        ),
      ),
    );
  }
}
