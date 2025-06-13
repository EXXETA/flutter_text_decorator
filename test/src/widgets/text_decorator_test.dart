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
        tags: ['golden'],
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
        tags: ['golden'],
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
        tags: ['golden'],
      );
    });
  });
}
