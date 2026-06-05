import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_hello_personalized/main.dart';

void main() {
  testWidgets('personalized task counter increments', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1000, 900));
    await tester.pumpWidget(const InnovationHelloApp());

    expect(find.text('姓名：蔡欣宜'), findsOneWidget);
    expect(find.text('学号后四位：0054'), findsOneWidget);
    expect(find.text('今日已完成任务：0 次'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, '完成一次打卡'));
    await tester.pump();

    expect(find.text('今日已完成任务：1 次'), findsOneWidget);
    addTearDown(() => tester.binding.setSurfaceSize(null));
  });
}
