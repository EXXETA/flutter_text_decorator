import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/base/decoration_base.dart';
import 'package:flutter_text_decorator/src/modules/base/text_decoration_painter.dart';
import 'package:flutter_text_decorator/src/modules/circle/classes/circle_angle_option.dart';
import 'package:flutter_text_decorator/src/modules/circle/mixins/circle_mixin.dart';

/// A [CustomPainter] that draws an "open circle" decoration around text.
///
/// This painter renders two distinct arcs, one above and one below the text,
/// creating the visual effect of an incomplete or stylized circle. It extends
/// [TextDecoratorPainter], taking text content, style, and a [DecorationBase]
/// object (which provides color and stroke width) to define its appearance.
///
/// The sizing and positioning of the arcs are calculated based on the dimensions
/// of the text (obtained via the [CircleConstraints] mixin using `getCircleSizes`)
/// and internal scaling factors and offsets to achieve the specific "open circle" look.
/// These scaling factors and angles are currently hardcoded to produce a specific
/// aesthetic.
///
/// This painter asserts that the provided [text] is not empty and that
/// `decoration.strokeWidth` is greater than 0.
///
/// Example (conceptual, as direct usage might be part of a larger framework):
/// ```dart
/// CustomPaint(
///   painter: OpenCirclePainter(
///     text: "Open Circle Text",
///     textStyle: TextStyle(fontSize: 16, color: Colors.black),
///     decoration: CircleDecoration(color: Colors.blue, strokeWidth: 2.0), // Assuming CircleDecoration is compatible
///   ),
/// )
/// ```
class OpenCirclePainter extends TextDecoratorPainter with CircleConstraints {
  OpenCirclePainter({
    required super.text,
    required super.textStyle,
    required super.decoration,
    this.circleAngleOption = const CircleAngleOption.bottomLeft(),
  }) : assert(text != '' && decoration.strokeWidth > 0, 'text should not be empty and decoration.strokeWidth should be greater than 0');

  /// Defines the start and sweep angles for the two arcs forming the open circle.
  ///
  /// Defaults to [CircleAngleOption.bottomLeft] if not specified.
  final CircleAngleOption circleAngleOption;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = decoration.color
      ..strokeWidth = decoration.strokeWidth
      ..style = PaintingStyle.stroke;

    final circleSize = getCircleSizes(text: text, textStyle: textStyle, size: size);

    final scaledHorizontalRadius = circleSize.horizontalRadius * 2;
    final scaledVerticalRadiusBottomCircle = circleSize.verticalRadius * 3;
    final scaledVerticalRadiusTopCircle = circleSize.verticalRadius * 3.5;
    const verticalOffset = 1.8;

    final centerOffset = Offset(
      size.width / 2,
      (size.height / verticalOffset) + verticalOffset,
    );

    canvas
      ..drawArc(
        Rect.fromCenter(
          center: centerOffset,
          width: scaledHorizontalRadius,
          height: scaledVerticalRadiusBottomCircle,
        ),
        circleAngleOption.startAngleBottomCircle,
        circleAngleOption.sweepAngleBottomCircle,
        false,
        paint,
      )
      ..drawArc(
        Rect.fromCenter(
          center: centerOffset,
          width: scaledHorizontalRadius,
          height: scaledVerticalRadiusTopCircle,
        ),
        circleAngleOption.startAngleTopCircle,
        circleAngleOption.sweepAngleTopCircle,
        false,
        paint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is OpenCirclePainter) {
      return oldDelegate.circleAngleOption.startAngleBottomCircle != circleAngleOption.startAngleBottomCircle ||
          oldDelegate.circleAngleOption.sweepAngleBottomCircle != circleAngleOption.sweepAngleBottomCircle ||
          oldDelegate.circleAngleOption.startAngleTopCircle != circleAngleOption.startAngleTopCircle ||
          oldDelegate.circleAngleOption.sweepAngleTopCircle != circleAngleOption.sweepAngleTopCircle;
    }
    return true; // Repaint if the delegate type changes or for other unknown reasons
  }
}
