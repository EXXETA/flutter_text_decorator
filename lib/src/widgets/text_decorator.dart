import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/box/enums/box_style.dart';
import 'package:flutter_text_decorator/src/modules/circle/enums/circle_style.dart';
import 'package:flutter_text_decorator/src/modules/highlight/enums/highlight_style.dart';
import 'package:flutter_text_decorator/src/modules/underline/enums/underline_style.dart';

/// A versatile [StatelessWidget] that applies custom visual decorations to a
/// [Text] widget using a [CustomPainter].
///
/// `TextDecorator` simplifies the process of adding various graphical enhancements
/// around or on top of text, such as circles, underlines, boxes, and highlights.
/// It achieves this by wrapping the provided `Text` widget within a [CustomPaint]
/// widget, which then uses a specified `painter` to draw the decoration.
///
/// The widget offers several factory constructors for common decoration types,
/// making it easy to apply standard styles with minimal configuration:
/// - [TextDecorator.circled]: For drawing circular decorations around text.
/// - [TextDecorator.underlined]: For drawing various styles of underlines beneath text.
/// - [TextDecorator.boxed]: For drawing box-like enclosures (e.g., rounded, bubble, curled) around text.
/// - [TextDecorator.highlighted]: For applying highlight effects (e.g., marker style) to text.
///
/// Each factory constructor typically accepts the `Text` widget to be decorated
/// and style-specific parameters (like color, stroke width, or decoration style enums)
/// to customize the appearance of the decoration.
///
/// Basic Usage:
/// ```dart
/// TextDecorator.circled(
///   text: Text("Hello Circled World!", style: TextStyle(fontSize: 24)),
///   style: CircleStyle.dashed,
///   decoration: CircleDecoration(color: Colors.red, strokeWidth: 2.0),
/// )
///
/// TextDecorator.boxed(
///   text: Text("Important Note", style: TextStyle(fontSize: 18)),
///   style: BoxStyle.rounded,
///   borderRadius: 8.0,
///   strokeWidth: 1.5,
/// )
/// ```
///
class TextDecorator extends StatelessWidget {
  const TextDecorator({
    required this.text,
    required this.painter,
    super.key,
  });

  /// Creates a `TextDecorator` that draws a circular-style decoration around the [text].
  ///
  /// Parameters:
  /// - `text`: The [Text] widget to be decorated.
  /// - `style`: The [CircleStyle] to apply
  ///   Defaults to [CircleStyle.circled].
  /// - `color`: The [Color] of the circle outline. Defaults to [Colors.orange].
  /// - `strokeWidth`: The thickness of the circle outline. Defaults to `1.0`.
  ///
  /// Example Usage:
  /// ```dart
  /// TextDecorator.circled(
  ///   text: Text("Circled Text", style: TextStyle(fontSize: 20)),
  ///   style: CircleStyle.circled,
  ///   color: Colors.blue,
  ///   strokeWidth: 2.0,
  /// )
  /// ```
  factory TextDecorator.circled({
    required Text text,
    CircleStyle style = CircleStyle.circled,
    Color color = Colors.orange,
    double strokeWidth = 1,
  }) {
    return TextDecorator(
      text: text,
      painter: style.getPainter(text, color, strokeWidth),
    );
  }

  /// Creates a `TextDecorator` that draws an underline beneath the [text].
  ///
  /// Parameters:
  /// - `text`: The [Text] widget to be decorated.
  /// - `style`: The [UnderlineStyle] to apply
  ///   Defaults to [UnderlineStyle.horizontal].
  /// - `color`: The [Color] of the underline. Defaults to [Colors.black].
  /// - `strokeWidth`: The thickness of the underline. Defaults to `1.0`.
  ///
  /// Example Usage:
  /// ```dart
  /// TextDecorator.underlined(
  ///   text: Text("Underlined Text", style: TextStyle(fontSize: 20)),
  ///   style: UnderlineStyle.wavy,
  ///   color: Colors.red,
  ///   strokeWidth: 2.0,
  /// )
  /// ```
  ///
  factory TextDecorator.underlined({
    required Text text,
    UnderlineStyle style = UnderlineStyle.horizontal,
    Color color = Colors.black,
    double strokeWidth = 1,
  }) {
    return TextDecorator(
      text: text,
      painter: style.getPainter(text, color, strokeWidth),
    );
  }

  /// Creates a `TextDecorator` that draws a box-style decoration around the [text].
  ///
  /// Parameters:
  /// - `text`: The [Text] widget to be decorated.
  /// - `style`: The [BoxStyle] to apply (e.g., `rounded`, `bubble`, `curled`).
  ///   Defaults to [BoxStyle.bubble].
  /// - `borderRadius`: The radius for the corners of the box. This is primarily
  ///   used by [BoxStyle.rounded] and might influence other styles like [BoxStyle.bubble].
  ///   Defaults to `1.0`.
  /// - `strokeWidth`: The thickness of the box outline. Defaults to `1.0`.
  /// - `color`: The [Color] of the box outline. If `null`, a style-specific default
  ///   color will be used (e.g., [Colors.orange] for [BoxStyle.bubble]).
  ///
  /// Example Usage:
  /// ```dart
  /// TextDecorator.boxed(
  ///   text: Text("Rounded Box", style: TextStyle(fontSize: 20)),
  ///   style: BoxStyle.rounded,
  ///   borderRadius: 10.0,
  ///   strokeWidth: 2.0,
  ///   color: Colors.blueAccent,
  /// )
  /// ```
  factory TextDecorator.boxed({
    required Text text,
    BoxStyle style = BoxStyle.bubble,
    double borderRadius = 1,
    double strokeWidth = 1,
    EdgeInsets padding = const EdgeInsets.all(8),
    Color? color,
  }) {
    return TextDecorator(
      text: text,
      painter: style.getPainter(text, borderRadius, strokeWidth, padding, color: color),
    );
  }

  /// Creates a `TextDecorator` that applies a highlight effect to the [text].
  ///
  /// Parameters:
  /// - `text`: The [Text] widget to be decorated.
  /// - `style`: The [HighlightStyle] to apply (e.g., `marker`).
  ///   Defaults to [HighlightStyle.marker].
  /// - `color`: The [Color] of the highlight. If `null`, the painter might
  ///   use a default color (e.g., `HighlightStyle.marker` defaults to `Colors.yellow.withOpacity(0.5)`).
  /// - `strokeWidth`: The thickness or extent of the highlight. If `null`,
  ///   the painter might use a default value.
  ///
  /// Example Usage:
  /// ```dart
  /// TextDecorator.highlighted(
  ///   text: Text("Highlighted Text", style: TextStyle(fontSize: 20, color: Colors.black)),
  ///   style: HighlightStyle.marker,
  ///   color: Colors.yellow.withOpacity(0.7),
  /// )
  /// ```
  factory TextDecorator.highlighted({
    required Text text,
    HighlightStyle style = HighlightStyle.marker,
    Color? color,
    double? strokeWidth,
  }) {
    return TextDecorator(text: text, painter: style.getPainter(text, color, strokeWidth));
  }
  final Text text;
  final CustomPainter painter;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: painter,
      child: text,
    );
  }
}
