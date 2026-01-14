import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';

/// Abstract repository for Agent operations
abstract class AgentRepository {
  /// Create a new agent
  Future<Agent> createAgent({
    required String name,
    required String description,
    required String provider,
    required String model,
    String? apiKey,
    List<String>? enabledTools,
    Map<String, dynamic>? guardrails,
    bool? supportsGenUI,
  });

  /// Fetch all agents
  Future<List<Agent>> fetchAgents();

  /// Fetch an agent by ID
  Future<Agent?> fetchAgentById(String id);

  /// Update an agent
  Future<Agent> updateAgent(Agent agent);

  /// Delete an agent
  Future<void> deleteAgent(String id);

  /// Fetch agents by workspace
  Future<List<Agent>> fetchAgentsByWorkspace(String workspaceId);
}
