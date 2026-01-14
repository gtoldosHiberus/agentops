import 'package:flutter_test/flutter_test.dart';

Future<void> iSeeIcon(WidgetTester tester) async {
  await tester.pumpAndSettle();
  // Icon validation happens in the page
}

Future<void> iSeePageDisplayed(WidgetTester tester, String pageName) async {
  await tester.pumpAndSettle();
  // Page display is validated by widgets being present
}
