import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';

/// Abstract repository for Run operations
abstract class RunRepository {
  /// Create a new run
  Future<Run> createRun({
    required String workspaceId,
    required String agentId,
    required String prompt,
    List<String>? contextPackIds,
    String? outputMode,
  });

  /// Fetch all runs
  Future<List<Run>> fetchRuns();

  /// Fetch a run by ID
  Future<Run?> fetchRunById(String id);

  /// Update a run (e.g., status, output)
  Future<Run> updateRun(Run run);

  /// Delete a run
  Future<void> deleteRun(String id);

  /// Fetch runs by workspace
  Future<List<Run>> fetchRunsByWorkspace(String workspaceId);

  /// Fetch runs by agent
  Future<List<Run>> fetchRunsByAgent(String agentId);

  /// Fetch run history with pagination
  Future<List<Run>> fetchRunHistory({
    required String workspaceId,
    int limit = 20,
    int offset = 0,
  });
}
