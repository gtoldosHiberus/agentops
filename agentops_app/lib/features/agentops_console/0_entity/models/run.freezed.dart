// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'run.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ToolCall _$ToolCallFromJson(Map<String, dynamic> json) {
  return _ToolCall.fromJson(json);
}

/// @nodoc
mixin _$ToolCall {
  String get id => throw _privateConstructorUsedError;
  String get toolName => throw _privateConstructorUsedError;
  Map<String, dynamic> get input => throw _privateConstructorUsedError;
  String? get output => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this ToolCall to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ToolCall
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ToolCallCopyWith<ToolCall> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolCallCopyWith<$Res> {
  factory $ToolCallCopyWith(ToolCall value, $Res Function(ToolCall) then) =
      _$ToolCallCopyWithImpl<$Res, ToolCall>;
  @useResult
  $Res call({
    String id,
    String toolName,
    Map<String, dynamic> input,
    String? output,
    String? error,
    DateTime timestamp,
  });
}

/// @nodoc
class _$ToolCallCopyWithImpl<$Res, $Val extends ToolCall>
    implements $ToolCallCopyWith<$Res> {
  _$ToolCallCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ToolCall
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? toolName = null,
    Object? input = null,
    Object? output = freezed,
    Object? error = freezed,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            toolName: null == toolName
                ? _value.toolName
                : toolName // ignore: cast_nullable_to_non_nullable
                      as String,
            input: null == input
                ? _value.input
                : input // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            output: freezed == output
                ? _value.output
                : output // ignore: cast_nullable_to_non_nullable
                      as String?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ToolCallImplCopyWith<$Res>
    implements $ToolCallCopyWith<$Res> {
  factory _$$ToolCallImplCopyWith(
    _$ToolCallImpl value,
    $Res Function(_$ToolCallImpl) then,
  ) = __$$ToolCallImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String toolName,
    Map<String, dynamic> input,
    String? output,
    String? error,
    DateTime timestamp,
  });
}

/// @nodoc
class __$$ToolCallImplCopyWithImpl<$Res>
    extends _$ToolCallCopyWithImpl<$Res, _$ToolCallImpl>
    implements _$$ToolCallImplCopyWith<$Res> {
  __$$ToolCallImplCopyWithImpl(
    _$ToolCallImpl _value,
    $Res Function(_$ToolCallImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ToolCall
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? toolName = null,
    Object? input = null,
    Object? output = freezed,
    Object? error = freezed,
    Object? timestamp = null,
  }) {
    return _then(
      _$ToolCallImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        toolName: null == toolName
            ? _value.toolName
            : toolName // ignore: cast_nullable_to_non_nullable
                  as String,
        input: null == input
            ? _value._input
            : input // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        output: freezed == output
            ? _value.output
            : output // ignore: cast_nullable_to_non_nullable
                  as String?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolCallImpl implements _ToolCall {
  const _$ToolCallImpl({
    required this.id,
    required this.toolName,
    required final Map<String, dynamic> input,
    this.output,
    this.error,
    required this.timestamp,
  }) : _input = input;

  factory _$ToolCallImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToolCallImplFromJson(json);

  @override
  final String id;
  @override
  final String toolName;
  final Map<String, dynamic> _input;
  @override
  Map<String, dynamic> get input {
    if (_input is EqualUnmodifiableMapView) return _input;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_input);
  }

  @override
  final String? output;
  @override
  final String? error;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'ToolCall(id: $id, toolName: $toolName, input: $input, output: $output, error: $error, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolCallImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.toolName, toolName) ||
                other.toolName == toolName) &&
            const DeepCollectionEquality().equals(other._input, _input) &&
            (identical(other.output, output) || other.output == output) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    toolName,
    const DeepCollectionEquality().hash(_input),
    output,
    error,
    timestamp,
  );

  /// Create a copy of ToolCall
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolCallImplCopyWith<_$ToolCallImpl> get copyWith =>
      __$$ToolCallImplCopyWithImpl<_$ToolCallImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolCallImplToJson(this);
  }
}

abstract class _ToolCall implements ToolCall {
  const factory _ToolCall({
    required final String id,
    required final String toolName,
    required final Map<String, dynamic> input,
    final String? output,
    final String? error,
    required final DateTime timestamp,
  }) = _$ToolCallImpl;

  factory _ToolCall.fromJson(Map<String, dynamic> json) =
      _$ToolCallImpl.fromJson;

  @override
  String get id;
  @override
  String get toolName;
  @override
  Map<String, dynamic> get input;
  @override
  String? get output;
  @override
  String? get error;
  @override
  DateTime get timestamp;

