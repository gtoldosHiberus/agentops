import 'package:flutter_test/flutter_test.dart';
import 'package:agentops_app/features/agentops_console/3_data/repositories/workspace_repository_impl.dart';

void main() {
  group('WorkspaceRepositoryImpl', () {
    late WorkspaceRepositoryImpl repository;

    setUp(() {
      repository = WorkspaceRepositoryImpl();
    });

    test('creates and retrieves workspace', () async {
      // Act
      final workspace = await repository.createWorkspace(
        name: 'Test Workspace',
        description: 'A test workspace',
      );

      // Assert
      expect(workspace.id, isNotEmpty);
      expect(workspace.name, 'Test Workspace');
      expect(workspace.description, 'A test workspace');
      expect(workspace.agentIds, isEmpty);
    });

    test('fetches all workspaces', () async {
      // Arrange
      await repository.createWorkspace(
        name: 'Workspace 1',
        description: 'First',
      );
      await repository.createWorkspace(
        name: 'Workspace 2',
        description: 'Second',
      );

      // Act
      final workspaces = await repository.fetchWorkspaces();

      // Assert
      expect(workspaces.length, 2);
      expect(workspaces[0].name, 'Workspace 1');
      expect(workspaces[1].name, 'Workspace 2');
    });

    test('fetches workspace by ID', () async {
      // Arrange
      final created = await repository.createWorkspace(
        name: 'Test',
        description: 'Test workspace',
      );

      // Act
      final fetched = await repository.fetchWorkspaceById(created.id);

      // Assert
      expect(fetched, isNotNull);
      expect(fetched?.id, created.id);
      expect(fetched?.name, 'Test');
    });

    test('returns null for non-existent workspace', () async {
      // Act
      final fetched = await repository.fetchWorkspaceById('non-existent');

      // Assert
      expect(fetched, isNull);
    });

    test('updates workspace', () async {
      // Arrange
      final workspace = await repository.createWorkspace(
        name: 'Original',
        description: 'Original description',
      );

      // Act
      final updated = workspace.copyWith(name: 'Updated');
      final result = await repository.updateWorkspace(updated);

      // Assert
      expect(result.name, 'Updated');
      expect(result.description, 'Original description');
    });

    test('deletes workspace', () async {
      // Arrange
      final workspace = await repository.createWorkspace(
        name: 'To Delete',
        description: 'Will be deleted',
      );

      // Act
      await repository.deleteWorkspace(workspace.id);
      final fetched = await repository.fetchWorkspaceById(workspace.id);

      // Assert
      expect(fetched, isNull);
    });

    test('throws error when deleting non-existent workspace', () async {
      // Act & Assert
      expect(
        () => repository.deleteWorkspace('non-existent'),
        throwsException,
      );
    });
  });
}
