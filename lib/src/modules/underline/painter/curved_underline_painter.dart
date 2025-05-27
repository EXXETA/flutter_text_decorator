import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/underline/base/underline_painter.dart';

/// A [CustomPainter] that draws a curved or wavy underline beneath text.
///
/// This painter extends [UnderlinePainter] and implements a specific style
/// of underline that uses a cubic Bezier curve to create a flowing,
/// non-straight line.
///
/// Key properties inherited or used:
/// - `text`: The [String] content to be underlined.
/// - `color`: The [Color] of the underline.
/// - `strokeWidth`: The thickness of the underline.
/// - `textStyle`: The [TextStyle] of the text, used for layout by `TextPainter`
///   to help determine the path of the curve relative to the text dimensions.
///
/// The curve's control points are calculated relative to the `size` of the canvas
/// and the `textPainter.width` to create its characteristic shape.
///
/// Example (conceptual, as direct usage might be part of a larger framework):
/// ```dart
/// CustomPaint(
///   painter: CurvedUnderlinePainter(
///     text: "Curvy Text",
///     color: Colors.blue,
///     strokeWidth: 2.0,
///     textStyle: TextStyle(fontSize: 18),
///   ),
/// )
/// ```
class CurvedUnderlinePainter extends UnderlinePainter {
  CurvedUnderlinePainter({
    required this.text,
    required super.color,
    required super.strokeWidth,
    this.curvyFactor = 0.7,
    super.textStyle,
  });

  final String text;
  final double curvyFactor;

  @override
  void paint(Canvas canvas, Size size) {
    final currentTextStyle = super.textStyle ?? const TextStyle();
    final textSpan = TextSpan(text: text, style: currentTextStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: ui.TextDirection.ltr,
    )..layout(maxWidth: size.width);

    final Paint paint = Paint()
      ..color = super.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = super.strokeWidth;

    final List<ui.LineMetrics> lines = textPainter.computeLineMetrics();

    final double waveHeightUnit = super.strokeWidth * 3.0;

    for (int lineIdx = 0; lineIdx < lines.length; lineIdx++) {
      final line = lines[lineIdx];

      final double startX = line.left + horizontalOffset.left;
      final double xEnd = line.left + line.width - horizontalOffset.right;
      final double effectiveLineWidth = xEnd - startX;

      if (effectiveLineWidth <= 0) {
        continue;
      }

      final double lineGapY = _calculateGapBetweenLines(lineIdx, line, super.strokeWidth);
      final double yCp1 = lineGapY - waveHeightUnit * curvyFactor;
      final double yCp2 = lineGapY + waveHeightUnit * curvyFactor;
      final double yEnd = lineGapY;
      final double xCp1 = startX + effectiveLineWidth * (1 / 3);
      final double xCp2 = startX + effectiveLineWidth * (2 / 3);

      final Path path = Path()
        ..moveTo(startX, lineGapY)
        ..cubicTo(xCp1, yCp1, xCp2, yCp2, xEnd, yEnd);

      canvas.drawPath(path, paint);
    }
  }

  double _calculateGapBetweenLines(int lineIndex, ui.LineMetrics line, double currentStrokeWidth) {
    double desiredGap = 5;
    if (lineIndex == 0) {
      desiredGap = 1;
    }
    return line.baseline + line.descent + desiredGap + (currentStrokeWidth / 2.0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