  /// Create a copy of ToolCall
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToolCallImplCopyWith<_$ToolCallImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Run _$RunFromJson(Map<String, dynamic> json) {
  return _Run.fromJson(json);
}

/// @nodoc
mixin _$Run {
  String get id => throw _privateConstructorUsedError;
  String get workspaceId => throw _privateConstructorUsedError;
  String get agentId => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;
  List<String> get contextPackIds => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // 'pending', 'running', 'success', 'failed', 'cancelled'
  List<ToolCall> get toolCalls => throw _privateConstructorUsedError;
  String? get output => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String get outputMode =>
      throw _privateConstructorUsedError; // 'text' or 'genui'
  Map<String, dynamic> get genUIOutput =>
      throw _privateConstructorUsedError; // GenUI widget tree if available
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this Run to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Run
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RunCopyWith<Run> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunCopyWith<$Res> {
  factory $RunCopyWith(Run value, $Res Function(Run) then) =
      _$RunCopyWithImpl<$Res, Run>;
  @useResult
  $Res call({
    String id,
    String workspaceId,
    String agentId,
    String prompt,
    List<String> contextPackIds,
    String status,
    List<ToolCall> toolCalls,
    String? output,
    String? error,
    String outputMode,
    Map<String, dynamic> genUIOutput,
    Map<String, dynamic> metadata,
    DateTime createdAt,
    DateTime? completedAt,
  });
}

/// @nodoc
class _$RunCopyWithImpl<$Res, $Val extends Run> implements $RunCopyWith<$Res> {
  _$RunCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Run
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workspaceId = null,
    Object? agentId = null,
    Object? prompt = null,
    Object? contextPackIds = null,
    Object? status = null,
    Object? toolCalls = null,
    Object? output = freezed,
    Object? error = freezed,
    Object? outputMode = null,
    Object? genUIOutput = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            workspaceId: null == workspaceId
                ? _value.workspaceId
                : workspaceId // ignore: cast_nullable_to_non_nullable
                      as String,
            agentId: null == agentId
                ? _value.agentId
                : agentId // ignore: cast_nullable_to_non_nullable
                      as String,
            prompt: null == prompt
                ? _value.prompt
                : prompt // ignore: cast_nullable_to_non_nullable
                      as String,
            contextPackIds: null == contextPackIds
                ? _value.contextPackIds
                : contextPackIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            toolCalls: null == toolCalls
                ? _value.toolCalls
                : toolCalls // ignore: cast_nullable_to_non_nullable
                      as List<ToolCall>,
            output: freezed == output
                ? _value.output
                : output // ignore: cast_nullable_to_non_nullable
                      as String?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            outputMode: null == outputMode
                ? _value.outputMode
                : outputMode // ignore: cast_nullable_to_non_nullable
                      as String,
            genUIOutput: null == genUIOutput
                ? _value.genUIOutput
                : genUIOutput // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RunImplCopyWith<$Res> implements $RunCopyWith<$Res> {
  factory _$$RunImplCopyWith(_$RunImpl value, $Res Function(_$RunImpl) then) =
      __$$RunImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String workspaceId,
    String agentId,
    String prompt,
    List<String> contextPackIds,
    String status,
    List<ToolCall> toolCalls,
    String? output,
    String? error,
    String outputMode,
    Map<String, dynamic> genUIOutput,
    Map<String, dynamic> metadata,
    DateTime createdAt,
    DateTime? completedAt,
  });
}

