import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/base/decoration_base.dart';
import 'package:flutter_text_decorator/src/modules/base/text_decoration_painter.dart';
import 'package:flutter_text_decorator/src/modules/circle/mixins/circle_mixin.dart';

/// A [CustomPainter] that draws a closed oval (or circle, depending on text aspect ratio)
/// decoration around a given text.
///
/// This painter renders a single, continuous oval shape that encloses the text.
/// It extends [TextDecoratorPainter], taking text content, style, and a
/// [DecorationBase] object (which provides color and stroke width) to define
/// its appearance.
///
/// The sizing and positioning of the oval are calculated based on the dimensions
/// of the text (obtained via the [CircleConstraints] mixin using `getCircleSizes`)
/// and internal scaling factors and offsets to achieve a visually encompassing effect.
/// These scaling factors are currently hardcoded.
///
/// This painter asserts that the provided [text] is not empty and that
/// `decoration.strokeWidth` is greater than 0.
///
/// Example (conceptual, as direct usage might be part of a larger framework):
/// ```dart
/// CustomPaint(
///   painter: ClosedCirclePainter(
///     text: "Closed Circle Text",
///     textStyle: TextStyle(fontSize: 16, color: Colors.black),
///     decoration: CircleDecoration(color: Colors.green, strokeWidth: 1.5), // Assuming CircleDecoration is compatible
///   ),
/// )
/// ```
class ClosedCirclePainter extends TextDecoratorPainter with CircleConstraints {
  ClosedCirclePainter({
    required super.text,
    required super.textStyle,
    required super.decoration,
  }) : assert(text != '' && decoration.strokeWidth > 0, 'text should not be empty and decoration.strokeWidth should be greater than 0');

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = decoration.color
      ..strokeWidth = decoration.strokeWidth
      ..style = PaintingStyle.stroke;

    final circleSize = getCircleSizes(text: text, textStyle: textStyle, size: size);

    final scaledVerticalRadiusBottomCircle = circleSize.verticalRadius * 3.5;
    const verticalOffset = 2.5;

    final centerOffset = Offset(
      size.width / 2,
      (size.height / verticalOffset) + verticalOffset,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: centerOffset,
        width: size.width * 1.1,
        height: scaledVerticalRadiusBottomCircle,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
