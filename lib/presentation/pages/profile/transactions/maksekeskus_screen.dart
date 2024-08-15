import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MaksekeskusScreen extends ConsumerStatefulWidget {
  final ValueChanged<String> onSuccess;
  final num price;

  const MaksekeskusScreen({super.key, required this.onSuccess, required this.price});

  @override
  ConsumerState<MaksekeskusScreen> createState() => _MaksekeskusScreenState();
}

class _MaksekeskusScreenState extends ConsumerState<MaksekeskusScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(walletProvider.notifier).fetchMaksekeskus(context,widget.price);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(walletProvider);
    return BlurWrap(
      radius: BorderRadius.only(
        topRight: Radius.circular(24.r),
        topLeft: Radius.circular(24.r),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Style.newBoxColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppHelpers.getTranslation(TrKeys.paymentMethod),
              style: Style.interSemi(size: 16),
            ),
            16.verticalSpace,
            state.isMaksekeskusLoading
                ? const Loading()
                : Wrap(
                    spacing: 6,
                    runSpacing: 8,
                    children: [
                      ...?state.maksekeskus?.methods?.map((e) => InkWell(
                            onTap: () {
                              widget.onSuccess.call(e.url ?? '');
                            },
                            child: Container(
                              padding: REdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: state.selectMethodLink == e.url
                                      ? Style.primary
                                      : Style.transparent),
                              child: CommonImage(
                                url: e.logoUrl ?? '',
                                height: 38,
                                width: 108,
                                radius: 0,
                              ),
                            ),
                          ))
                    ],
                  ),
            36.verticalSpace,
          ],
        ),
      ),
    );
  }
}
