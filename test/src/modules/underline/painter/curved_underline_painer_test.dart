import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_text_decorator/src/modules/underline/painter/curved_underline_painter.dart'; // Adjust import path as needed

void main() {
  group('CurvedUnderlinePainter Tests', () {
    testWidgets('renders CustomPaint with CurvedUnderlinePainter for single line text', (WidgetTester tester) async {
      const String testText = 'Hello Curved Underline';
      const TextStyle testTextStyle = TextStyle(fontSize: 24, color: Colors.black);
      const Color underlineColor = Colors.blue;
      const double underlineStrokeWidth = 2.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: CustomPaint(
                painter: CurvedUnderlinePainter(
                  text: testText,
                  color: underlineColor,
                  strokeWidth: underlineStrokeWidth,
                  textStyle: testTextStyle,
                ),
                child: const Text(testText, style: testTextStyle),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(CustomPaint), findsNWidgets(2));
    });
  });
}
