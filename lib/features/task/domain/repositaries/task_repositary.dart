import 'package:test_firebase/features/task/domain/model/task_model.dart.dart';

abstract class TaskRepository {
  Future<Task> createTask(Task task);
  Future<Task> editTask(Task task);

  Future<List<Task>> getTask();
  Future<void> deleteTask(String id);
  Future<List<Task>> taskFilter(String query);
}
