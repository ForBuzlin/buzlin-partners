import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class LanguagesModal extends ConsumerWidget {
  final VoidCallback? afterUpdate;

  const LanguagesModal({super.key, this.afterUpdate}) ;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(languagesProvider.notifier);
    final state = ref.watch(languagesProvider);
    return ModalWrap(
      body: state.isLoading
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 24.r),
              child: const Loading(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ModalDrag(),
                  TitleAndIcon(
                    title: AppHelpers.getTranslation(TrKeys.language),
                    titleSize: 18,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 24.r, bottom: 24.r),
                    itemCount: state.languages.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SelectItem(
                        onTap: () {
                          notifier.change(index, afterUpdate: afterUpdate);
                        },
                        isActive: LocalStorage.getLanguage()?.locale ==
                            state.languages[index].locale,
                        title: state.languages[index].title ?? '',
                      );
                    },
                  ),
                  32.verticalSpace,
                ],
              ),
            ),
    );
  }
}
