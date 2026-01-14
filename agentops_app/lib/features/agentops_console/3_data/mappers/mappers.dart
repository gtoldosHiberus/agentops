import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';

/// Mapper para convertir entre DTOs y Entidades de Workspace
class WorkspaceMapper {
  /// Mapea un Map JSON a Workspace (usado por APIs)
  static Workspace fromJson(Map<String, dynamic> json) {
    return Workspace.fromJson(json);
  }

  /// Mapea una Workspace a JSON para enviar a APIs
  static Map<String, dynamic> toJson(Workspace workspace) {
    return workspace.toJson();
  }

  /// Copia una Workspace con actualizaciones (para operaciones locales)
  static Workspace updateWorkspace(
    Workspace workspace, {
    String? name,
    String? description,
  }) {
    return workspace.copyWith(
      name: name ?? workspace.name,
      description: description ?? workspace.description,
      updatedAt: DateTime.now(),
    );
  }
}

/// Mapper para convertir entre DTOs y Entidades de Agent
class AgentMapper {
  static Agent fromJson(Map<String, dynamic> json) {
    return Agent.fromJson(json);
  }

  static Map<String, dynamic> toJson(Agent agent) {
    return agent.toJson();
  }

  static Agent updateAgent(
    Agent agent, {
    String? name,
    String? description,
    List<String>? enabledTools,
    Map<String, dynamic>? guardrails,
    bool? supportsGenUI,
  }) {
    return agent.copyWith(
      name: name ?? agent.name,
      description: description ?? agent.description,
      enabledTools: enabledTools ?? agent.enabledTools,
      guardrails: guardrails ?? agent.guardrails,
      supportsGenUI: supportsGenUI ?? agent.supportsGenUI,
      updatedAt: DateTime.now(),
    );
  }
}

/// Mapper para convertir entre DTOs y Entidades de ContextPack
class ContextPackMapper {
  static ContextPack fromJson(Map<String, dynamic> json) {
    return ContextPack.fromJson(json);
  }

  static Map<String, dynamic> toJson(ContextPack pack) {
    return pack.toJson();
  }

  static ContextPack updateContextPack(
    ContextPack pack, {
    String? name,
    String? description,
    String? version,
    List<String>? tags,
    List<String>? documentIds,
  }) {
    return pack.copyWith(
      name: name ?? pack.name,
      description: description ?? pack.description,
      version: version ?? pack.version,
      tags: tags ?? pack.tags,
      documentIds: documentIds ?? pack.documentIds,
      updatedAt: DateTime.now(),
    );
  }
}

/// Mapper para convertir entre DTOs y Entidades de Run
class RunMapper {
  static Run fromJson(Map<String, dynamic> json) {
    return Run.fromJson(json);
  }

  static Map<String, dynamic> toJson(Run run) {
    return run.toJson();
  }

  static Run updateRunStatus(
    Run run, {
    required String status,
    String? output,
    String? error,
    List<ToolCall>? toolCalls,
    String? outputMode,
    Map<String, dynamic>? genUIOutput,
  }) {
    return run.copyWith(
      status: status,
      output: output ?? run.output,
      error: error ?? run.error,
      toolCalls: toolCalls ?? run.toolCalls,
      outputMode: outputMode ?? run.outputMode,
      genUIOutput: genUIOutput ?? run.genUIOutput,
      completedAt: status == 'success' || status == 'failed' ? DateTime.now() : run.completedAt,
    );
  }
}

/// Mapper para convertir entre DTOs y Entidades de Conversation
class ConversationMapper {
  static Conversation fromJson(Map<String, dynamic> json) {
    return Conversation.fromJson(json);
  }

  static Map<String, dynamic> toJson(Conversation conversation) {
    return conversation.toJson();
  }

  static Conversation addMessage(Conversation conversation, Message message) {
    return conversation.copyWith(
      messages: [...conversation.messages, message],
      updatedAt: DateTime.now(),
    );
  }
}
