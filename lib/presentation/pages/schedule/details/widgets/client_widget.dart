import 'package:remixicon/remixicon.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ClientWidget extends StatelessWidget {
  final UserData? user;
  final String? title;
  final VoidCallback? onTap;

  const ClientWidget({super.key, required this.user, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            AppHelpers.getTranslation(title!),
            style: Style.interNormal(),
          ),
        4.verticalSpace,
        Container(
          padding: REdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Style.textHint),
              borderRadius: BorderRadius.circular(AppConstants.radius)),
          child: Row(
            children: [
              CommonImage(
                url: user?.img,
                height: 48,
                width: 48,
                radius: 24,
                title:
                    '${user?.firstname?[0] ?? ''}${user?.lastname?[0] ?? ''}',
              ),
              8.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user?.firstname ?? AppHelpers.getTranslation(TrKeys.unKnow)} ${user?.lastname ?? ''}',
                    ),
                    4.verticalSpace,
                    if (user?.phone != null)
                      Text(
                        user?.phone ?? '',
                        style:
                            Style.interNormal(size: 12, color: Style.textHint),
                      ),
                    if (user?.email != null)
                      Text(
                        user?.email ?? '',
                        style:
                            Style.interNormal(size: 12, color: Style.textHint),
                      ),
                  ],
                ),
              ),
              if (onTap != null)
                IconButton(
                  onPressed: onTap,
                  icon: const Icon(Remix.edit_2_line),
                )
            ],
          ),
        ),
        4.verticalSpace,
      ],
    );
  }
}
