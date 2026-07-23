import 'dart:math';
import 'package:flutter/material.dart';

/// A [CustomPainter] that draws a rounded rectangle (box) around a given [Text] widget.
///
/// This painter is designed to create a visual bounding box for text content.
/// It calculates the dimensions of the text and then draws a rounded rectangle
/// that encompasses it. The box's width will not exceed the available width
/// provided by the `size` parameter in the `paint` method. If the text is wider
/// than the available space, the box height will adjust to accommodate the
/// text, assuming it wraps to multiple lines.
///
/// To use [RoundedBoxPainter], provide it with the [Text] widget to be decorated,
/// the desired [borderRadius] for the corners of the box, and the [strokeWidth]
/// for the box's outline.
///
/// Example:
/// ```dart
/// CustomPaint(
///   painter: RoundedBoxPainter(
///     text: Text("Hello World", style: TextStyle(fontSize: 16)),
///     borderRadius: 8.0,
///     strokeWidth: 2.0,
///     padding: EdgeInsets.all(8),
///     color: Colors.black,
///   ),
///   child: Text("Hello World", style: TextStyle(fontSize: 16)), // Optional: if you want the text painted by Flutter's framework too
/// )
/// ```
class RoundedBoxPainter extends CustomPainter {
  RoundedBoxPainter({
    required this.text,
    required this.borderRadius,
    required this.strokeWidth,
    required this.padding,
    required this.color,
    super.repaint,
  });
  final Text text;
  final double borderRadius;
  final double strokeWidth;
  final EdgeInsets padding;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final textSpan = TextSpan(text: text.data, style: text.style);
    final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr)..layout();

    final textWidth = textPainter.width;
    final boxWidth = min(textWidth, size.width);

    final textHeight = textPainter.height;
    var boxHeight = textHeight;

    final heightFactor = textWidth / size.width;
    final nLines = heightFactor.ceil();
    boxHeight = nLines * textHeight;

    final centerOffset = Offset(
      _getOffsetDx(size),
      _getOffsetDy(size),
    );

    final rrect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: centerOffset, width: boxWidth + padding.horizontal, height: boxHeight + padding.vertical),
      Radius.circular(borderRadius),
    );

    canvas.drawRRect(rrect, paint);
  }

  double _getOffsetDx(Size size) {
    var dx = size.width / 2;
    if (padding.left != padding.right) {
      final diff = (padding.left - padding.right).abs() / 2;
      dx = padding.left < padding.right ? dx + diff : dx - diff;
    }
    return dx;
  }

  double _getOffsetDy(Size size) {
    var dy = size.height / 2;
    if (padding.top != padding.bottom) {
      final diff = (padding.top - padding.bottom).abs() / 2;
      dy = padding.top < padding.bottom ? dy + diff : dy - diff;
    }
    return dy;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
