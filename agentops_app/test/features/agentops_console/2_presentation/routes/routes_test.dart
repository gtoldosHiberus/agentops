import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:agentops_app/features/agentops_console/2_presentation/routes/routes.dart';

void main() {
  group('AgentOps Console Routes Configuration', () {
    test('agentopsConsoleRoutes contains all 5 routes', () {
      expect(agentopsConsoleRoutes.length, 5);
    });

    test('Home route is configured', () {
      final homeRoute =
          agentopsConsoleRoutes.firstWhere((r) => r.name == 'home');
      expect(homeRoute.path, '/');
      expect(homeRoute.name, 'home');
    });

    test('Agents route is configured', () {
      final agentsRoute =
          agentopsConsoleRoutes.firstWhere((r) => r.name == 'agents');
      expect(agentsRoute.path, '/agents');
      expect(agentsRoute.name, 'agents');
    });

    test('Context Base route is configured', () {
      final contextRoute = agentopsConsoleRoutes
          .firstWhere((r) => r.name == 'context_base');
      expect(contextRoute.path, '/context-base');
      expect(contextRoute.name, 'context_base');
    });

    test('Run Studio route is configured', () {
      final runStudioRoute =
          agentopsConsoleRoutes.firstWhere((r) => r.name == 'run_studio');
      expect(runStudioRoute.path, '/run-studio');
      expect(runStudioRoute.name, 'run_studio');
    });

    test('Run History route is configured', () {
      final runHistoryRoute =
          agentopsConsoleRoutes.firstWhere((r) => r.name == 'run_history');
      expect(runHistoryRoute.path, '/run-history');
      expect(runHistoryRoute.name, 'run_history');
    });

    test('Each route has a builder', () {
      for (final route in agentopsConsoleRoutes) {
        expect(route.builder, isNotNull);
      }
    });

    test('All routes have unique paths', () {
      final paths = agentopsConsoleRoutes.map((r) => r.path).toList();
      expect(paths.length, paths.toSet().length);
    });

    test('All routes have unique names', () {
      final names = agentopsConsoleRoutes.map((r) => r.name).toList();
      expect(names.length, names.toSet().length);
    });
  });
}

