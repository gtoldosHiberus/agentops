import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';
import 'package:agentops_app/features/agentops_console/1_domain/repositories/workspace_repository.dart';
import 'package:agentops_app/features/agentops_console/1_domain/usecases/create_workspace_usecase.dart';

class MockWorkspaceRepository extends Mock implements WorkspaceRepository {}

void main() {
  group('CreateWorkspaceUsecase', () {
    late MockWorkspaceRepository mockRepository;
    late CreateWorkspaceUsecase usecase;

    setUp(() {
      mockRepository = MockWorkspaceRepository();
      usecase = CreateWorkspaceUsecase(mockRepository);
    });

    test('creates workspace successfully with valid inputs', () async {
      // Arrange
      final now = DateTime.now();
      final workspace = Workspace(
        id: 'ws-1',
        name: 'Test Workspace',
        description: 'A test workspace',
        createdAt: now,
        updatedAt: now,
      );

      when(
        () => mockRepository.createWorkspace(
          name: 'Test Workspace',
          description: 'A test workspace',
        ),
      ).thenAnswer((_) async => workspace);

      // Act
      final result = await usecase.execute(
        name: 'Test Workspace',
        description: 'A test workspace',
      );

      // Assert
      expect(result, isA<CreateWorkspaceSuccess>());
      expect((result as CreateWorkspaceSuccess).workspace.id, 'ws-1');
      expect((result).workspace.name, 'Test Workspace');
      verify(
        () => mockRepository.createWorkspace(
          name: 'Test Workspace',
          description: 'A test workspace',
        ),
      ).called(1);
    });

    test('fails when name is empty', () async {
      // Act
      final result = await usecase.execute(
        name: '',
        description: 'A test workspace',
      );

      // Assert
      expect(result, isA<CreateWorkspaceFailed>());
      expect((result as CreateWorkspaceFailed).message,
          contains('name cannot be empty'));
      verifyNever(() => mockRepository.createWorkspace(
            name: any(named: 'name'),
            description: any(named: 'description'),
          ));
    });

    test('fails when description is empty', () async {
      // Act
      final result = await usecase.execute(
        name: 'Test Workspace',
        description: '',
      );

      // Assert
      expect(result, isA<CreateWorkspaceFailed>());
      expect((result as CreateWorkspaceFailed).message,
          contains('description cannot be empty'));
      verifyNever(() => mockRepository.createWorkspace(
            name: any(named: 'name'),
            description: any(named: 'description'),
          ));
    });

    test('handles repository errors gracefully', () async {
      // Arrange
      when(
        () => mockRepository.createWorkspace(
          name: any(named: 'name'),
          description: any(named: 'description'),
        ),
      ).thenThrow(Exception('Database error'));

      // Act
      final result = await usecase.execute(
        name: 'Test Workspace',
        description: 'A test workspace',
      );

      // Assert
      expect(result, isA<CreateWorkspaceFailed>());
      expect((result as CreateWorkspaceFailed).message,
          contains('Failed to create workspace'));
    });
  });
}
