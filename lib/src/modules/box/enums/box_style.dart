import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/box/decorations/bubble_box_tip.dart';
import 'package:flutter_text_decorator/src/modules/box/painter/bubble_box_painter.dart';
import 'package:flutter_text_decorator/src/modules/box/painter/rounded_box_painter.dart';
import 'package:flutter_text_decorator/src/modules/box/painter/wavy_box_painter.dart';

/// Defines the different styles available for box decorations around text.
///
/// Each style corresponds to a specific [CustomPainter] that will be used
/// to render the box. The [getPainter] method is used to retrieve the
/// appropriate painter instance based on the enum value.
enum BoxStyle {
  rounded,
  bubble,
  curled;

  /// Returns the [CustomPainter] corresponding to the box style.
  ///
  /// - `text`: The [Text] widget to be decorated.
  /// - `borderRadius`: Intended for the radius of corners.
  /// - `strokeWidth`: Intended for the thickness of the box outline.
  ///
  /// See individual enum value documentation for notes on parameter usage for specific styles.
  CustomPainter getPainter(Text text, double borderRadius, double strokeWidth) {
    switch (this) {
      case BoxStyle.rounded:
        return RoundedBoxPainter(text: text, borderRadius: borderRadius, strokeWidth: strokeWidth);
      case BoxStyle.bubble:
        return BubbleBoxPainter(
          text: text,
          padding: 4,
          bubbleColor: Colors.orange,
          tip: const BubbleBoxTip(
            position: TipPosition.left,
            orientation: TipOrientation.left,
          ),
        );
      case BoxStyle.curled:
        return WavyBoxPainter(text: text, borderColor: Colors.black);
    }
  }
}
