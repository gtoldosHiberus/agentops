import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agentops_app/features/agentops_console/2_presentation/providers/agentops_providers.dart';
import 'package:agentops_app/features/agentops_console/1_domain/domain.dart';
import 'package:agentops_app/features/agentops_console/3_data/data.dart';

void main() {
  group('AgentOps DI Providers', () {
    // Repository Provider Tests
    group('Repository Providers', () {
      test('workspaceRepositoryProvider returns WorkspaceRepository', () {
        final container = ProviderContainer();
        final repo = container.read(workspaceRepositoryProvider);

        expect(repo, isA<WorkspaceRepository>());
        expect(repo, isA<WorkspaceRepositoryImpl>());
      });

      test('agentRepositoryProvider returns AgentRepository', () {
        final container = ProviderContainer();
        final repo = container.read(agentRepositoryProvider);

        expect(repo, isA<AgentRepository>());
        expect(repo, isA<AgentRepositoryImpl>());
      });

      test('contextPackRepositoryProvider returns ContextPackRepository', () {
        final container = ProviderContainer();
        final repo = container.read(contextPackRepositoryProvider);

        expect(repo, isA<ContextPackRepository>());
        expect(repo, isA<ContextPackRepositoryImpl>());
      });

      test('runRepositoryProvider returns RunRepository', () {
        final container = ProviderContainer();
        final repo = container.read(runRepositoryProvider);

        expect(repo, isA<RunRepository>());
        expect(repo, isA<RunRepositoryImpl>());
      });
    });

    // Usecase Provider Tests
    group('Usecase Providers', () {
      test('createWorkspaceUsecaseProvider returns CreateWorkspaceUsecase', () {
        final container = ProviderContainer();
        final usecase = container.read(createWorkspaceUsecaseProvider);

        expect(usecase, isA<CreateWorkspaceUsecase>());
      });

      test('fetchAgentsUsecaseProvider returns FetchAgentsUsecase', () {
        final container = ProviderContainer();
        final usecase = container.read(fetchAgentsUsecaseProvider);

        expect(usecase, isA<FetchAgentsUsecase>());
      });

      test('createAgentUsecaseProvider returns CreateAgentUsecase', () {
        final container = ProviderContainer();
        final usecase = container.read(createAgentUsecaseProvider);

        expect(usecase, isA<CreateAgentUsecase>());
      });

      test('startRunUsecaseProvider returns StartRunUsecase', () {
        final container = ProviderContainer();
        final usecase = container.read(startRunUsecaseProvider);

        expect(usecase, isA<StartRunUsecase>());
      });

      test('fetchRunHistoryUsecaseProvider returns FetchRunHistoryUsecase', () {
        final container = ProviderContainer();
        final usecase = container.read(fetchRunHistoryUsecaseProvider);

        expect(usecase, isA<FetchRunHistoryUsecase>());
      });
    });

    // Dependency Chain Tests
    group('Dependency Chain Verification', () {
      test('CreateWorkspaceUsecase has access to repository', () async {
        final container = ProviderContainer();
        final usecase = container.read(createWorkspaceUsecaseProvider);

        final result = await usecase.execute(
          name: 'Test Workspace',
          description: 'Test description',
        );

        expect(result, isA<CreateWorkspaceSuccess>());
      });

      test('FetchAgentsUsecase has access to repository', () async {
        final container = ProviderContainer();
        
        // First create an agent
        final createUsecase = container.read(createAgentUsecaseProvider);
        await createUsecase.execute(
          name: 'Test Agent',
          description: 'Test',
          provider: 'gemini',
          model: 'gemini-2.0-flash',
        );

        // Then fetch agents
        final fetchUsecase = container.read(fetchAgentsUsecaseProvider);
        final result = await fetchUsecase.execute();

        expect(result, isA<FetchAgentsSuccess>());
        expect((result as FetchAgentsSuccess).agents.length, 1);
      });

      test('StartRunUsecase has access to repository', () async {
        final container = ProviderContainer();
        final usecase = container.read(startRunUsecaseProvider);

        final result = await usecase.execute(
          workspaceId: 'ws-1',
          agentId: 'agent-1',
          prompt: 'Test prompt',
        );

        expect(result, isA<StartRunSuccess>());
      });
    });

    // Provider Isolation Tests
    group('Provider Isolation', () {
      test('Provider instances are cached within the same container', () {
        final container = ProviderContainer();
        final repo1 = container.read(workspaceRepositoryProvider);
        final repo2 = container.read(workspaceRepositoryProvider);

        // Riverpod caches Provider instances within the same container
        expect(identical(repo1, repo2), true);
      });

      test('Different containers create different instances', () {
        final container1 = ProviderContainer();
        final container2 = ProviderContainer();
        
        final repo1 = container1.read(workspaceRepositoryProvider);
        final repo2 = container2.read(workspaceRepositoryProvider);

        // Different containers have independent instances
        expect(identical(repo1, repo2), false);
      });

      test('Multiple usecases can share the same repository', () async {
        final container = ProviderContainer();
        
        // Create workspace
        final createWsUsecase = container.read(createWorkspaceUsecaseProvider);
        final wsResult = await createWsUsecase.execute(
          name: 'Shared Workspace',
          description: 'For testing',
        );
        final workspace = (wsResult as CreateWorkspaceSuccess).workspace;

        // The workspace repository could be reused by other usecases
        final repo = container.read(workspaceRepositoryProvider);
        final fetched = await repo.fetchWorkspaceById(workspace.id);

        expect(fetched?.id, workspace.id);
      });
    });

    // Integration Tests
    group('Full Integration', () {
      test('Complete workflow: create workspace -> create agent -> start run', () async {
        final container = ProviderContainer();

        // Step 1: Create workspace
        final createWsUsecase = container.read(createWorkspaceUsecaseProvider);
        final wsResult = await createWsUsecase.execute(
          name: 'Integration Test Workspace',
          description: 'For full workflow testing',
        );
        expect(wsResult, isA<CreateWorkspaceSuccess>());
        final workspace = (wsResult as CreateWorkspaceSuccess).workspace;

        // Step 2: Create agent
        final createAgentUsecase = container.read(createAgentUsecaseProvider);
        final agentResult = await createAgentUsecase.execute(
          name: 'Test Agent',
          description: 'For workflow',
          provider: 'gemini',
          model: 'gemini-2.0-flash',
        );
        expect(agentResult, isA<CreateAgentSuccess>());
        final agent = (agentResult as CreateAgentSuccess).agent;

        // Step 3: Start run
        final startRunUsecase = container.read(startRunUsecaseProvider);
        final runResult = await startRunUsecase.execute(
          workspaceId: workspace.id,
          agentId: agent.id,
          prompt: 'Test prompt for integration',
        );
        expect(runResult, isA<StartRunSuccess>());
        final run = (runResult as StartRunSuccess).run;

        // Verify everything is wired correctly
        expect(workspace.id, isNotEmpty);
        expect(agent.id, isNotEmpty);
        expect(run.id, isNotEmpty);
        expect(run.workspaceId, workspace.id);
        expect(run.agentId, agent.id);
      });
    });
  });
}
