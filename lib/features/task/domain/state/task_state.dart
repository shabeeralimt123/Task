
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_firebase/features/task/domain/model/task_model.dart.dart';

part 'task_state.freezed.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState.loading() = _TaskStateLoading;
  const factory TaskState.success(List<Task> tasks) = _TaskStateSuccess;
  const factory TaskState.error(String message) = _TaskStateError;
}