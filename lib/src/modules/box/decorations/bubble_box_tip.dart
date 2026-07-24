/// Horizontal position of the bubble tip along the bottom edge.
enum TipPosition {
  /// Places the tip near the left side of the bubble.
  left(0.3),

  /// Places the tip near the right side of the bubble.
  right(0.9),

  /// Places the tip near the horizontal center of the bubble.
  center(0.6);

  const TipPosition(this.percentage);
  final double percentage;
}

/// Direction the bubble tip points towards.
enum TipOrientation {
  /// Tip points towards the left.
  left,

  /// Tip points towards the right.
  right;
}

/// Configuration for the speech bubble tip (triangle) on [BoxStyle.bubble].
class BubbleBoxTip {
  const BubbleBoxTip({
    this.position = TipPosition.left,
    this.orientation = TipOrientation.left,
  });

  /// Horizontal position of the tip along the bottom edge of the bubble.
  final TipPosition position;

  /// Direction the tip points towards.
  final TipOrientation orientation;
}
