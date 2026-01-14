import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';
import 'package:agentops_app/features/agentops_console/1_domain/repositories/agent_repository.dart';

/// Result types for FetchAgentsUsecase
sealed class FetchAgentsResult {}

class FetchAgentsSuccess extends FetchAgentsResult {
  final List<Agent> agents;
  FetchAgentsSuccess(this.agents);
}

class FetchAgentsFailed extends FetchAgentsResult {
  final String message;
  FetchAgentsFailed(this.message);
}

/// Usecase: Fetch all agents
class FetchAgentsUsecase {
  final AgentRepository _repository;

  FetchAgentsUsecase(this._repository);

  Future<FetchAgentsResult> execute() async {
    try {
      final agents = await _repository.fetchAgents();
      return FetchAgentsSuccess(agents);
    } catch (e) {
      return FetchAgentsFailed('Failed to fetch agents: $e');
    }
  }
}

/// Result types for CreateAgentUsecase
sealed class CreateAgentResult {}

class CreateAgentSuccess extends CreateAgentResult {
  final Agent agent;
  CreateAgentSuccess(this.agent);
}

class CreateAgentFailed extends CreateAgentResult {
  final String message;
  CreateAgentFailed(this.message);
}

/// Usecase: Create a new agent
class CreateAgentUsecase {
  final AgentRepository _repository;

  CreateAgentUsecase(this._repository);

  Future<CreateAgentResult> execute({
    required String name,
    required String description,
    required String provider,
    required String model,
    String? apiKey,
    List<String>? enabledTools,
    Map<String, dynamic>? guardrails,
    bool? supportsGenUI,
  }) async {
    try {
      if (name.trim().isEmpty) {
        return CreateAgentFailed('Agent name cannot be empty');
      }
      if (provider.trim().isEmpty) {
        return CreateAgentFailed('Provider cannot be empty');
      }
      if (model.trim().isEmpty) {
        return CreateAgentFailed('Model cannot be empty');
      }

      final agent = await _repository.createAgent(
        name: name,
        description: description,
        provider: provider,
        model: model,
        apiKey: apiKey,
        enabledTools: enabledTools,
        guardrails: guardrails,
        supportsGenUI: supportsGenUI,
      );

      return CreateAgentSuccess(agent);
    } catch (e) {
      return CreateAgentFailed('Failed to create agent: $e');
    }
  }
}
