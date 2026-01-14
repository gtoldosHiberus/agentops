import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';

/// Abstract repository for ContextPack operations
abstract class ContextPackRepository {
  /// Create a new context pack
  Future<ContextPack> createContextPack({
    required String name,
    required String description,
    required String version,
    List<String>? tags,
    List<String>? documentIds,
  });

  /// Fetch all context packs
  Future<List<ContextPack>> fetchContextPacks();

  /// Fetch a context pack by ID
  Future<ContextPack?> fetchContextPackById(String id);

  /// Update a context pack
  Future<ContextPack> updateContextPack(ContextPack pack);

  /// Delete a context pack
  Future<void> deleteContextPack(String id);

  /// Fetch context packs by tag
  Future<List<ContextPack>> fetchContextPacksByTag(String tag);
}
