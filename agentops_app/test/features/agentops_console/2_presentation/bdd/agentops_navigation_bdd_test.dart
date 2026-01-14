// This file is auto-generated from agentops_navigation.feature
// Do not edit manually. Run `dart run build_runner build` to regenerate.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agentops_app/main.dart';
import '../../../../shared_test_steps/the_app_is_running.dart';
import '../../../../shared_test_steps/i_see_text.dart';
import '../../../../shared_test_steps/i_see_page.dart';

void main() {
  group('''Feature: AgentOps Console Navigation''', () {
    testWidgets(
      '''Scenario: HomePage displays welcome message and navigation buttons''',
      (WidgetTester tester) async {
        // Background: Given the app is running
        await theAppIsRunning(tester);
        
        // Then: I see text "Welcome to AgentOps Console"
        await iSeeTextOnce(tester, 'Welcome to AgentOps Console');
        
        // And: I see text "Agents"
        await iSeeText(tester, 'Agents');
        
        // And: I see text "Context Base"
        await iSeeText(tester, 'Context Base');
        
        // And: I see text "Run Studio"
        await iSeeText(tester, 'Run Studio');
        
        // And: I see text "Run History"
        await iSeeText(tester, 'Run History');
      },
    );

    testWidgets(
      '''Scenario: Navigate to AgentsPage''',
      (WidgetTester tester) async {
        // Background: Given the app is running
        await theAppIsRunning(tester);
        
        // Then: I see the AgentsPage displayed
        // (Validated by navigation buttons being present)
        await iSeePageDisplayed(tester, 'AgentsPage');
      },
    );

    testWidgets(
      '''Scenario: Navigate to ContextBasePage''',
      (WidgetTester tester) async {
        // Background: Given the app is running
        await theAppIsRunning(tester);
        
        // Then: I see the ContextBasePage displayed
        await iSeePageDisplayed(tester, 'ContextBasePage');
      },
    );

    testWidgets(
      '''Scenario: Navigate to RunStudioPage''',
      (WidgetTester tester) async {
        // Background: Given the app is running
        await theAppIsRunning(tester);
        
        // Then: I see the RunStudioPage displayed
        await iSeePageDisplayed(tester, 'RunStudioPage');
      },
    );

    testWidgets(
      '''Scenario: Navigate to RunHistoryPage''',
      (WidgetTester tester) async {
        // Background: Given the app is running
        await theAppIsRunning(tester);
        
        // Then: I see the RunHistoryPage displayed
        await iSeePageDisplayed(tester, 'RunHistoryPage');
      },
    );

    testWidgets(
      '''Scenario: App initializes with GoRouter correctly''',
      (WidgetTester tester) async {
        // When: the app initializes with GoRouter
        await theAppIsRunning(tester);
        
        // Then: HomePage is displayed as the initial route
        await iSeeTextOnce(tester, 'Welcome to AgentOps Console');
        
        // And: the navigation structure is ready
        await iSeePageDisplayed(tester, 'HomePage');
      },
    );
  });
}
