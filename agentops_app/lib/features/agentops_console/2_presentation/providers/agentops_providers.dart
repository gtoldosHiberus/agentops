import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agentops_app/features/agentops_console/1_domain/domain.dart';
import 'package:agentops_app/features/agentops_console/3_data/data.dart';

/// DEPENDENCY INJECTION LAYER
///
/// This file wires concrete implementations (3_data) to abstractions (1_domain).
/// It's the ONLY place in 2_presentation where imports from 3_data are allowed.

// ============================================================================
// REPOSITORY PROVIDERS
// ============================================================================

/// Provider for WorkspaceRepository
/// 
/// Returns the concrete in-memory implementation.
/// In production, this could return an API-based or local storage implementation.
final workspaceRepositoryProvider = Provider<WorkspaceRepository>((ref) {
  return WorkspaceRepositoryImpl();
});

/// Provider for AgentRepository
final agentRepositoryProvider = Provider<AgentRepository>((ref) {
  return AgentRepositoryImpl();
});

/// Provider for ContextPackRepository
final contextPackRepositoryProvider = Provider<ContextPackRepository>((ref) {
  return ContextPackRepositoryImpl();
});

/// Provider for RunRepository
final runRepositoryProvider = Provider<RunRepository>((ref) {
  return RunRepositoryImpl();
});

// ============================================================================
// USECASE PROVIDERS
// ============================================================================

/// Provider for CreateWorkspaceUsecase
/// 
/// Depends on WorkspaceRepository.
/// Controllers and pages depend on this, not directly on repositories.
final createWorkspaceUsecaseProvider = Provider<CreateWorkspaceUsecase>((ref) {
  final repository = ref.read(workspaceRepositoryProvider);
  return CreateWorkspaceUsecase(repository);
});

/// Provider for FetchAgentsUsecase
final fetchAgentsUsecaseProvider = Provider<FetchAgentsUsecase>((ref) {
  final repository = ref.read(agentRepositoryProvider);
  return FetchAgentsUsecase(repository);
});

/// Provider for CreateAgentUsecase
final createAgentUsecaseProvider = Provider<CreateAgentUsecase>((ref) {
  final repository = ref.read(agentRepositoryProvider);
  return CreateAgentUsecase(repository);
});

/// Provider for StartRunUsecase
final startRunUsecaseProvider = Provider<StartRunUsecase>((ref) {
  final repository = ref.read(runRepositoryProvider);
  return StartRunUsecase(repository);
});

/// Provider for FetchRunHistoryUsecase
final fetchRunHistoryUsecaseProvider = Provider<FetchRunHistoryUsecase>((ref) {
  final repository = ref.read(runRepositoryProvider);
  return FetchRunHistoryUsecase(repository);
});
