import 'package:flutter_test/flutter_test.dart';
import 'package:agentops_app/features/agentops_console/0_entity/models/workspace.dart';
import 'package:agentops_app/features/agentops_console/0_entity/models/agent.dart';
import 'package:agentops_app/features/agentops_console/0_entity/models/context_pack.dart';
import 'package:agentops_app/features/agentops_console/0_entity/models/conversation.dart';
import 'package:agentops_app/features/agentops_console/0_entity/models/run.dart';

void main() {
  group('Workspace Entity', () {
    test('can be created with all fields', () {
      final now = DateTime.now();
      final workspace = Workspace(
        id: 'ws-1',
        name: 'My Workspace',
        description: 'Test workspace',
        agentIds: ['agent-1'],
        contextPackIds: ['pack-1'],
        conversationIds: ['conv-1'],
        runIds: ['run-1'],
        createdAt: now,
        updatedAt: now,
      );

      expect(workspace.id, 'ws-1');
      expect(workspace.name, 'My Workspace');
      expect(workspace.agentIds, ['agent-1']);
    });

    test('supports JSON serialization', () {
      final now = DateTime.now();
      final workspace = Workspace(
        id: 'ws-1',
        name: 'My Workspace',
        description: 'Test workspace',
        createdAt: now,
        updatedAt: now,
      );

      final json = workspace.toJson();
      expect(json['id'], 'ws-1');
      expect(json['name'], 'My Workspace');

      final reconstructed = Workspace.fromJson(json);
      expect(reconstructed.id, workspace.id);
      expect(reconstructed.name, workspace.name);
    });

    test('is immutable (freezed)', () {
      final workspace = Workspace(
        id: 'ws-1',
        name: 'Workspace',
        description: 'Test',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Freezed makes copyWith available
      final modified = workspace.copyWith(name: 'Modified');
      expect(workspace.name, 'Workspace');
      expect(modified.name, 'Modified');
    });
  });

  group('Agent Entity', () {
    test('can be created with provider and model', () {
      final agent = Agent(
        id: 'agent-1',
        name: 'Assistant Bot',
        description: 'A helpful assistant',
        provider: 'gemini',
        model: 'gemini-2.0-flash',
        apiKey: 'sk-xxx',
        enabledTools: ['search', 'calc'],
        supportsGenUI: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(agent.provider, 'gemini');
      expect(agent.model, 'gemini-2.0-flash');
      expect(agent.enabledTools, ['search', 'calc']);
      expect(agent.supportsGenUI, true);
    });

    test('supports guardrails metadata', () {
      final guardrails = {'max_retries': 3, 'timeout_seconds': 30};
      final agent = Agent(
        id: 'agent-1',
        name: 'Agent',
        description: 'Test',
        provider: 'firebase_ai_logic',
        model: 'test-model',
        guardrails: guardrails,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(agent.guardrails['max_retries'], 3);
      expect(agent.guardrails['timeout_seconds'], 30);
    });
  });

  group('ContextPack Entity', () {
    test('can be created with version and tags', () {
      final pack = ContextPack(
        id: 'pack-1',
        name: 'Architecture Docs',
        description: 'System architecture documentation',
        version: '1.0.0',
        tags: ['architecture', 'design'],
        documentIds: ['doc-1', 'doc-2'],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(pack.version, '1.0.0');
      expect(pack.tags, ['architecture', 'design']);
      expect(pack.documentIds.length, 2);
    });
  });

  group('Conversation Entity', () {
    test('can be created with messages', () {
      final message = Message(
        id: 'msg-1',
        role: 'user',
        content: 'Hello',
        timestamp: DateTime.now(),
      );

      final conversation = Conversation(
        id: 'conv-1',
        workspaceId: 'ws-1',
        agentId: 'agent-1',
        title: 'Chat about architecture',
        contextPackIds: ['pack-1'],
        messages: [message],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(conversation.messages.length, 1);
      expect(conversation.messages[0].content, 'Hello');
    });

    test('tracks message roles correctly', () {
      final userMsg = Message(
        id: 'msg-1',
        role: 'user',
        content: 'What is this?',
        timestamp: DateTime.now(),
      );

      final assistantMsg = Message(
        id: 'msg-2',
        role: 'assistant',
        content: 'This is...',
        timestamp: DateTime.now(),
      );

      expect(userMsg.role, 'user');
      expect(assistantMsg.role, 'assistant');
    });
  });

  group('Run Entity', () {
    test('can be created with tool calls', () {
      final toolCall = ToolCall(
        id: 'tc-1',
        toolName: 'search',
        input: {'query': 'flutter'},
        output: 'Results...',
        timestamp: DateTime.now(),
      );

      final run = Run(
        id: 'run-1',
        workspaceId: 'ws-1',
        agentId: 'agent-1',
        prompt: 'Search for flutter info',
        status: 'success',
        toolCalls: [toolCall],
        output: 'Found flutter info',
        createdAt: DateTime.now(),
      );

      expect(run.toolCalls.length, 1);
      expect(run.toolCalls[0].toolName, 'search');
      expect(run.status, 'success');
    });

    test('supports GenUI output mode', () {
      final genUIOutput = {
        'widget': 'Card',
        'title': 'Results',
        'items': ['item1', 'item2']
      };

      final run = Run(
        id: 'run-1',
        workspaceId: 'ws-1',
        agentId: 'agent-1',
        prompt: 'Generate UI',
        status: 'success',
        outputMode: 'genui',
        genUIOutput: genUIOutput,
        createdAt: DateTime.now(),
      );

      expect(run.outputMode, 'genui');
      expect(run.genUIOutput['widget'], 'Card');
    });

    test('tracks run status transitions', () {
      final run = Run(
        id: 'run-1',
        workspaceId: 'ws-1',
        agentId: 'agent-1',
        prompt: 'Test',
        status: 'pending',
        createdAt: DateTime.now(),
      );

      expect(run.status, 'pending');

      // Simulate status change via copyWith
      final running = run.copyWith(status: 'running');
      final completed = running.copyWith(
        status: 'success',
        output: 'Done',
        completedAt: DateTime.now(),
      );

      expect(completed.status, 'success');
      expect(completed.completedAt, isNotNull);
    });
  });
}
