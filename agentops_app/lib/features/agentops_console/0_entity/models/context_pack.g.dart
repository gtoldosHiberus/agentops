// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_pack.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContextPackImpl _$$ContextPackImplFromJson(Map<String, dynamic> json) =>
    _$ContextPackImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      version: json['version'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      documentIds:
          (json['documentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ContextPackImplToJson(_$ContextPackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'version': instance.version,
      'tags': instance.tags,
      'documentIds': instance.documentIds,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
