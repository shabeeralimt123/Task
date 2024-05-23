import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.dart.freezed.dart';
part 'task_model.dart.g.dart';

// Define enum for HideProfile
// ignore: constant_identifier_names
enum TaskPriority {
  all,
  low,
  medium,
  high,
}

@freezed
class Task with _$Task {
  const factory Task({
    String? id,
    required String name,
    String? description,
    TaskPriority? priority,
    // ignore: invalid_annotation_target
    @JsonKey(name: "task_from_date") String? taskFromDate,

    // ignore: invalid_annotation_target
    @JsonKey(name: "task_to_date") String? tasToDate,
    // ignore: invalid_annotation_target
    @JsonKey(name: "task_from_time") String? taskFromTime,
    // ignore: invalid_annotation_target
    @JsonKey(name: "task_to_time") String? tasToTime,
  }) = _Task;
  // Convert Firestore Document to UserModel
  factory Task.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Task(
      id: doc.id,
      taskFromDate: data['task_from_date'] as String?,
      tasToDate: data['task_to_date'] as String?,
      taskFromTime: data['task_from_time'] as String?,
      tasToTime: data['task_to_time'] as String?,
      name: data['name'] as String,
      description: data['description'] as String? ??
          '', // Provide a default value if description is null
      priority: _parsePriority(data['priority']
          as String?), // Provide a default value if priority is null
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  static TaskPriority? _parsePriority(String? priorityString) {
    switch (priorityString) {
      case 'all':
        return TaskPriority.all;
      case 'low':
        return TaskPriority.low;
      case 'medium':
        return TaskPriority.medium;
      case 'high':
        return TaskPriority.high;
      default:
        return null;
    }
  }
}
