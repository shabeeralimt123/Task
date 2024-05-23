import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_firebase/features/task/data/repositories/date_base_key_repositary_impl.dart';
import 'package:test_firebase/features/task/domain/model/task_model.dart.dart';
import 'package:test_firebase/features/task/domain/repositaries/task_repositary.dart';
import 'package:test_firebase/features/task/domain/state/task_state.dart';

final selectedtaskPriorityStatusProvider =
    StateProvider.autoDispose<TaskPriority>((ref) => TaskPriority.high);
final taskNotifierProvider =
    StateNotifierProvider.autoDispose<TaskNotifier, TaskState>((ref) {
  final courseRepository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(courseRepository);
});

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository _taskRepository;

  TaskNotifier(this._taskRepository) : super(const TaskState.loading()) {
    getTasks();
  }

  getTasks() async {
    state = const TaskState.loading();
    try {
      final course = await _taskRepository.getTask();
      state = TaskState.success(course);
    } catch (e) {
      state = TaskState.error(e.toString());
      rethrow;
    }
  }

  createTask(Task task) async {
    state = TaskState.loading();
    try {
      final tasks = await _taskRepository.createTask(task);
      getTasks();
      return tasks;
    } catch (e) {
      state = TaskState.error(e.toString());
      rethrow;
    }
  }

  deleteTask(String id) async {
    try {
      final tasks = await _taskRepository.deleteTask(id);
      getTasks();

      return tasks;
    } catch (e) {
      state = TaskState.error(e.toString());
      rethrow;
    }
  }

  taskFilter(TaskPriority status) async {
    try {
      state = TaskState.loading();
      final query = status.toString().split('.').last.toLowerCase();
      final lead = await _taskRepository.taskFilter(query);
      state = TaskState.success(lead);
    } catch (e) {
      state = TaskState.error(e.toString());
      rethrow;
    }
  }
}

final selectedPriorityProvider = StateProvider<String?>((ref) => null);
