import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class BrandScreen extends StatelessWidget {
  final List<Brand> brandes;
  final List<int> list;
  final ValueChanged<int> onChange;

  const BrandScreen(
      {super.key,
      required this.brandes,
      required this.list,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.circular(AppConstants.radius.r),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Style.transparent,
          primaryColor: Style.black,
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(secondary: Style.black, primary: Style.black),
        ),
        child: ExpansionTile(
          title: Text(
            AppHelpers.getTranslation(TrKeys.brands),
            style: Style.interNormal(color: Style.black, size: 16),
          ),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: brandes
                    .map((e) => InkWell(
                          onTap: () => onChange(e.id ?? 0),
                          child: Container(
                            margin: EdgeInsets.all(4.r),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                    color: list.contains(e.id)
                                        ? Style.primary
                                        : Style.icon)),
                            child: CommonImage(
                              url: e.img ?? "",
                              height: 50,
                              width: 50,
                              radius: 8,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
