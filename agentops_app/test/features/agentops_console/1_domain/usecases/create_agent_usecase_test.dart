import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';
import 'package:agentops_app/features/agentops_console/1_domain/repositories/agent_repository.dart';
import 'package:agentops_app/features/agentops_console/1_domain/usecases/create_agent_usecase.dart';

class MockAgentRepository extends Mock implements AgentRepository {}

void main() {
  group('CreateAgentUsecase', () {
    late MockAgentRepository mockRepository;
    late CreateAgentUsecase usecase;

    setUp(() {
      mockRepository = MockAgentRepository();
      usecase = CreateAgentUsecase(mockRepository);
    });

    test('creates agent successfully with valid inputs', () async {
      // Arrange
      final now = DateTime.now();
      final agent = Agent(
        id: 'agent-1',
        name: 'Test Agent',
        description: 'A test agent',
        provider: 'gemini',
        model: 'gemini-2.0-flash',
        enabledTools: ['search'],
        createdAt: now,
        updatedAt: now,
      );

      when(
        () => mockRepository.createAgent(
          name: 'Test Agent',
          description: 'A test agent',
          provider: 'gemini',
          model: 'gemini-2.0-flash',
          apiKey: null,
          enabledTools: ['search'],
          guardrails: null,
          supportsGenUI: null,
        ),
      ).thenAnswer((_) async => agent);

      // Act
      final result = await usecase.execute(
        name: 'Test Agent',
        description: 'A test agent',
        provider: 'gemini',
        model: 'gemini-2.0-flash',
        enabledTools: ['search'],
      );

      // Assert
      expect(result, isA<CreateAgentSuccess>());
      expect((result as CreateAgentSuccess).agent.id, 'agent-1');
      expect((result).agent.provider, 'gemini');
    });

    test('fails when name is empty', () async {
      // Act
      final result = await usecase.execute(
        name: '',
        description: 'Test',
        provider: 'gemini',
        model: 'gemini-2.0-flash',
      );

      // Assert
      expect(result, isA<CreateAgentFailed>());
      expect((result as CreateAgentFailed).message, contains('name'));
    });

    test('fails when provider is empty', () async {
      // Act
      final result = await usecase.execute(
        name: 'Test Agent',
        description: 'Test',
        provider: '',
        model: 'gemini-2.0-flash',
      );

      // Assert
      expect(result, isA<CreateAgentFailed>());
      expect((result as CreateAgentFailed).message, contains('Provider'));
    });

    test('fails when model is empty', () async {
      // Act
      final result = await usecase.execute(
        name: 'Test Agent',
        description: 'Test',
        provider: 'gemini',
        model: '',
      );

      // Assert
      expect(result, isA<CreateAgentFailed>());
      expect((result as CreateAgentFailed).message, contains('Model'));
    });
  });
}
