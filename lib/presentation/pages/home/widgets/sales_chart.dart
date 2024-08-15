import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class SalesChart extends StatelessWidget {
  final List<num> price;
  final List<DateTime> times;
  final List<IncomeChartResponse> chart;
  final bool isDay;
  final bool isLoading;

  const SalesChart({
    super.key,
    required this.price,
    required this.chart,
    required this.times,
    required this.isDay,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 32),
      child: isLoading
          ? const Loading()
          : chart.isNotEmpty
              ? LineChart(
                  mainData(),
                )
              : Center(
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.needOrder),
                    style: Style.interSemi(size: 22),
                  ),
                ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    final style = Style.interRegular(size: 10);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Padding(
        padding: REdgeInsets.only(top: 4),
        child: Text(
            DateFormat(isDay ? "HH:00" : "MMM d")
                .format(times[value.ceil()]),
            style: style),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = Style.interRegular(size: 12);
    return AutoSizeText(
      AppHelpers.numberFormat(number: price[value.toInt()]),
      style: style,
      textAlign: TextAlign.left,
      maxLines: 1,
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Style.iconButtonBack,
            strokeWidth: 1,
            dashArray: [10],
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 24.r,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 84.r,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: times.length.toDouble() - 1,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            ...times.mapIndexed((e, i) => FlSpot(
                  i.toDouble(),
                  price.findPriceIndex(
                    isDay
                        ? chart.findPriceWithHour(e)
                        : chart.findPrice(e),
                  ),
                )),
          ],
          isCurved: true,
          color: Style.primary,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: Style.primaryGradient,
            ),
          ),
        ),
      ],
    );
  }
}
