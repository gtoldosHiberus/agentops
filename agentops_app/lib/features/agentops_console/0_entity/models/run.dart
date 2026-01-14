import 'package:freezed_annotation/freezed_annotation.dart';

part 'run.freezed.dart';
part 'run.g.dart';

/// ToolCall: A function/tool invoked by the agent during a run.
@freezed
class ToolCall with _$ToolCall {
  const factory ToolCall({
    required String id,
    required String toolName,
    required Map<String, dynamic> input,
    String? output,
    String? error,
    required DateTime timestamp,
  }) = _ToolCall;

  factory ToolCall.fromJson(Map<String, dynamic> json) => _$ToolCallFromJson(json);
}

/// Run: A discrete task execution with inputs, outputs, and tool calls.
@freezed
class Run with _$Run {
  const factory Run({
    required String id,
    required String workspaceId,
    required String agentId,
    required String prompt,
    @Default([]) List<String> contextPackIds,
    required String status, // 'pending', 'running', 'success', 'failed', 'cancelled'
    @Default([]) List<ToolCall> toolCalls,
    String? output,
    String? error,
    @Default('text') String outputMode, // 'text' or 'genui'
    @Default({}) Map<String, dynamic> genUIOutput, // GenUI widget tree if available
    @Default({}) Map<String, dynamic> metadata,
    required DateTime createdAt,
    DateTime? completedAt,
  }) = _Run;

  factory Run.fromJson(Map<String, dynamic> json) => _$RunFromJson(json);
}
