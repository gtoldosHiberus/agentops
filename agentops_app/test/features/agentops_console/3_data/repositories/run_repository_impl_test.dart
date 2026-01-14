import 'package:flutter_test/flutter_test.dart';
import 'package:agentops_app/features/agentops_console/3_data/repositories/run_repository_impl.dart';

void main() {
  group('RunRepositoryImpl', () {
    late RunRepositoryImpl repository;

    setUp(() {
      repository = RunRepositoryImpl();
    });

    test('creates and retrieves run', () async {
      // Act
      final run = await repository.createRun(
        workspaceId: 'ws-1',
        agentId: 'agent-1',
        prompt: 'Test prompt',
        contextPackIds: ['pack-1'],
      );

      // Assert
      expect(run.id, isNotEmpty);
      expect(run.workspaceId, 'ws-1');
      expect(run.agentId, 'agent-1');
      expect(run.prompt, 'Test prompt');
      expect(run.status, 'pending');
      expect(run.contextPackIds, ['pack-1']);
    });

    test('fetches runs by workspace', () async {
      // Arrange
      await repository.createRun(
        workspaceId: 'ws-1',
        agentId: 'agent-1',
        prompt: 'Run 1',
      );
      await repository.createRun(
        workspaceId: 'ws-1',
        agentId: 'agent-2',
        prompt: 'Run 2',
      );
      await repository.createRun(
        workspaceId: 'ws-2',
        agentId: 'agent-1',
        prompt: 'Run 3',
      );

      // Act
      final runs = await repository.fetchRunsByWorkspace('ws-1');

      // Assert
      expect(runs.length, 2);
      expect(runs.every((r) => r.workspaceId == 'ws-1'), true);
    });

    test('fetches runs by agent', () async {
      // Arrange
      await repository.createRun(
        workspaceId: 'ws-1',
        agentId: 'agent-1',
        prompt: 'Run 1',
      );
      await repository.createRun(
        workspaceId: 'ws-1',
        agentId: 'agent-1',
        prompt: 'Run 2',
      );
      await repository.createRun(
        workspaceId: 'ws-1',
        agentId: 'agent-2',
        prompt: 'Run 3',
      );

      // Act
      final runs = await repository.fetchRunsByAgent('agent-1');

      // Assert
      expect(runs.length, 2);
      expect(runs.every((r) => r.agentId == 'agent-1'), true);
    });

    test('fetches run history with pagination', () async {
      // Arrange
      for (int i = 0; i < 25; i++) {
        await repository.createRun(
          workspaceId: 'ws-1',
          agentId: 'agent-1',
          prompt: 'Run $i',
        );
      }

      // Act
      final page1 = await repository.fetchRunHistory(
        workspaceId: 'ws-1',
        limit: 20,
        offset: 0,
      );
      final page2 = await repository.fetchRunHistory(
        workspaceId: 'ws-1',
        limit: 20,
        offset: 20,
      );

      // Assert
      expect(page1.length, 20);
      expect(page2.length, 5);
    });

    test('updates run status', () async {
      // Arrange
      final run = await repository.createRun(
        workspaceId: 'ws-1',
        agentId: 'agent-1',
        prompt: 'Test',
      );

      // Act
      final updated = run.copyWith(
        status: 'success',
        output: 'Success result',
      );
      final result = await repository.updateRun(updated);

      // Assert
      expect(result.status, 'success');
      expect(result.output, 'Success result');
    });

    test('creates run with GenUI output mode', () async {
      // Act
      final run = await repository.createRun(
        workspaceId: 'ws-1',
        agentId: 'agent-1',
        prompt: 'Generate UI',
        outputMode: 'genui',
      );

      // Assert
      expect(run.outputMode, 'genui');
    });
  });
}
