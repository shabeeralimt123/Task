// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      priority: $enumDecodeNullable(_$TaskPriorityEnumMap, json['priority']),
      taskFromDate: json['task_from_date'] as String?,
      tasToDate: json['task_to_date'] as String?,
      taskFromTime: json['task_from_time'] as String?,
      tasToTime: json['task_to_time'] as String?,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'priority': _$TaskPriorityEnumMap[instance.priority],
      'task_from_date': instance.taskFromDate,
      'task_to_date': instance.tasToDate,
      'task_from_time': instance.taskFromTime,
      'task_to_time': instance.tasToTime,
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.all: 'all',
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
};
