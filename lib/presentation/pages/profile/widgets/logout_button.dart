import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class LogoutButton extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onChange;

  const LogoutButton({super.key, required this.isOpen, required this.onChange})
      ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlurWrap(
          radius: BorderRadius.circular(10.r),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Style.semiGrey,
            ),
            padding: EdgeInsets.all(4.r),
            child: CustomToggle(
              isText: true,
              key: UniqueKey(),
              controller: ValueNotifier<bool>(isOpen),
              onChange: (value) {
                onChange();
              },
            ),
          ),
        ),
        // 16.horizontalSpace,
        // ButtonEffectAnimation(
        //   child: GestureDetector(
        //     onTap: () => AppHelpers.showCustomModalBottomSheet(
        //       context: context,
        //       modal: const LogoutModal(),
        //     ),
        //     child: BlurWrap(
        //       radius: BorderRadius.circular(10.r),
        //       child: Container(
        //         width: 40.r,
        //         height: 40.r,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10.r),
        //           color: Style.black.withOpacity(0.29),
        //         ),
        //         alignment: Alignment.center,
        //         child: Icon(
        //           Remix.logout_circle_r_line,
        //           color: Style.white,
        //           size: 22.r,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
