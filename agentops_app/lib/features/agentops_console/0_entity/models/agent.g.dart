// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentImpl _$$AgentImplFromJson(Map<String, dynamic> json) => _$AgentImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  provider: json['provider'] as String,
  model: json['model'] as String,
  apiKey: json['apiKey'] as String?,
  enabledTools:
      (json['enabledTools'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  guardrails: json['guardrails'] as Map<String, dynamic>? ?? const {},
  supportsGenUI: json['supportsGenUI'] as bool? ?? false,
  metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$AgentImplToJson(_$AgentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'provider': instance.provider,
      'model': instance.model,
      'apiKey': instance.apiKey,
      'enabledTools': instance.enabledTools,
      'guardrails': instance.guardrails,
      'supportsGenUI': instance.supportsGenUI,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
