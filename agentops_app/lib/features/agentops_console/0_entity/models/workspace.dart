import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace.freezed.dart';
part 'workspace.g.dart';

/// Workspace: A container for agents, context packs, conversations, and run history.
@freezed
class Workspace with _$Workspace {
  const factory Workspace({
    required String id,
    required String name,
    required String description,
    @Default([]) List<String> agentIds,
    @Default([]) List<String> contextPackIds,
    @Default([]) List<String> conversationIds,
    @Default([]) List<String> runIds,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Workspace;

  factory Workspace.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFromJson(json);
}
