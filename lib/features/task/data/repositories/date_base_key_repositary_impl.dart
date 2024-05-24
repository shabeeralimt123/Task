import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:test_firebase/core/utils/data_base_keys.dart';
import 'package:test_firebase/features/task/domain/model/task_model.dart.dart';
import 'package:test_firebase/features/task/domain/repositaries/task_repositary.dart';
import 'package:test_firebase/src/providers.dart';

final taskRepositoryProvider =
    Provider<TaskRepository>((ref) => TaskRepositoryImpl(ref));

class TaskRepositoryImpl implements TaskRepository {
  final ProviderRef ref;
  TaskRepositoryImpl(this.ref);

  @override
  Future<Task> createTask(Task task) async {
    try {
      final data = task.toJson();
      print(data);

      // Creating the course in Firestore and getting the document reference.
      final docRef = await ref
          .read(firestoreProvider)
          .collection(DatabaseKeys.task)
          .add(data);

      // Adding the ID to the document's data.
      await docRef.update({'id': docRef.id});

      // Returning a new instance of Course with the ID set.
      return task.copyWith(id: docRef.id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Task> editTask(Task task) async {
    try {
      await ref
          .read(firestoreProvider)
          .collection(DatabaseKeys.task)
          .doc(task.id)
          .update(task.toJson());
      print(task);

      return task;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Task>> getTask() async {
    try {
      final doc =
          await ref.read(firestoreProvider).collection(DatabaseKeys.task).get();
      final tasks =
          doc.docs.map((snapshot) => Task.fromDocument(snapshot)).toList();
      print(tasks);
      return tasks;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      await ref
          .read(firestoreProvider)
          .collection(DatabaseKeys.task)
          .doc(id)
          .delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Task>> taskFilter(String query) async {
    try {
      final doc = await ref
          .read(firestoreProvider)
          .collection(DatabaseKeys.task)
          .where("priority", isEqualTo: query)
          .get();

      final tasks =
          doc.docs.map((snapshot) => Task.fromDocument(snapshot)).toList();
      print(tasks);
      return tasks;
    } catch (e) {
      rethrow;
    }
  }
  @override
Future<int> getTotalTaskCount() async {
  try {
    final doc = await ref
        .read(firestoreProvider)
        .collection(DatabaseKeys.task)
        .get();
    final totalCount = doc.size;
    print('Total Count: $totalCount');
    return totalCount;
  } catch (e) {
    rethrow;
  }
}
}
