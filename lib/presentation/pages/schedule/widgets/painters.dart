import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class HourLinePainter extends CustomPainter {
  final Color lineColor;
  final double lineHeight;
  final double offset;
  final double minuteHeight;
  final bool showVerticalLine;
  final double verticalLineOffset;
  final LineStyle lineStyle;
  final double dashWidth;
  final double dashSpaceWidth;
  final double emulateVerticalOffsetBy;

  HourLinePainter({
    required this.lineColor,
    required this.lineHeight,
    required this.minuteHeight,
    required this.offset,
    required this.showVerticalLine,
    required this.emulateVerticalOffsetBy,
    this.verticalLineOffset = 10,
    this.lineStyle = LineStyle.solid,
    this.dashWidth = 4,
    this.dashSpaceWidth = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final isRtl = LocalStorage.getLangLtr().index == 0;
    final dx = (isRtl ? 0 : offset) + emulateVerticalOffsetBy;
    final ex = size.width - (isRtl ? offset : 0);
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineHeight;
    for (var i = 1; i < AppConstants.hoursADay; i++) {
      final dy = i * minuteHeight * 60;
      if (lineStyle == LineStyle.dashed) {
        var startX = dx;
        while (startX < size.width) {
          canvas.drawLine(
              Offset(startX, dy), Offset(startX + dashWidth, dy), paint);
          startX += dashWidth + dashSpaceWidth;
        }
      } else {
        canvas.drawLine(Offset(dx, dy), Offset(ex, dy), paint);
      }
    }

    if (showVerticalLine && lineStyle == LineStyle.dashed) {
      var startY = 0.0;
      while (startY < size.height) {
        canvas.drawLine(Offset(offset + verticalLineOffset, startY),
            Offset(offset + verticalLineOffset, startY + dashWidth), paint);
        startY += dashWidth + dashSpaceWidth;
      }
    } else {
      canvas.drawLine(Offset(size.width - (isRtl ? offset : 0), 0),
          Offset(size.width - (isRtl ? offset : 0), size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is HourLinePainter &&
        (oldDelegate.lineColor != lineColor ||
            oldDelegate.offset != offset ||
            lineHeight != oldDelegate.lineHeight ||
            minuteHeight != oldDelegate.minuteHeight ||
            showVerticalLine != oldDelegate.showVerticalLine);
  }
}

class HalfHourLinePainter extends CustomPainter {
  final Color lineColor;
  final double lineHeight;
  final double offset;
  final double minuteHeight;
  final LineStyle lineStyle;
  final double dashWidth;
  final double dashSpaceWidth;

  HalfHourLinePainter({
    required this.lineColor,
    required this.lineHeight,
    required this.offset,
    required this.minuteHeight,
    required this.lineStyle,
    this.dashWidth = 4,
    this.dashSpaceWidth = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final isRtl = LocalStorage.getLangLtr().index == 0;
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineHeight;
    var ex = size.width - (isRtl ? offset : 0);
    for (var i = 0; i < AppConstants.hoursADay; i++) {
      final dy = i * minuteHeight * 60 + (minuteHeight * 30);
      if (lineStyle == LineStyle.dashed) {
        var startX = (isRtl ? 0.0 : offset);
        while (startX < ex) {
          canvas.drawLine(
              Offset(startX, dy), Offset(startX + dashWidth, dy), paint);
          startX += dashWidth + dashSpaceWidth;
        }
      } else {
        canvas.drawLine(Offset(offset, dy), Offset(size.width, dy), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is HourLinePainter &&
        (oldDelegate.lineColor != lineColor ||
            oldDelegate.offset != offset ||
            lineHeight != oldDelegate.lineHeight ||
            minuteHeight != oldDelegate.minuteHeight);
  }
}

class QuarterHourLinePainter extends CustomPainter {
  final Color lineColor;
  final double lineHeight;
  final double offset;
  final double minuteHeight;
  final LineStyle lineStyle;
  final double dashWidth;
  final double dashSpaceWidth;

  QuarterHourLinePainter({
    required this.lineColor,
    required this.lineHeight,
    required this.offset,
    required this.minuteHeight,
    required this.lineStyle,
    this.dashWidth = 4,
    this.dashSpaceWidth = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineHeight;

    for (var i = 0; i < AppConstants.hoursADay; i++) {
      final dy1 = i * minuteHeight * 60 + (minuteHeight * 15);
      final dy2 = i * minuteHeight * 60 + (minuteHeight * 45);

      if (lineStyle == LineStyle.dashed) {
        var startX = offset;
        while (startX < size.width) {
          canvas.drawLine(
              Offset(startX, dy1), Offset(startX + dashWidth, dy1), paint);
          startX += dashWidth + dashSpaceWidth;

          canvas.drawLine(
              Offset(startX, dy2), Offset(startX + dashWidth, dy2), paint);
          startX += dashWidth + dashSpaceWidth;
        }
      } else {
        canvas.drawLine(Offset(offset, dy1), Offset(size.width, dy1), paint);
        canvas.drawLine(Offset(offset, dy2), Offset(size.width, dy2), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is HourLinePainter &&
        (oldDelegate.lineColor != lineColor ||
            oldDelegate.offset != offset ||
            lineHeight != oldDelegate.lineHeight ||
            minuteHeight != oldDelegate.minuteHeight);
  }
}

class CurrentTimeLinePainter extends CustomPainter {
  final Color color;
  final double height;
  final Offset offset;
  final bool showBullet;
  final double bulletRadius;

  CurrentTimeLinePainter({
    this.showBullet = true,
    required this.color,
    required this.height,
    required this.offset,
    this.bulletRadius = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final isRtl = LocalStorage.getLangLtr().index == 0;
    canvas.drawLine(
      Offset(isRtl ? size.width - offset.dx : offset.dx, offset.dy),
      Offset(isRtl ? offset.dx - size.width : size.width, offset.dy),
      Paint()
        ..color = color
        ..strokeWidth = height,
    );

    if (showBullet) {
      canvas.drawCircle(
          Offset(isRtl ? size.width - offset.dx : offset.dx, offset.dy),
          bulletRadius,
          Paint()..color = color);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is CurrentTimeLinePainter &&
      (color != oldDelegate.color ||
          height != oldDelegate.height ||
          offset != oldDelegate.offset);
}
