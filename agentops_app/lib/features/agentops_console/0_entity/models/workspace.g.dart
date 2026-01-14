// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkspaceImpl _$$WorkspaceImplFromJson(
  Map<String, dynamic> json,
) => _$WorkspaceImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  agentIds:
      (json['agentIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  contextPackIds:
      (json['contextPackIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  conversationIds:
      (json['conversationIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  runIds:
      (json['runIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$WorkspaceImplToJson(_$WorkspaceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'agentIds': instance.agentIds,
      'contextPackIds': instance.contextPackIds,
      'conversationIds': instance.conversationIds,
      'runIds': instance.runIds,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
