import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent.freezed.dart';
part 'agent.g.dart';

/// Agent: Provider config, tools, rules, guardrails, and UI affordances.
@freezed
class Agent with _$Agent {
  const factory Agent({
    required String id,
    required String name,
    required String description,
    required String provider, // 'gemini', 'firebase_ai_logic', 'custom_server'
    required String model, // e.g., 'gemini-2.0-flash'
    String? apiKey, // Optional for provider-specific auth
    @Default([]) List<String> enabledTools,
    @Default({}) Map<String, dynamic> guardrails, // e.g., {'max_retries': 3, 'timeout_seconds': 30}
    @Default(false) bool supportsGenUI,
    @Default({}) Map<String, dynamic> metadata, // Custom metadata
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Agent;

  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);
}
