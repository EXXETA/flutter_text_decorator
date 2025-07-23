import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/underline/base/underline_painter.dart';
import 'package:flutter_text_decorator/src/modules/underline/classes/horizontal_offset.dart';
import 'package:flutter_text_decorator/src/modules/underline/mixins/line_gap_mixin.dart';

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
class HorizontalUnderlinePainter extends UnderlinePainter with LineGap {
  HorizontalUnderlinePainter({
    required this.text,
    required super.color,
    required super.strokeWidth,
    super.textStyle,
    super.horizontalOffset,
  });

  final String text;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;

    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle ?? const TextStyle()),
      textDirection: ui.TextDirection.ltr,
    )..layout(maxWidth: size.width);

    final lines = textPainter.computeLineMetrics();
    double yOffset = 0;

    for (final line in lines) {
      final double startX = line.left + horizontalOffset.left;
      final double endX = line.left + line.width - horizontalOffset.right;
      final double underlineY = yOffset + line.ascent + line.descent + strokeWidth;

      if (startX < endX) {
        canvas.drawLine(Offset(startX, underlineY), Offset(endX, underlineY), paint);
      }
      yOffset += calculateGapBetweenLines(line: line, lineIndex: line.lineNumber, strokeWidth: strokeWidth);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
