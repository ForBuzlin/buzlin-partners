import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import '../styles/style.dart';

class CustomRadio extends StatefulWidget {
  final String title;
  final bool? isActive;
  final String subTitle;
  final Function(bool) onChanged;

  const CustomRadio(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.onChanged,
      required this.isActive})
      ;

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppHelpers.getTranslation(widget.title),
          style: Style.interNormal(size: 16),
        ),
        12.verticalSpace,
        GestureDetector(
          onTap: () => widget.onChanged(false),
          child: Row(
            children: [
              widget.isActive ?? false
                  ? CircleAvatar(
                      radius: 10.r,
                      backgroundColor: Style.primary,
                      child: Center(
                        child: Icon(
                          Remix.check_fill,
                          size: 14.r,
                          color: Style.white,
                        ),
                      ),
                    )
                  : Container(
                      height: 20.r,
                      width: 20.r,
                      decoration: BoxDecoration(
                        border: Border.all(color: Style.black),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
              8.horizontalSpace,
              Text(
                AppHelpers.getTranslation(widget.subTitle),
                style: Style.interNormal(size: 15),
              ),
            ],
          ),
        )
      ],
    );
  }
}
