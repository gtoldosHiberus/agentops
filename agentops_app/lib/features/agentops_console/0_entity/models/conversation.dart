import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

/// Message: A single message in a conversation (user or agent).
@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String role, // 'user' or 'assistant'
    required String content,
    @Default([]) List<Map<String, dynamic>> toolCalls, // Tool calls made by agent
    @Default({}) Map<String, dynamic> metadata,
    required DateTime timestamp,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}

/// Conversation: Ongoing multi-turn interaction with an agent.
@freezed
class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    required String workspaceId,
    required String agentId,
    required String title,
    @Default([]) List<String> contextPackIds,
    @Default([]) List<Message> messages,
    @Default('active') String status, // 'active', 'archived', 'paused'
    @Default({}) Map<String, dynamic> metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}
