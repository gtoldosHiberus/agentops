import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';
import 'package:agentops_app/features/agentops_console/1_domain/repositories/workspace_repository.dart';
import '../mappers/mappers.dart';

/// In-memory implementation of WorkspaceRepository for MVP
/// Can be replaced with API-based or local storage implementation
class WorkspaceRepositoryImpl implements WorkspaceRepository {
  final Map<String, Workspace> _workspaces = {};
  int _nextId = 1;

  @override
  Future<Workspace> createWorkspace({
    required String name,
    required String description,
  }) async {
    final id = 'ws-${_nextId++}';
    final now = DateTime.now();

    final workspace = Workspace(
      id: id,
      name: name,
      description: description,
      createdAt: now,
      updatedAt: now,
    );

    _workspaces[id] = workspace;
    return workspace;
  }

  @override
  Future<List<Workspace>> fetchWorkspaces() async {
    await Future.delayed(const Duration(milliseconds: 100)); // Simulate async
    return _workspaces.values.toList();
  }

  @override
  Future<Workspace?> fetchWorkspaceById(String id) async {
    await Future.delayed(const Duration(milliseconds: 50));
    return _workspaces[id];
  }

  @override
  Future<Workspace> updateWorkspace(Workspace workspace) async {
    if (!_workspaces.containsKey(workspace.id)) {
      throw Exception('Workspace not found');
    }

    final updated = WorkspaceMapper.updateWorkspace(
      workspace,
      name: workspace.name,
      description: workspace.description,
    );

    _workspaces[workspace.id] = updated;
    return updated;
  }

  @override
  Future<void> deleteWorkspace(String id) async {
    if (!_workspaces.containsKey(id)) {
      throw Exception('Workspace not found');
    }

    _workspaces.remove(id);
  }
}
