import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class OrdersChart extends StatefulWidget {
  final List<int> count;
  final List<DateTime> times;
  final List<ChartData> chart;
  final bool isDay;

  const OrdersChart({
    super.key,
    required this.count,
    required this.chart,
    required this.times,
    required this.isDay,
  });

  @override
  State<OrdersChart> createState() => _OrdersChartState();
}

class _OrdersChartState extends State<OrdersChart> {
  List<Color> gradientColors = [
    Style.primary.withOpacity(0.5),
    Style.transparent,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240.r,
      margin: REdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 16.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((AppConstants.radius / 1.2).r),
          color: Style.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppHelpers.getTranslation(TrKeys.ordersChart),
            style: Style.interSemi(size: 18),
          ),
          24.verticalSpace,
          Expanded(
            child: widget.chart.isNotEmpty
                ? LineChart(
                    mainData(),
                  )
                : Center(
                    child: Text(
                      AppHelpers.getTranslation(TrKeys.needOrder),
                      style: Style.interSemi(size: 22),
                    ),
                  ),
          ),
        ],
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
            DateFormat(widget.isDay ? "HH:00" : "MMM d")
                .format(widget.times[value.ceil()]),
            style: style),
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = Style.interRegular(size: 12);
    return AutoSizeText(
      widget.count.length > value.toInt()
          ? widget.count[value.toInt()].toString()
          : '0',
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
            reservedSize: 56.r,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: widget.times.length.toDouble() - 1,
      minY: 0,
      maxY: (widget.count.length >= 5 ? 4 : widget.count.length - 1).toDouble(),
      lineBarsData: [
        LineChartBarData(
          spots: [
            ...widget.times.mapIndexed((e, i) => FlSpot(
                  i.toDouble(),
                  widget.count.findPriceIndex(
                    widget.isDay
                        ? widget.chart.findPriceWithHour(e)
                        : widget.chart.findPrice(e),
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
              colors: gradientColors,
            ),
          ),
        ),
      ],
    );
  }
}
