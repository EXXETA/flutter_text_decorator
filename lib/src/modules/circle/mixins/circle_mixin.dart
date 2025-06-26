import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_text_decorator/src/modules/circle/classes/circle_size.dart';

/// A mixin that provides a utility method to calculate dimensions
/// for drawing a circle or circular shapes around a given text.
///
/// This mixin is intended to be used by `CustomPainter` implementations
/// that need to determine the appropriate size and radius for a circle
/// based on the text content and its style.
///
mixin CircleConstraints {
  /// The `getCircleSizes` method calculates the text's width and height
  /// and then derives horizontal and vertical radii for the circle.
  /// These radii are scaled and offset by predefined constants
  /// (`textWidthScale`, `textHeightScale`, `textHeightOffset`) to ensure
  /// the circle visually encompasses the text appropriately. These constants
  /// are empirically determined to provide a visually pleasing default
  /// circular boundary.
  CircleSize getCircleSizes({
    required String text,
    required TextStyle textStyle,
    required Size size,
  }) {
    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width);

    const textHeightOffset = 2;
    const textWidthScale = 1.8;
    const textHeightScale = 2;
    final textWidth = textPainter.width;
    final textHeight = textPainter.height;
    final horizontalRadius = (textPainter.width) / textWidthScale;
    final verticalRadius = (textPainter.height) / textHeightScale - textHeightOffset;

    return CircleSize(
      textWidth: textWidth,
      textHeight: textHeight,
      horizontalRadius: horizontalRadius,
      verticalRadius: verticalRadius,
    );
  }
}
