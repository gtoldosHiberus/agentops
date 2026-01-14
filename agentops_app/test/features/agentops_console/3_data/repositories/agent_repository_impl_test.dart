import 'package:flutter_test/flutter_test.dart';
import 'package:agentops_app/features/agentops_console/3_data/repositories/agent_repository_impl.dart';

void main() {
  group('AgentRepositoryImpl', () {
    late AgentRepositoryImpl repository;

    setUp(() {
      repository = AgentRepositoryImpl();
    });

    test('creates and retrieves agent', () async {
      // Act
      final agent = await repository.createAgent(
        name: 'Test Agent',
        description: 'A test agent',
        provider: 'gemini',
        model: 'gemini-2.0-flash',
        enabledTools: ['search', 'calculator'],
      );

      // Assert
      expect(agent.id, isNotEmpty);
      expect(agent.name, 'Test Agent');
      expect(agent.provider, 'gemini');
      expect(agent.model, 'gemini-2.0-flash');
      expect(agent.enabledTools, ['search', 'calculator']);
      expect(agent.supportsGenUI, false);
    });

    test('fetches all agents', () async {
      // Arrange
      await repository.createAgent(
        name: 'Agent 1',
        description: 'First agent',
        provider: 'gemini',
        model: 'gemini-2.0-flash',
      );
      await repository.createAgent(
        name: 'Agent 2',
        description: 'Second agent',
        provider: 'firebase_ai_logic',
        model: 'firebase-model',
      );

      // Act
      final agents = await repository.fetchAgents();

      // Assert
      expect(agents.length, 2);
      expect(agents[0].name, 'Agent 1');
      expect(agents[1].name, 'Agent 2');
    });

    test('fetches agent by ID', () async {
      // Arrange
      final created = await repository.createAgent(
        name: 'Test Agent',
        description: 'Test',
        provider: 'gemini',
        model: 'gemini-2.0-flash',
      );

      // Act
      final fetched = await repository.fetchAgentById(created.id);

      // Assert
      expect(fetched, isNotNull);
      expect(fetched?.id, created.id);
      expect(fetched?.provider, 'gemini');
    });

    test('creates agent with GenUI support', () async {
      // Act
      final agent = await repository.createAgent(
        name: 'GenUI Agent',
        description: 'Supports GenUI',
        provider: 'gemini',
        model: 'gemini-2.0-flash',
        supportsGenUI: true,
      );

      // Assert
      expect(agent.supportsGenUI, true);
    });

    test('creates agent with guardrails', () async {
      // Act
      final guardrails = {
        'max_retries': 3,
        'timeout_seconds': 30,
      };
      final agent = await repository.createAgent(
        name: 'Guarded Agent',
        description: 'With guardrails',
        provider: 'gemini',
        model: 'gemini-2.0-flash',
        guardrails: guardrails,
      );

      // Assert
      expect(agent.guardrails['max_retries'], 3);
      expect(agent.guardrails['timeout_seconds'], 30);
    });

    test('deletes agent', () async {
      // Arrange
      final agent = await repository.createAgent(
        name: 'To Delete',
        description: 'Will be deleted',
        provider: 'gemini',
        model: 'gemini-2.0-flash',
      );

      // Act
      await repository.deleteAgent(agent.id);
      final fetched = await repository.fetchAgentById(agent.id);

      // Assert
      expect(fetched, isNull);
    });
  });
}
