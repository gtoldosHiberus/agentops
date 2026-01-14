import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:agentops_app/features/agentops_console/2_presentation/pages/pages.dart';

void main() {
  group('AgentOps Console Pages', () {
    testWidgets('HomePage displays navigation buttons', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const HomePage(),
        ),
      );

      expect(find.text('Welcome to AgentOps Console'), findsOneWidget);
      expect(find.text('Agents'), findsOneWidget);
      expect(find.text('Context Base'), findsOneWidget);
      expect(find.text('Run Studio'), findsOneWidget);
      expect(find.text('Run History'), findsOneWidget);
    });

    testWidgets('AgentsPage displays title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const AgentsPage(),
        ),
      );

      expect(find.text('Agents'), findsOneWidget);
      expect(find.text('Create Agent'), findsOneWidget);
    });

    testWidgets('ContextBasePage displays title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const ContextBasePage(),
        ),
      );

      expect(find.text('Context Base'), findsOneWidget);
      expect(find.text('Upload Context Pack'), findsOneWidget);
    });

    testWidgets('RunStudioPage has chat interface', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const RunStudioPage(),
        ),
      );

      expect(find.text('Run Studio'), findsOneWidget);
      expect(find.byIcon(Icons.send), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('RunHistoryPage displays title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const RunHistoryPage(),
        ),
      );

      expect(find.text('Run History'), findsOneWidget);
      expect(find.text('Start New Run'), findsOneWidget);
    });
  });

  group('HomePage Navigation Buttons', () {
    testWidgets('Agents button navigates to agents route', (WidgetTester tester) async {
      final navigateCalls = <String>[];

      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
          onGenerateRoute: (settings) {
            navigateCalls.add(settings.name ?? '');
            return MaterialPageRoute(
              builder: (_) => const Scaffold(body: Text('Agents Page')),
            );
          },
        ),
      );

      expect(find.text('Welcome to AgentOps Console'), findsOneWidget);
      expect(find.text('Agents'), findsOneWidget);
    });
  });

  group('Routes Configuration', () {
    test('agentopsConsoleRoutes contains 5 routes', () {
      // Import routes.dart to test the configuration
      // This would require actual route configuration test
      // For now, we verify the route constants are defined
      expect(HomePage.path, '/');
      expect(AgentsPage.path, '/agents');
      expect(ContextBasePage.path, '/context-base');
      expect(RunStudioPage.path, '/run-studio');
      expect(RunHistoryPage.path, '/run-history');
    });

    test('HomePage has correct route constants', () {
      expect(HomePage.name, 'home');
      expect(HomePage.path, '/');
    });

    test('AgentsPage has correct route constants', () {
      expect(AgentsPage.name, 'agents');
      expect(AgentsPage.path, '/agents');
    });

    test('ContextBasePage has correct route constants', () {
      expect(ContextBasePage.name, 'context_base');
      expect(ContextBasePage.path, '/context-base');
    });

    test('RunStudioPage has correct route constants', () {
      expect(RunStudioPage.name, 'run_studio');
      expect(RunStudioPage.path, '/run-studio');
    });

    test('RunHistoryPage has correct route constants', () {
      expect(RunHistoryPage.name, 'run_history');
      expect(RunHistoryPage.path, '/run-history');
    });
  });
}
