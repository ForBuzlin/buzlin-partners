import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/app_constants.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class AddressItem extends StatelessWidget {
  final MyAddress address;
  final VoidCallback onTap;
  final bool active;

  const AddressItem({
    super.key,
    required this.address,
    required this.onTap,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.r),
        padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 12.r),
        decoration: BoxDecoration(
            color: Style.newBoxColor,
            borderRadius: BorderRadius.circular(AppConstants.radius.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              address.location?.address ?? "",
              style: Style.interSemi(size: 14),
            ),
            RichText(
              text: TextSpan(
                  text: address.streetHouseNumber ?? "",
                  style: Style.interNormal(size: 12),
                  children: [
                    if (address.additionalDetails?.isNotEmpty ?? false)
                      TextSpan(
                        text: ", ${address.additionalDetails ?? ""}",
                      ),
                    if (address.zipcode?.isNotEmpty ?? false)
                      TextSpan(
                        text: ", ${address.zipcode ?? ""}",
                      ),
                  ]),
            ),
            Text(
              "(${address.firstname ?? ""} ${address.lastname ?? ""})",
              style: Style.interNormal(size: 12),
            )
          ],
        ),
      ),
    );
  }
}
