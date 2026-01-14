// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Workspace _$WorkspaceFromJson(Map<String, dynamic> json) {
  return _Workspace.fromJson(json);
}

/// @nodoc
mixin _$Workspace {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get agentIds => throw _privateConstructorUsedError;
  List<String> get contextPackIds => throw _privateConstructorUsedError;
  List<String> get conversationIds => throw _privateConstructorUsedError;
  List<String> get runIds => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Workspace to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkspaceCopyWith<Workspace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceCopyWith<$Res> {
  factory $WorkspaceCopyWith(Workspace value, $Res Function(Workspace) then) =
      _$WorkspaceCopyWithImpl<$Res, Workspace>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    List<String> agentIds,
    List<String> contextPackIds,
    List<String> conversationIds,
    List<String> runIds,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$WorkspaceCopyWithImpl<$Res, $Val extends Workspace>
    implements $WorkspaceCopyWith<$Res> {
  _$WorkspaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? agentIds = null,
    Object? contextPackIds = null,
    Object? conversationIds = null,
    Object? runIds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            agentIds: null == agentIds
                ? _value.agentIds
                : agentIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            contextPackIds: null == contextPackIds
                ? _value.contextPackIds
                : contextPackIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            conversationIds: null == conversationIds
                ? _value.conversationIds
                : conversationIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            runIds: null == runIds
                ? _value.runIds
                : runIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkspaceImplCopyWith<$Res>
    implements $WorkspaceCopyWith<$Res> {
  factory _$$WorkspaceImplCopyWith(
    _$WorkspaceImpl value,
    $Res Function(_$WorkspaceImpl) then,
  ) = __$$WorkspaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    List<String> agentIds,
    List<String> contextPackIds,
    List<String> conversationIds,
    List<String> runIds,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$WorkspaceImplCopyWithImpl<$Res>
    extends _$WorkspaceCopyWithImpl<$Res, _$WorkspaceImpl>
    implements _$$WorkspaceImplCopyWith<$Res> {
  __$$WorkspaceImplCopyWithImpl(
    _$WorkspaceImpl _value,
    $Res Function(_$WorkspaceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? agentIds = null,
    Object? contextPackIds = null,
    Object? conversationIds = null,
    Object? runIds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$WorkspaceImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        agentIds: null == agentIds
            ? _value._agentIds
            : agentIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        contextPackIds: null == contextPackIds
            ? _value._contextPackIds
            : contextPackIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        conversationIds: null == conversationIds
            ? _value._conversationIds
            : conversationIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        runIds: null == runIds
            ? _value._runIds
            : runIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkspaceImpl implements _Workspace {
  const _$WorkspaceImpl({
    required this.id,
    required this.name,
    required this.description,
    final List<String> agentIds = const [],
    final List<String> contextPackIds = const [],
    final List<String> conversationIds = const [],
    final List<String> runIds = const [],
    required this.createdAt,
    required this.updatedAt,
  }) : _agentIds = agentIds,
       _contextPackIds = contextPackIds,
       _conversationIds = conversationIds,
       _runIds = runIds;

  factory _$WorkspaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkspaceImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  final List<String> _agentIds;
  @override
  @JsonKey()
  List<String> get agentIds {
    if (_agentIds is EqualUnmodifiableListView) return _agentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_agentIds);
  }

  final List<String> _contextPackIds;
  @override
  @JsonKey()
  List<String> get contextPackIds {
    if (_contextPackIds is EqualUnmodifiableListView) return _contextPackIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contextPackIds);
  }

  final List<String> _conversationIds;
  @override
  @JsonKey()
  List<String> get conversationIds {
    if (_conversationIds is EqualUnmodifiableListView) return _conversationIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversationIds);
  }

  final List<String> _runIds;
  @override
  @JsonKey()
  List<String> get runIds {
    if (_runIds is EqualUnmodifiableListView) return _runIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_runIds);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Workspace(id: $id, name: $name, description: $description, agentIds: $agentIds, contextPackIds: $contextPackIds, conversationIds: $conversationIds, runIds: $runIds, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkspaceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._agentIds, _agentIds) &&
            const DeepCollectionEquality().equals(
              other._contextPackIds,
              _contextPackIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._conversationIds,
              _conversationIds,
            ) &&
            const DeepCollectionEquality().equals(other._runIds, _runIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    const DeepCollectionEquality().hash(_agentIds),
    const DeepCollectionEquality().hash(_contextPackIds),
    const DeepCollectionEquality().hash(_conversationIds),
    const DeepCollectionEquality().hash(_runIds),
    createdAt,
    updatedAt,
  );

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkspaceImplCopyWith<_$WorkspaceImpl> get copyWith =>
      __$$WorkspaceImplCopyWithImpl<_$WorkspaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkspaceImplToJson(this);
  }
}

abstract class _Workspace implements Workspace {
  const factory _Workspace({
    required final String id,
    required final String name,
    required final String description,
    final List<String> agentIds,
    final List<String> contextPackIds,
    final List<String> conversationIds,
    final List<String> runIds,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$WorkspaceImpl;

  factory _Workspace.fromJson(Map<String, dynamic> json) =
      _$WorkspaceImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  List<String> get agentIds;
  @override
  List<String> get contextPackIds;
  @override
  List<String> get conversationIds;
  @override
  List<String> get runIds;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkspaceImplCopyWith<_$WorkspaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
