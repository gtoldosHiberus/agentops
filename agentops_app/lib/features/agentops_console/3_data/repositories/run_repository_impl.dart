import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';
import 'package:agentops_app/features/agentops_console/1_domain/repositories/run_repository.dart';
import '../mappers/mappers.dart';

/// In-memory implementation of RunRepository for MVP
class RunRepositoryImpl implements RunRepository {
  final Map<String, Run> _runs = {};
  int _nextId = 1;

  @override
  Future<Run> createRun({
    required String workspaceId,
    required String agentId,
    required String prompt,
    List<String>? contextPackIds,
    String? outputMode,
  }) async {
    final id = 'run-${_nextId++}';
    final now = DateTime.now();

    final run = Run(
      id: id,
      workspaceId: workspaceId,
      agentId: agentId,
      prompt: prompt,
      contextPackIds: contextPackIds ?? [],
      status: 'pending',
      outputMode: outputMode ?? 'text',
      createdAt: now,
    );

    _runs[id] = run;
    return run;
  }

  @override
  Future<List<Run>> fetchRuns() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _runs.values.toList();
  }

  @override
  Future<Run?> fetchRunById(String id) async {
    await Future.delayed(const Duration(milliseconds: 50));
    return _runs[id];
  }

  @override
  Future<Run> updateRun(Run run) async {
    if (!_runs.containsKey(run.id)) {
      throw Exception('Run not found');
    }

    _runs[run.id] = run;
    return run;
  }

  @override
  Future<void> deleteRun(String id) async {
    if (!_runs.containsKey(id)) {
      throw Exception('Run not found');
    }

    _runs.remove(id);
  }

  @override
  Future<List<Run>> fetchRunsByWorkspace(String workspaceId) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _runs.values
        .where((run) => run.workspaceId == workspaceId)
        .toList();
  }

  @override
  Future<List<Run>> fetchRunsByAgent(String agentId) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _runs.values
        .where((run) => run.agentId == agentId)
        .toList();
  }

  @override
  Future<List<Run>> fetchRunHistory({
    required String workspaceId,
    int limit = 20,
    int offset = 0,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final filtered = _runs.values
        .where((run) => run.workspaceId == workspaceId)
        .toList();

    // Sort by creation date descending
    filtered.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    // Apply pagination
    final end = (offset + limit).clamp(0, filtered.length);
    return filtered.sublist(offset, end);
  }
}
