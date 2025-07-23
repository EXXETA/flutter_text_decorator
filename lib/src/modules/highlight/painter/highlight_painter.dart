import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_text_decorator/src/modules/underline/mixins/line_gap_mixin.dart';

/// A [CustomPainter] that draws a marker-style highlight over text.
///
/// This painter creates a slightly wavy, thick line that mimics the appearance
/// of a physical highlighter pen. The highlight is drawn horizontally across
/// the vertical center of the text.
///
/// Key properties:
/// - `text`: The [String] content to be highlighted.
/// - `color`: The [Color] of the highlight.
/// - `textStyle`: The [TextStyle] of the text, used to determine dimensions
///   for the highlight, particularly its default thickness.
/// - `strokeWidth`: The thickness of the highlight line. If `null`, it defaults
///   to the height of the text (calculated via `textPainter.height`).
///
/// The highlight path is a cubic Bezier curve, giving it a slightly
/// irregular, hand-drawn feel.
///
/// Example (conceptual, as direct usage might be part of a larger framework):
/// ```dart
/// CustomPaint(
///   painter: HighlightPainter(
///     text: "Important Text",
///     color: Colors.yellow.withOpacity(0.5),
///     textStyle: TextStyle(fontSize: 18),
///   ),
/// )
/// ```
class HighlightPainter extends CustomPainter with LineGap {
  HighlightPainter({required this.text, required this.color, required this.textStyle, this.strokeWidth});
  final String text;
  final Color color;
  final TextStyle textStyle;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width);

    final strokeW = strokeWidth ?? textStyle.fontSize ?? 16;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeW;

    double yOffset = 0;

    for (final line in textPainter.computeLineMetrics()) {
      final width = size.width;
      const yThreshold = 5;
      final horizontalOffset = line.width / 4;
      final height = line.height + line.descent;
      final y = yOffset + height / 2;
      final path = Path()
        ..moveTo(line.left, yOffset + line.height / 2)
        ..cubicTo(
          horizontalOffset,
          y + yThreshold,
          width - horizontalOffset,
          y - yThreshold,
          width,
          y + yThreshold,
        );

      canvas.drawPath(path, paint);
      yOffset += line.height + line.descent;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