/// @nodoc
class __$$RunImplCopyWithImpl<$Res> extends _$RunCopyWithImpl<$Res, _$RunImpl>
    implements _$$RunImplCopyWith<$Res> {
  __$$RunImplCopyWithImpl(_$RunImpl _value, $Res Function(_$RunImpl) _then)
    : super(_value, _then);

  /// Create a copy of Run
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workspaceId = null,
    Object? agentId = null,
    Object? prompt = null,
    Object? contextPackIds = null,
    Object? status = null,
    Object? toolCalls = null,
    Object? output = freezed,
    Object? error = freezed,
    Object? outputMode = null,
    Object? genUIOutput = null,
    Object? metadata = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
  }) {
    return _then(
      _$RunImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        workspaceId: null == workspaceId
            ? _value.workspaceId
            : workspaceId // ignore: cast_nullable_to_non_nullable
                  as String,
        agentId: null == agentId
            ? _value.agentId
            : agentId // ignore: cast_nullable_to_non_nullable
                  as String,
        prompt: null == prompt
            ? _value.prompt
            : prompt // ignore: cast_nullable_to_non_nullable
                  as String,
        contextPackIds: null == contextPackIds
            ? _value._contextPackIds
            : contextPackIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        toolCalls: null == toolCalls
            ? _value._toolCalls
            : toolCalls // ignore: cast_nullable_to_non_nullable
                  as List<ToolCall>,
        output: freezed == output
            ? _value.output
            : output // ignore: cast_nullable_to_non_nullable
                  as String?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        outputMode: null == outputMode
            ? _value.outputMode
            : outputMode // ignore: cast_nullable_to_non_nullable
                  as String,
        genUIOutput: null == genUIOutput
            ? _value._genUIOutput
            : genUIOutput // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RunImpl implements _Run {
  const _$RunImpl({
    required this.id,
    required this.workspaceId,
    required this.agentId,
    required this.prompt,
    final List<String> contextPackIds = const [],
    required this.status,
    final List<ToolCall> toolCalls = const [],
    this.output,
    this.error,
    this.outputMode = 'text',
    final Map<String, dynamic> genUIOutput = const {},
    final Map<String, dynamic> metadata = const {},
    required this.createdAt,
    this.completedAt,
  }) : _contextPackIds = contextPackIds,
       _toolCalls = toolCalls,
       _genUIOutput = genUIOutput,
       _metadata = metadata;

  factory _$RunImpl.fromJson(Map<String, dynamic> json) =>
      _$$RunImplFromJson(json);

  @override
  final String id;
  @override
  final String workspaceId;
  @override
  final String agentId;
  @override
  final String prompt;
  final List<String> _contextPackIds;
  @override
  @JsonKey()
  List<String> get contextPackIds {
    if (_contextPackIds is EqualUnmodifiableListView) return _contextPackIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contextPackIds);
  }

  @override
  final String status;
  // 'pending', 'running', 'success', 'failed', 'cancelled'
  final List<ToolCall> _toolCalls;
  // 'pending', 'running', 'success', 'failed', 'cancelled'
  @override
  @JsonKey()
  List<ToolCall> get toolCalls {
    if (_toolCalls is EqualUnmodifiableListView) return _toolCalls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_toolCalls);
  }

  @override
  final String? output;
  @override
  final String? error;
  @override
  @JsonKey()
  final String outputMode;
  // 'text' or 'genui'
  final Map<String, dynamic> _genUIOutput;
  // 'text' or 'genui'
  @override
  @JsonKey()
  Map<String, dynamic> get genUIOutput {
    if (_genUIOutput is EqualUnmodifiableMapView) return _genUIOutput;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_genUIOutput);
  }

  // GenUI widget tree if available
  final Map<String, dynamic> _metadata;
  // GenUI widget tree if available
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'Run(id: $id, workspaceId: $workspaceId, agentId: $agentId, prompt: $prompt, contextPackIds: $contextPackIds, status: $status, toolCalls: $toolCalls, output: $output, error: $error, outputMode: $outputMode, genUIOutput: $genUIOutput, metadata: $metadata, createdAt: $createdAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            const DeepCollectionEquality().equals(
              other._contextPackIds,
              _contextPackIds,
            ) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._toolCalls,
              _toolCalls,
            ) &&
            (identical(other.output, output) || other.output == output) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.outputMode, outputMode) ||
                other.outputMode == outputMode) &&
            const DeepCollectionEquality().equals(
              other._genUIOutput,
              _genUIOutput,
            ) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    workspaceId,
    agentId,
    prompt,
    const DeepCollectionEquality().hash(_contextPackIds),
    status,
    const DeepCollectionEquality().hash(_toolCalls),
    output,
    error,
    outputMode,
    const DeepCollectionEquality().hash(_genUIOutput),
    const DeepCollectionEquality().hash(_metadata),
    createdAt,
    completedAt,
  );

  /// Create a copy of Run
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RunImplCopyWith<_$RunImpl> get copyWith =>
      __$$RunImplCopyWithImpl<_$RunImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RunImplToJson(this);
  }
}

abstract class _Run implements Run {
  const factory _Run({
    required final String id,
    required final String workspaceId,
    required final String agentId,
    required final String prompt,
    final List<String> contextPackIds,
    required final String status,
    final List<ToolCall> toolCalls,
    final String? output,
    final String? error,
    final String outputMode,
    final Map<String, dynamic> genUIOutput,
    final Map<String, dynamic> metadata,
    required final DateTime createdAt,
    final DateTime? completedAt,
  }) = _$RunImpl;

  factory _Run.fromJson(Map<String, dynamic> json) = _$RunImpl.fromJson;

  @override
  String get id;
  @override
  String get workspaceId;
  @override
  String get agentId;
  @override
  String get prompt;
  @override
  List<String> get contextPackIds;
  @override
  String get status; // 'pending', 'running', 'success', 'failed', 'cancelled'
  @override
  List<ToolCall> get toolCalls;
  @override
  String? get output;
  @override
  String? get error;
  @override
  String get outputMode; // 'text' or 'genui'
  @override
  Map<String, dynamic> get genUIOutput; // GenUI widget tree if available
  @override
  Map<String, dynamic> get metadata;
  @override
  DateTime get createdAt;
  @override
  DateTime? get completedAt;

  /// Create a copy of Run
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RunImplCopyWith<_$RunImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
