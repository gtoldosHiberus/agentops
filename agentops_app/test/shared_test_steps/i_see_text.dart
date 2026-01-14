import 'package:flutter_test/flutter_test.dart';

Future<void> iSeeText(WidgetTester tester, String text) async {
  await tester.pumpAndSettle();
  expect(find.text(text), findsWidgets);
}

Future<void> iSeeTextOnce(WidgetTester tester, String text) async {
  await tester.pumpAndSettle();
  expect(find.text(text), findsOneWidget);
}
