// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToolCallImpl _$$ToolCallImplFromJson(Map<String, dynamic> json) =>
    _$ToolCallImpl(
      id: json['id'] as String,
      toolName: json['toolName'] as String,
      input: json['input'] as Map<String, dynamic>,
      output: json['output'] as String?,
      error: json['error'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$ToolCallImplToJson(_$ToolCallImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'toolName': instance.toolName,
      'input': instance.input,
      'output': instance.output,
      'error': instance.error,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_$RunImpl _$$RunImplFromJson(Map<String, dynamic> json) => _$RunImpl(
  id: json['id'] as String,
  workspaceId: json['workspaceId'] as String,
  agentId: json['agentId'] as String,
  prompt: json['prompt'] as String,
  contextPackIds:
      (json['contextPackIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  status: json['status'] as String,
  toolCalls:
      (json['toolCalls'] as List<dynamic>?)
          ?.map((e) => ToolCall.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  output: json['output'] as String?,
  error: json['error'] as String?,
  outputMode: json['outputMode'] as String? ?? 'text',
  genUIOutput: json['genUIOutput'] as Map<String, dynamic>? ?? const {},
  metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
  createdAt: DateTime.parse(json['createdAt'] as String),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
);

Map<String, dynamic> _$$RunImplToJson(_$RunImpl instance) => <String, dynamic>{
  'id': instance.id,
  'workspaceId': instance.workspaceId,
  'agentId': instance.agentId,
  'prompt': instance.prompt,
  'contextPackIds': instance.contextPackIds,
  'status': instance.status,
  'toolCalls': instance.toolCalls,
  'output': instance.output,
  'error': instance.error,
  'outputMode': instance.outputMode,
  'genUIOutput': instance.genUIOutput,
  'metadata': instance.metadata,
  'createdAt': instance.createdAt.toIso8601String(),
  'completedAt': instance.completedAt?.toIso8601String(),
};
