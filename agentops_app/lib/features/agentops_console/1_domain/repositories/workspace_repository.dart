import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';

/// Abstract repository for Workspace operations
abstract class WorkspaceRepository {
  /// Create a new workspace
  Future<Workspace> createWorkspace({
    required String name,
    required String description,
  });

  /// Fetch all workspaces
  Future<List<Workspace>> fetchWorkspaces();

  /// Fetch a workspace by ID
  Future<Workspace?> fetchWorkspaceById(String id);

  /// Update a workspace
  Future<Workspace> updateWorkspace(Workspace workspace);

  /// Delete a workspace
  Future<void> deleteWorkspace(String id);
}
