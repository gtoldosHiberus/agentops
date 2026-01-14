import 'package:freezed_annotation/freezed_annotation.dart';

part 'context_pack.freezed.dart';
part 'context_pack.g.dart';

/// ContextPack: A versioned bundle of docs, snippets, checklists, and knowledge.
@freezed
class ContextPack with _$ContextPack {
  const factory ContextPack({
    required String id,
    required String name,
    required String description,
    required String version,
    @Default([]) List<String> tags, // e.g., ['architecture', 'api-contracts', 'release-process']
    @Default([]) List<String> documentIds, // References to docs in the pack
    @Default({}) Map<String, dynamic> metadata, // e.g., {'owner': 'team-x', 'status': 'approved'}
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ContextPack;

  factory ContextPack.fromJson(Map<String, dynamic> json) =>
      _$ContextPackFromJson(json);
}
