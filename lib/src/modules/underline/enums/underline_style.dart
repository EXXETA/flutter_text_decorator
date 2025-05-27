import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/underline/painter/curved_underline_painter.dart';
import 'package:flutter_text_decorator/src/modules/underline/painter/horizontal_underline_painter.dart';

/// Defines the different styles available for underlining text.
///
/// Each style corresponds to a specific [CustomPainter] that will be used
/// to render the underline. The [getPainter] method is used to retrieve the
/// appropriate painter instance based on the enum value.
enum UnderlineStyle {
  horizontal,
  curved;

  /// Returns the [CustomPainter] corresponding to the underline style.
  ///
  /// - `text`: The [Text] widget to be decorated. The painter will use
  ///   `text.data` (or an empty string if null) and `text.style`
  ///   (or a default `TextStyle` if null), particularly for the `curved` style.
  /// - `color`: The [Color] of the underline.
  /// - `strokeWidth`: The thickness of the underline.
  CustomPainter getPainter(Text text, Color color, double strokeWidth) {
    switch (this) {
      case UnderlineStyle.horizontal:
        return HorizontalUnderlinePainter(
          text: text.data ?? '',
          textStyle: text.style ?? const TextStyle(),
          color: color,
          strokeWidth: strokeWidth,
        );
      case UnderlineStyle.curved:
        return CurvedUnderlinePainter(
          textStyle: text.style ?? const TextStyle(),
          color: color,
          text: text.data ?? '',
          strokeWidth: strokeWidth,
        );
    }
  }
}
