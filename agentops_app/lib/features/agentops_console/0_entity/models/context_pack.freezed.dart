// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'context_pack.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ContextPack _$ContextPackFromJson(Map<String, dynamic> json) {
  return _ContextPack.fromJson(json);
}

/// @nodoc
mixin _$ContextPack {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  List<String> get tags =>
      throw _privateConstructorUsedError; // e.g., ['architecture', 'api-contracts', 'release-process']
  List<String> get documentIds =>
      throw _privateConstructorUsedError; // References to docs in the pack
  Map<String, dynamic> get metadata =>
      throw _privateConstructorUsedError; // e.g., {'owner': 'team-x', 'status': 'approved'}
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ContextPack to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContextPack
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContextPackCopyWith<ContextPack> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextPackCopyWith<$Res> {
  factory $ContextPackCopyWith(
    ContextPack value,
    $Res Function(ContextPack) then,
  ) = _$ContextPackCopyWithImpl<$Res, ContextPack>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String version,
    List<String> tags,
    List<String> documentIds,
    Map<String, dynamic> metadata,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$ContextPackCopyWithImpl<$Res, $Val extends ContextPack>
    implements $ContextPackCopyWith<$Res> {
  _$ContextPackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContextPack
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? version = null,
    Object? tags = null,
    Object? documentIds = null,
    Object? metadata = null,
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
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as String,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            documentIds: null == documentIds
                ? _value.documentIds
                : documentIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
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
abstract class _$$ContextPackImplCopyWith<$Res>
    implements $ContextPackCopyWith<$Res> {
  factory _$$ContextPackImplCopyWith(
    _$ContextPackImpl value,
    $Res Function(_$ContextPackImpl) then,
  ) = __$$ContextPackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String version,
    List<String> tags,
    List<String> documentIds,
    Map<String, dynamic> metadata,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$ContextPackImplCopyWithImpl<$Res>
    extends _$ContextPackCopyWithImpl<$Res, _$ContextPackImpl>
    implements _$$ContextPackImplCopyWith<$Res> {
  __$$ContextPackImplCopyWithImpl(
    _$ContextPackImpl _value,
    $Res Function(_$ContextPackImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContextPack
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? version = null,
    Object? tags = null,
    Object? documentIds = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$ContextPackImpl(
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
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        documentIds: null == documentIds
            ? _value._documentIds
            : documentIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
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
class _$ContextPackImpl implements _ContextPack {
  const _$ContextPackImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.version,
    final List<String> tags = const [],
    final List<String> documentIds = const [],
    final Map<String, dynamic> metadata = const {},
    required this.createdAt,
    required this.updatedAt,
  }) : _tags = tags,
       _documentIds = documentIds,
       _metadata = metadata;

  factory _$ContextPackImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContextPackImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String version;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  // e.g., ['architecture', 'api-contracts', 'release-process']
  final List<String> _documentIds;
  // e.g., ['architecture', 'api-contracts', 'release-process']
  @override
  @JsonKey()
  List<String> get documentIds {
    if (_documentIds is EqualUnmodifiableListView) return _documentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documentIds);
  }

  // References to docs in the pack
  final Map<String, dynamic> _metadata;
  // References to docs in the pack
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  // e.g., {'owner': 'team-x', 'status': 'approved'}
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ContextPack(id: $id, name: $name, description: $description, version: $version, tags: $tags, documentIds: $documentIds, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContextPackImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(
              other._documentIds,
              _documentIds,
            ) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
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
    version,
    const DeepCollectionEquality().hash(_tags),
    const DeepCollectionEquality().hash(_documentIds),
    const DeepCollectionEquality().hash(_metadata),
    createdAt,
    updatedAt,
  );

  /// Create a copy of ContextPack
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContextPackImplCopyWith<_$ContextPackImpl> get copyWith =>
      __$$ContextPackImplCopyWithImpl<_$ContextPackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContextPackImplToJson(this);
  }
}

abstract class _ContextPack implements ContextPack {
  const factory _ContextPack({
    required final String id,
    required final String name,
    required final String description,
    required final String version,
    final List<String> tags,
    final List<String> documentIds,
    final Map<String, dynamic> metadata,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$ContextPackImpl;

  factory _ContextPack.fromJson(Map<String, dynamic> json) =
      _$ContextPackImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get version;
  @override
  List<String> get tags; // e.g., ['architecture', 'api-contracts', 'release-process']
  @override
  List<String> get documentIds; // References to docs in the pack
  @override
  Map<String, dynamic> get metadata; // e.g., {'owner': 'team-x', 'status': 'approved'}
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of ContextPack
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContextPackImplCopyWith<_$ContextPackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
