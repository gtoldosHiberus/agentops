// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Agent _$AgentFromJson(Map<String, dynamic> json) {
  return _Agent.fromJson(json);
}

/// @nodoc
mixin _$Agent {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get provider =>
      throw _privateConstructorUsedError; // 'gemini', 'firebase_ai_logic', 'custom_server'
  String get model =>
      throw _privateConstructorUsedError; // e.g., 'gemini-2.0-flash'
  String? get apiKey =>
      throw _privateConstructorUsedError; // Optional for provider-specific auth
  List<String> get enabledTools => throw _privateConstructorUsedError;
  Map<String, dynamic> get guardrails =>
      throw _privateConstructorUsedError; // e.g., {'max_retries': 3, 'timeout_seconds': 30}
  bool get supportsGenUI => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata =>
      throw _privateConstructorUsedError; // Custom metadata
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Agent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentCopyWith<Agent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentCopyWith<$Res> {
  factory $AgentCopyWith(Agent value, $Res Function(Agent) then) =
      _$AgentCopyWithImpl<$Res, Agent>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String provider,
    String model,
    String? apiKey,
    List<String> enabledTools,
    Map<String, dynamic> guardrails,
    bool supportsGenUI,
    Map<String, dynamic> metadata,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$AgentCopyWithImpl<$Res, $Val extends Agent>
    implements $AgentCopyWith<$Res> {
  _$AgentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? provider = null,
    Object? model = null,
    Object? apiKey = freezed,
    Object? enabledTools = null,
    Object? guardrails = null,
    Object? supportsGenUI = null,
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
            provider: null == provider
                ? _value.provider
                : provider // ignore: cast_nullable_to_non_nullable
                      as String,
            model: null == model
                ? _value.model
                : model // ignore: cast_nullable_to_non_nullable
                      as String,
            apiKey: freezed == apiKey
                ? _value.apiKey
                : apiKey // ignore: cast_nullable_to_non_nullable
                      as String?,
            enabledTools: null == enabledTools
                ? _value.enabledTools
                : enabledTools // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            guardrails: null == guardrails
                ? _value.guardrails
                : guardrails // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            supportsGenUI: null == supportsGenUI
                ? _value.supportsGenUI
                : supportsGenUI // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$AgentImplCopyWith<$Res> implements $AgentCopyWith<$Res> {
  factory _$$AgentImplCopyWith(
    _$AgentImpl value,
    $Res Function(_$AgentImpl) then,
  ) = __$$AgentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String provider,
    String model,
    String? apiKey,
    List<String> enabledTools,
    Map<String, dynamic> guardrails,
    bool supportsGenUI,
    Map<String, dynamic> metadata,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$AgentImplCopyWithImpl<$Res>
    extends _$AgentCopyWithImpl<$Res, _$AgentImpl>
    implements _$$AgentImplCopyWith<$Res> {
  __$$AgentImplCopyWithImpl(
    _$AgentImpl _value,
    $Res Function(_$AgentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? provider = null,
    Object? model = null,
    Object? apiKey = freezed,
    Object? enabledTools = null,
    Object? guardrails = null,
    Object? supportsGenUI = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$AgentImpl(
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
        provider: null == provider
            ? _value.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as String,
        model: null == model
            ? _value.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String,
        apiKey: freezed == apiKey
            ? _value.apiKey
            : apiKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        enabledTools: null == enabledTools
            ? _value._enabledTools
            : enabledTools // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        guardrails: null == guardrails
            ? _value._guardrails
            : guardrails // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        supportsGenUI: null == supportsGenUI
            ? _value.supportsGenUI
            : supportsGenUI // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$AgentImpl implements _Agent {
  const _$AgentImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.provider,
    required this.model,
    this.apiKey,
    final List<String> enabledTools = const [],
    final Map<String, dynamic> guardrails = const {},
    this.supportsGenUI = false,
    final Map<String, dynamic> metadata = const {},
    required this.createdAt,
    required this.updatedAt,
  }) : _enabledTools = enabledTools,
       _guardrails = guardrails,
       _metadata = metadata;

  factory _$AgentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String provider;
  // 'gemini', 'firebase_ai_logic', 'custom_server'
  @override
  final String model;
  // e.g., 'gemini-2.0-flash'
  @override
  final String? apiKey;
  // Optional for provider-specific auth
  final List<String> _enabledTools;
  // Optional for provider-specific auth
  @override
  @JsonKey()
  List<String> get enabledTools {
    if (_enabledTools is EqualUnmodifiableListView) return _enabledTools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enabledTools);
  }

  final Map<String, dynamic> _guardrails;
  @override
  @JsonKey()
  Map<String, dynamic> get guardrails {
    if (_guardrails is EqualUnmodifiableMapView) return _guardrails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_guardrails);
  }

  // e.g., {'max_retries': 3, 'timeout_seconds': 30}
  @override
  @JsonKey()
  final bool supportsGenUI;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  // Custom metadata
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Agent(id: $id, name: $name, description: $description, provider: $provider, model: $model, apiKey: $apiKey, enabledTools: $enabledTools, guardrails: $guardrails, supportsGenUI: $supportsGenUI, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            const DeepCollectionEquality().equals(
              other._enabledTools,
              _enabledTools,
            ) &&
            const DeepCollectionEquality().equals(
              other._guardrails,
              _guardrails,
            ) &&
            (identical(other.supportsGenUI, supportsGenUI) ||
                other.supportsGenUI == supportsGenUI) &&
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
    provider,
    model,
    apiKey,
    const DeepCollectionEquality().hash(_enabledTools),
    const DeepCollectionEquality().hash(_guardrails),
    supportsGenUI,
    const DeepCollectionEquality().hash(_metadata),
    createdAt,
    updatedAt,
  );

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentImplCopyWith<_$AgentImpl> get copyWith =>
      __$$AgentImplCopyWithImpl<_$AgentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentImplToJson(this);
  }
}

abstract class _Agent implements Agent {
  const factory _Agent({
    required final String id,
    required final String name,
    required final String description,
    required final String provider,
    required final String model,
    final String? apiKey,
    final List<String> enabledTools,
    final Map<String, dynamic> guardrails,
    final bool supportsGenUI,
    final Map<String, dynamic> metadata,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$AgentImpl;

  factory _Agent.fromJson(Map<String, dynamic> json) = _$AgentImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get provider; // 'gemini', 'firebase_ai_logic', 'custom_server'
  @override
  String get model; // e.g., 'gemini-2.0-flash'
  @override
  String? get apiKey; // Optional for provider-specific auth
  @override
  List<String> get enabledTools;
  @override
  Map<String, dynamic> get guardrails; // e.g., {'max_retries': 3, 'timeout_seconds': 30}
  @override
  bool get supportsGenUI;
  @override
  Map<String, dynamic> get metadata; // Custom metadata
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentImplCopyWith<_$AgentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
