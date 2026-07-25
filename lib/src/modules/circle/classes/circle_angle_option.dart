// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter_text_decorator/src/modules/circle/painter/open_circle_painter.dart';

/// Defines a set of angles for rendering an "open circle" decoration.
///
/// This class encapsulates the start and sweep angles for two arcs
/// (typically one for the bottom part of the circle and one for the top part)
/// that together form an open or stylized circle.
///
/// It provides `const` factories for predefined angle configurations,
/// such as `bottomLeft()` or `topLeft()`, which can be used with
/// [OpenCirclePainter] to specify the orientation of the circle's opening.
/// Instances of this class are immutable.
class CircleAngleOption {
  const CircleAngleOption({
    required this.startAngleBottomCircle,
    required this.sweepAngleBottomCircle,
    required this.startAngleTopCircle,
    required this.sweepAngleTopCircle,
  });

  const factory CircleAngleOption.bottomLeft() = _BottomLeftCircleAngleOption;

  /// The starting angle for the bottom arc, in radians.
  final double startAngleBottomCircle;

  /// The sweep angle for the bottom arc, in radians.
  final double sweepAngleBottomCircle;

  /// The starting angle for the top arc, in radians.
  final double startAngleTopCircle;

  /// The sweep angle for the top arc, in radians.
  final double sweepAngleTopCircle;
}

class _BottomLeftCircleAngleOption extends CircleAngleOption {
  const _BottomLeftCircleAngleOption()
      : super(
          startAngleBottomCircle: -1.5 + pi,
          sweepAngleBottomCircle: pi + 1.5,
          startAngleTopCircle: (pi + 6.2) + pi,
          sweepAngleTopCircle: pi - 1,
        );
}
