import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_text_decorator/flutter_text_decorator.dart';

import '../../test_utils/test_util.dart';

const _text = Text(
  testText,
  style: TextStyle(fontSize: 16),
);
const _stokeWidth = 2.0;

Widget _createCenter(Widget child) => Center(child: Padding(padding: const EdgeInsets.all(32), child: child));

void main() {
  group('TextDecorator tests', () {
    group('Testing TextDecorator.boxed styles', () {
      testWidgets(
        'BoxStyle.bubble renders',
        (tester) async {
          // arrange
          final widget = TextDecorator.boxed(
            text: _text,
            strokeWidth: _stokeWidth,
          );

          // act
          await tester.pumpWidget(createTestApp(_createCenter(widget)));
          await tester.pumpAndSettle();

          // assert
          await expectLater(
            find.byType(Text),
            matchesGoldenFile('text_decorator/box/bubble.default.png'),
          );
        },
      );
      testWidgets(
        'BoxStyle.rounded renders',
        (tester) async {
          // arrange
          final widget = TextDecorator.boxed(
            style: BoxStyle.rounded,
            text: _text,
            strokeWidth: _stokeWidth,
            borderRadius: 2,
          );

          // act
          await tester.pumpWidget(createTestApp(_createCenter(widget)));
          await tester.pumpAndSettle();

          // assert
          await expectLater(
            find.byType(Text),
            matchesGoldenFile('text_decorator/box/rounded.default.png'),
          );
        },
      );

      testWidgets(
        'BoxStyle.curled renders',
        (tester) async {
          // arrange
          final widget = TextDecorator.boxed(
            style: BoxStyle.curled,
            text: _text,
            strokeWidth: _stokeWidth,
          );

          // act
          await tester.pumpWidget(createTestApp(_createCenter(widget)));
          await tester.pumpAndSettle();

          // assert
          await expectLater(
            find.byType(Text),
            matchesGoldenFile('text_decorator/box/curled.default.png'),
          );
        },
      );

      testWidgets(
        'BoxStyle.bubble renders with custom color',
        (tester) async {
          final widget = TextDecorator.boxed(
            text: _text,
            strokeWidth: _stokeWidth,
            color: Colors.purple,
          );

          await tester.pumpWidget(createTestApp(_createCenter(widget)));
          await tester.pumpAndSettle();

          await expectLater(
            find.byType(Text),
            matchesGoldenFile('text_decorator/box/bubble.custom_color.png'),
          );
        },
      );

      testWidgets(
        'BoxStyle.rounded renders with custom color',
        (tester) async {
          final widget = TextDecorator.boxed(
            style: BoxStyle.rounded,
            text: _text,
            strokeWidth: _stokeWidth,
            borderRadius: 2,
            color: Colors.blue,
          );

          await tester.pumpWidget(createTestApp(_createCenter(widget)));
          await tester.pumpAndSettle();

          await expectLater(
            find.byType(Text),
            matchesGoldenFile('text_decorator/box/rounded.custom_color.png'),
          );
        },
      );
    });

    group('Testing TextDecorator.circled styles', () {
      testWidgets(
        'CircleStyle.circled renders with custom color',
        (tester) async {
          final widget = TextDecorator.circled(
            text: _text,
            color: Colors.red,
            strokeWidth: _stokeWidth,
          );

          await tester.pumpWidget(createTestApp(_createCenter(widget)));
          await tester.pumpAndSettle();

          await expectLater(
            find.byType(Text),
            matchesGoldenFile('text_decorator/circle/circled.custom_color.png'),
          );
        },
      );

      testWidgets(
        'CircleStyle.basic renders with custom strokeWidth',
        (tester) async {
          final widget = TextDecorator.circled(
            style: CircleStyle.basic,
            text: _text,
            strokeWidth: _stokeWidth,
          );

          await tester.pumpWidget(createTestApp(_createCenter(widget)));
          await tester.pumpAndSettle();

          await expectLater(
            find.byType(Text),
            matchesGoldenFile('text_decorator/circle/basic.custom_stroke_width.png'),
          );
        },
      );

      testWidgets(
        'CircleStyle.circled renders with custom strokeWidth',
        (tester) async {
          final widget = TextDecorator.circled(
            text: _text,
            strokeWidth: _stokeWidth,
          );

          await tester.pumpWidget(createTestApp(_createCenter(widget)));
          await tester.pumpAndSettle();

          await expectLater(
            find.byType(Text),
            matchesGoldenFile('text_decorator/circle/circled.custom_stroke_width.png'),
          );
        },
      );
    });
  });
  group('Testing TextDecorator.underline styles', () {
    testWidgets(
      ' UnderlineStyle.horizontal renders',
      (tester) async {
        // arrange
        final widget = TextDecorator.underlined(
          text: _text,
          strokeWidth: _stokeWidth,
        );

        // act
        await tester.pumpWidget(createTestApp(_createCenter(widget)));
        await tester.pumpAndSettle();

        // assert
        await expectLater(
          find.byType(Text),
          matchesGoldenFile('text_decorator/underline/underline_horizontal.png'),
        );
      },
    );
    testWidgets(
      ' UnderlineStyle.rounded renders',
      (tester) async {
        // arrange
        final widget = TextDecorator.underlined(
          style: UnderlineStyle.curved,
          text: _text,
          strokeWidth: _stokeWidth,
        );

        // act
        await tester.pumpWidget(createTestApp(_createCenter(widget)));
        await tester.pumpAndSettle();

        // assert
        await expectLater(
          find.byType(Text),
          matchesGoldenFile('text_decorator/underline/underline_curved.png'),
        );
      },
    );
  });
}
