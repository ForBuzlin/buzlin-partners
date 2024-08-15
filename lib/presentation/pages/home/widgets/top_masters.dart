import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class TopMasters extends StatelessWidget {
  final List<MasterReportData> masters;

  const TopMasters({super.key, required this.masters});

  @override
  Widget build(BuildContext context) {
    return masters.isEmpty
        ? const SizedBox.shrink()
        : Container(
            height: 320.h,
            width: double.infinity,
            margin: REdgeInsets.symmetric(horizontal: 16,vertical: 8),
            padding: REdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular((AppConstants.radius / 1.4).r),
              color: Style.white,
              border: Border.all(color: Style.borderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppHelpers.getTranslation(TrKeys.topMasters),
                        style: Style.interSemi(size: 18),
                      ),
                    ),
                    Text(
                      AppHelpers.getTranslation(TrKeys.last30day),
                      style:
                          Style.interNormal(size: 14, color: Style.textColor),
                    ),
                  ],
                ),
                12.verticalSpace,
                Expanded(
                  child: DataTable2(
                      columnSpacing: 8.r,
                      horizontalMargin: 8.r,
                      minWidth: 260.w,
                      columns: [
                        DataColumn2(
                          size: ColumnSize.L,
                          label: Text(
                            AppHelpers.getTranslation(TrKeys.fullName),
                          ),
                        ),
                        DataColumn2(
                          numeric: true,
                          size: ColumnSize.S,
                          label: Text(
                            AppHelpers.getTranslation(TrKeys.count),
                          ),
                        ),
                        DataColumn2(
                          numeric: true,
                          size: ColumnSize.M,
                          label: Text(
                            AppHelpers.getTranslation(TrKeys.process),
                          ),
                        ),
                        DataColumn2(
                          numeric: true,
                          size: ColumnSize.S,
                          label: Text(
                            AppHelpers.getTranslation(TrKeys.ended),
                          ),
                        ),
                        DataColumn2(
                          size: ColumnSize.M,
                          numeric: true,
                          label: Text(
                            AppHelpers.getTranslation(TrKeys.canceled),
                          ),
                        ),
                      ],
                      rows: masters
                          .map<DataRow>(
                            (e) => DataRow(cells: [
                              DataCell(
                                Text(
                                    "${e.firstname ?? ''} ${e.lastname ?? ''}"),
                              ),
                              DataCell(Text("${e.count ?? 0}")),
                              DataCell(Text("${e.processCount ?? 0}")),
                              DataCell(Text("${e.endedCount ?? 0}")),
                              DataCell(Text("${e.canceledCount ?? 0}")),
                            ]),
                          )
                          .toList()),
                )
              ],
            ),
          );
  }
}
