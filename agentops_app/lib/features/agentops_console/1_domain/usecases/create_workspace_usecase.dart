import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';
import 'package:agentops_app/features/agentops_console/1_domain/repositories/workspace_repository.dart';

/// Result types for CreateWorkspaceUsecase
sealed class CreateWorkspaceResult {}

class CreateWorkspaceSuccess extends CreateWorkspaceResult {
  final Workspace workspace;
  CreateWorkspaceSuccess(this.workspace);
}

class CreateWorkspaceFailed extends CreateWorkspaceResult {
  final String message;
  CreateWorkspaceFailed(this.message);
}

/// Usecase: Create a new workspace
class CreateWorkspaceUsecase {
  final WorkspaceRepository _repository;

  CreateWorkspaceUsecase(this._repository);

  Future<CreateWorkspaceResult> execute({
    required String name,
    required String description,
  }) async {
    try {
      if (name.trim().isEmpty) {
        return CreateWorkspaceFailed('Workspace name cannot be empty');
      }
      if (description.trim().isEmpty) {
        return CreateWorkspaceFailed('Workspace description cannot be empty');
      }

      final workspace = await _repository.createWorkspace(
        name: name,
        description: description,
      );

      return CreateWorkspaceSuccess(workspace);
    } catch (e) {
      return CreateWorkspaceFailed('Failed to create workspace: $e');
    }
  }
}
