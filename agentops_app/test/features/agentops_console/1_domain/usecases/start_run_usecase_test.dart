import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';
import 'package:agentops_app/features/agentops_console/1_domain/repositories/run_repository.dart';
import 'package:agentops_app/features/agentops_console/1_domain/usecases/start_run_usecase.dart';

class MockRunRepository extends Mock implements RunRepository {}

void main() {
  group('StartRunUsecase', () {
    late MockRunRepository mockRepository;
    late StartRunUsecase usecase;

    setUp(() {
      mockRepository = MockRunRepository();
      usecase = StartRunUsecase(mockRepository);
    });

    test('starts run successfully with valid inputs', () async {
      // Arrange
      final run = Run(
        id: 'run-1',
        workspaceId: 'ws-1',
        agentId: 'agent-1',
        prompt: 'Test prompt',
        status: 'pending',
        createdAt: DateTime.now(),
      );

      when(
        () => mockRepository.createRun(
          workspaceId: 'ws-1',
          agentId: 'agent-1',
          prompt: 'Test prompt',
          contextPackIds: null,
          outputMode: null,
        ),
      ).thenAnswer((_) async => run);

      // Act
      final result = await usecase.execute(
        workspaceId: 'ws-1',
        agentId: 'agent-1',
        prompt: 'Test prompt',
      );

      // Assert
      expect(result, isA<StartRunSuccess>());
      expect((result as StartRunSuccess).run.id, 'run-1');
      expect((result).run.status, 'pending');
    });

    test('fails when workspaceId is empty', () async {
      // Act
      final result = await usecase.execute(
        workspaceId: '',
        agentId: 'agent-1',
        prompt: 'Test prompt',
      );

      // Assert
      expect(result, isA<StartRunFailed>());
      expect((result as StartRunFailed).message, contains('Workspace ID'));
    });

    test('fails when agentId is empty', () async {
      // Act
      final result = await usecase.execute(
        workspaceId: 'ws-1',
        agentId: '',
        prompt: 'Test prompt',
      );

      // Assert
      expect(result, isA<StartRunFailed>());
      expect((result as StartRunFailed).message, contains('Agent ID'));
    });

    test('fails when prompt is empty', () async {
      // Act
      final result = await usecase.execute(
        workspaceId: 'ws-1',
        agentId: 'agent-1',
        prompt: '',
      );

      // Assert
      expect(result, isA<StartRunFailed>());
      expect((result as StartRunFailed).message, contains('Prompt'));
    });
  });

  group('FetchRunHistoryUsecase', () {
    late MockRunRepository mockRepository;
    late FetchRunHistoryUsecase usecase;

    setUp(() {
      mockRepository = MockRunRepository();
      usecase = FetchRunHistoryUsecase(mockRepository);
    });

    test('fetches run history successfully', () async {
      // Arrange
      final runs = [
        Run(
          id: 'run-1',
          workspaceId: 'ws-1',
          agentId: 'agent-1',
          prompt: 'Test 1',
          status: 'success',
          createdAt: DateTime.now(),
        ),
        Run(
          id: 'run-2',
          workspaceId: 'ws-1',
          agentId: 'agent-1',
          prompt: 'Test 2',
          status: 'success',
          createdAt: DateTime.now(),
        ),
      ];

      when(
        () => mockRepository.fetchRunHistory(
          workspaceId: 'ws-1',
          limit: 20,
          offset: 0,
        ),
      ).thenAnswer((_) async => runs);

      // Act
      final result = await usecase.execute(workspaceId: 'ws-1');

      // Assert
      expect(result, isA<FetchRunHistorySuccess>());
      expect((result as FetchRunHistorySuccess).runs.length, 2);
    });

    test('fails when workspaceId is empty', () async {
      // Act
      final result = await usecase.execute(workspaceId: '');

      // Assert
      expect(result, isA<FetchRunHistoryFailed>());
      expect((result as FetchRunHistoryFailed).message, contains('Workspace ID'));
    });
  });
}
