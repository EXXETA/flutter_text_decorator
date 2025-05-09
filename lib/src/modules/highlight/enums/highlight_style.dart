import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/highlight/painter/highlight_painter.dart';

enum HighlightStyle {
  marker;

  CustomPainter getPainter(Text text, Color? color, double? strokeWidth) {
    switch (this) {
      case HighlightStyle.marker:
        return HighlightPainter(
          text: text.data ?? '',
          color: color ?? Colors.yellow,
          textStyle: text.style ?? const TextStyle(),
          strokeWidth: strokeWidth,
        );
    }
  }
}
