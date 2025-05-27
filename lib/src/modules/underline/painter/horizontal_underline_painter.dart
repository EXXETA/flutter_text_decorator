import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/underline/base/underline_painter.dart';

/// A [CustomPainter] that draws a straight horizontal underline beneath text.
///
/// This painter extends [UnderlinePainter] and implements a simple,
/// standard underline style. The line is drawn from the left edge to the
/// right edge of the available canvas `size`, at the bottom of the canvas.
///
/// Key properties inherited or used:
/// - `color`: The [Color] of the underline.
/// - `strokeWidth`: The thickness of the underline.
/// - `horizontalOffset`: An optional [HorizontalOffset] to adjust the start
///   and end points of the line. `horizontalOffset.left` indents the line
///   from the left, and `horizontalOffset.right` indents it from the right.
///
/// Example (conceptual, as direct usage might be part of a larger framework):
/// ```dart
/// CustomPaint(
///   painter: HorizontalUnderlinePainter(
///     color: Colors.red,
///     strokeWidth: 1.5,
///     horizontalOffset: HorizontalOffset(5, 10),
///   ),
///   child: Text("Underlined Text"),
/// )
/// ```
class HorizontalUnderlinePainter extends UnderlinePainter {
  final String text;

  HorizontalUnderlinePainter({
    required this.text,
    required super.color,
    required super.strokeWidth,
    super.textStyle,
    super.horizontalOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;

    final currentTextStyle = super.textStyle ?? const TextStyle();
    final textSpan = TextSpan(text: text, style: currentTextStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: ui.TextDirection.ltr,
    )..layout(maxWidth: size.width);

    final List<ui.LineMetrics> lines = textPainter.computeLineMetrics();

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];

      final double startX = line.left + horizontalOffset.left;
      final double endX = line.left + line.width - horizontalOffset.right;

      final gapY = _calculateGapBetweenLines(i, line);

      if (_isLineLengthPositiv(startX, endX)) {
        canvas.drawLine(Offset(startX, gapY), Offset(endX, gapY), paint);
      }
    }
  }

  bool _isLineLengthPositiv(double x, double y) {
    return x < y;
  }

  double _calculateGapBetweenLines(int lineIndex, ui.LineMetrics line) {
    double desiredGap = 5;
    if (lineIndex == 0) {
      desiredGap = 1;
    }

    return line.baseline + line.descent + desiredGap + (strokeWidth / 2.0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
