import 'package:agentops_app/features/agentops_console/0_entity/entity.dart';
import 'package:agentops_app/features/agentops_console/1_domain/repositories/context_pack_repository.dart';
import '../mappers/mappers.dart';

/// In-memory implementation of ContextPackRepository for MVP
class ContextPackRepositoryImpl implements ContextPackRepository {
  final Map<String, ContextPack> _packs = {};
  int _nextId = 1;

  @override
  Future<ContextPack> createContextPack({
    required String name,
    required String description,
    required String version,
    List<String>? tags,
    List<String>? documentIds,
  }) async {
    final id = 'pack-${_nextId++}';
    final now = DateTime.now();

    final pack = ContextPack(
      id: id,
      name: name,
      description: description,
      version: version,
      tags: tags ?? [],
      documentIds: documentIds ?? [],
      createdAt: now,
      updatedAt: now,
    );

    _packs[id] = pack;
    return pack;
  }

  @override
  Future<List<ContextPack>> fetchContextPacks() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _packs.values.toList();
  }

  @override
  Future<ContextPack?> fetchContextPackById(String id) async {
    await Future.delayed(const Duration(milliseconds: 50));
    return _packs[id];
  }

  @override
  Future<ContextPack> updateContextPack(ContextPack pack) async {
    if (!_packs.containsKey(pack.id)) {
      throw Exception('ContextPack not found');
    }

    final updated = ContextPackMapper.updateContextPack(
      pack,
      name: pack.name,
      description: pack.description,
    );

    _packs[pack.id] = updated;
    return updated;
  }

  @override
  Future<void> deleteContextPack(String id) async {
    if (!_packs.containsKey(id)) {
      throw Exception('ContextPack not found');
    }

    _packs.remove(id);
  }

  @override
  Future<List<ContextPack>> fetchContextPacksByTag(String tag) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _packs.values.where((pack) => pack.tags.contains(tag)).toList();
  }
}
