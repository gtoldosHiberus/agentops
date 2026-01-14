import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';
import 'package:agentops_app/features/agentops_console/1_domain/repositories/agent_repository.dart';
import '../mappers/mappers.dart';

/// In-memory implementation of AgentRepository for MVP
class AgentRepositoryImpl implements AgentRepository {
  final Map<String, Agent> _agents = {};
  int _nextId = 1;

  @override
  Future<Agent> createAgent({
    required String name,
    required String description,
    required String provider,
    required String model,
    String? apiKey,
    List<String>? enabledTools,
    Map<String, dynamic>? guardrails,
    bool? supportsGenUI,
  }) async {
    final id = 'agent-${_nextId++}';
    final now = DateTime.now();

    final agent = Agent(
      id: id,
      name: name,
      description: description,
      provider: provider,
      model: model,
      apiKey: apiKey,
      enabledTools: enabledTools ?? [],
      guardrails: guardrails ?? {},
      supportsGenUI: supportsGenUI ?? false,
      createdAt: now,
      updatedAt: now,
    );

    _agents[id] = agent;
    return agent;
  }

  @override
  Future<List<Agent>> fetchAgents() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _agents.values.toList();
  }

  @override
  Future<Agent?> fetchAgentById(String id) async {
    await Future.delayed(const Duration(milliseconds: 50));
    return _agents[id];
  }

  @override
  Future<Agent> updateAgent(Agent agent) async {
    if (!_agents.containsKey(agent.id)) {
      throw Exception('Agent not found');
    }

    final updated = AgentMapper.updateAgent(
      agent,
      name: agent.name,
      description: agent.description,
    );

    _agents[agent.id] = updated;
    return updated;
  }

  @override
  Future<void> deleteAgent(String id) async {
    if (!_agents.containsKey(id)) {
      throw Exception('Agent not found');
    }

    _agents.remove(id);
  }

  @override
  Future<List<Agent>> fetchAgentsByWorkspace(String workspaceId) async {
    await Future.delayed(const Duration(milliseconds: 100));
    // For MVP, return all agents (filtering by workspace would be done in data layer)
    return _agents.values.toList();
  }
}
