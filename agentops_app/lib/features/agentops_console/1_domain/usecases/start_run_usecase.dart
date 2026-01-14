import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';
import 'package:agentops_app/features/agentops_console/1_domain/repositories/run_repository.dart';

/// Result types for StartRunUsecase
sealed class StartRunResult {}

class StartRunSuccess extends StartRunResult {
  final Run run;
  StartRunSuccess(this.run);
}

class StartRunFailed extends StartRunResult {
  final String message;
  StartRunFailed(this.message);
}

/// Usecase: Start a new run with an agent
class StartRunUsecase {
  final RunRepository _repository;

  StartRunUsecase(this._repository);

  Future<StartRunResult> execute({
    required String workspaceId,
    required String agentId,
    required String prompt,
    List<String>? contextPackIds,
    String? outputMode,
  }) async {
    try {
      if (workspaceId.trim().isEmpty) {
        return StartRunFailed('Workspace ID cannot be empty');
      }
      if (agentId.trim().isEmpty) {
        return StartRunFailed('Agent ID cannot be empty');
      }
      if (prompt.trim().isEmpty) {
        return StartRunFailed('Prompt cannot be empty');
      }

      final run = await _repository.createRun(
        workspaceId: workspaceId,
        agentId: agentId,
        prompt: prompt,
        contextPackIds: contextPackIds,
        outputMode: outputMode,
      );

      return StartRunSuccess(run);
    } catch (e) {
      return StartRunFailed('Failed to start run: $e');
    }
  }
}

/// Result types for FetchRunHistoryUsecase
sealed class FetchRunHistoryResult {}

class FetchRunHistorySuccess extends FetchRunHistoryResult {
  final List<Run> runs;
  FetchRunHistorySuccess(this.runs);
}

class FetchRunHistoryFailed extends FetchRunHistoryResult {
  final String message;
  FetchRunHistoryFailed(this.message);
}

/// Usecase: Fetch run history for a workspace
class FetchRunHistoryUsecase {
  final RunRepository _repository;

  FetchRunHistoryUsecase(this._repository);

  Future<FetchRunHistoryResult> execute({
    required String workspaceId,
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      if (workspaceId.trim().isEmpty) {
        return FetchRunHistoryFailed('Workspace ID cannot be empty');
      }

      final runs = await _repository.fetchRunHistory(
        workspaceId: workspaceId,
        limit: limit,
        offset: offset,
      );

      return FetchRunHistorySuccess(runs);
    } catch (e) {
      return FetchRunHistoryFailed('Failed to fetch run history: $e');
    }
  }
}
