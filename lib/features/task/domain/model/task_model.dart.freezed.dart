// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  TaskPriority? get priority =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "task_from_date")
  String? get taskFromDate =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "task_to_date")
  String? get tasToDate =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "task_from_time")
  String? get taskFromTime =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: "task_to_time")
  String? get tasToTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String? description,
      TaskPriority? priority,
      @JsonKey(name: "task_from_date") String? taskFromDate,
      @JsonKey(name: "task_to_date") String? tasToDate,
      @JsonKey(name: "task_from_time") String? taskFromTime,
      @JsonKey(name: "task_to_time") String? tasToTime});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? priority = freezed,
    Object? taskFromDate = freezed,
    Object? tasToDate = freezed,
    Object? taskFromTime = freezed,
    Object? tasToTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority?,
      taskFromDate: freezed == taskFromDate
          ? _value.taskFromDate
          : taskFromDate // ignore: cast_nullable_to_non_nullable
              as String?,
      tasToDate: freezed == tasToDate
          ? _value.tasToDate
          : tasToDate // ignore: cast_nullable_to_non_nullable
              as String?,
      taskFromTime: freezed == taskFromTime
          ? _value.taskFromTime
          : taskFromTime // ignore: cast_nullable_to_non_nullable
              as String?,
      tasToTime: freezed == tasToTime
          ? _value.tasToTime
          : tasToTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String? description,
      TaskPriority? priority,
      @JsonKey(name: "task_from_date") String? taskFromDate,
      @JsonKey(name: "task_to_date") String? tasToDate,
      @JsonKey(name: "task_from_time") String? taskFromTime,
      @JsonKey(name: "task_to_time") String? tasToTime});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? priority = freezed,
    Object? taskFromDate = freezed,
    Object? tasToDate = freezed,
    Object? taskFromTime = freezed,
    Object? tasToTime = freezed,
  }) {
    return _then(_$TaskImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority?,
      taskFromDate: freezed == taskFromDate
          ? _value.taskFromDate
          : taskFromDate // ignore: cast_nullable_to_non_nullable
              as String?,
      tasToDate: freezed == tasToDate
          ? _value.tasToDate
          : tasToDate // ignore: cast_nullable_to_non_nullable
              as String?,
      taskFromTime: freezed == taskFromTime
          ? _value.taskFromTime
          : taskFromTime // ignore: cast_nullable_to_non_nullable
              as String?,
      tasToTime: freezed == tasToTime
          ? _value.tasToTime
          : tasToTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {this.id,
      required this.name,
      this.description,
      this.priority,
      @JsonKey(name: "task_from_date") this.taskFromDate,
      @JsonKey(name: "task_to_date") this.tasToDate,
      @JsonKey(name: "task_from_time") this.taskFromTime,
      @JsonKey(name: "task_to_time") this.tasToTime});

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final TaskPriority? priority;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "task_from_date")
  final String? taskFromDate;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "task_to_date")
  final String? tasToDate;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "task_from_time")
  final String? taskFromTime;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: "task_to_time")
  final String? tasToTime;

  @override
  String toString() {
    return 'Task(id: $id, name: $name, description: $description, priority: $priority, taskFromDate: $taskFromDate, tasToDate: $tasToDate, taskFromTime: $taskFromTime, tasToTime: $tasToTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.taskFromDate, taskFromDate) ||
                other.taskFromDate == taskFromDate) &&
            (identical(other.tasToDate, tasToDate) ||
                other.tasToDate == tasToDate) &&
            (identical(other.taskFromTime, taskFromTime) ||
                other.taskFromTime == taskFromTime) &&
            (identical(other.tasToTime, tasToTime) ||
                other.tasToTime == tasToTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, priority,
      taskFromDate, tasToDate, taskFromTime, tasToTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {final String? id,
      required final String name,
      final String? description,
      final TaskPriority? priority,
      @JsonKey(name: "task_from_date") final String? taskFromDate,
      @JsonKey(name: "task_to_date") final String? tasToDate,
      @JsonKey(name: "task_from_time") final String? taskFromTime,
      @JsonKey(name: "task_to_time") final String? tasToTime}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  TaskPriority? get priority;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: "task_from_date")
  String? get taskFromDate;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: "task_to_date")
  String? get tasToDate;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: "task_from_time")
  String? get taskFromTime;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: "task_to_time")
  String? get tasToTime;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
