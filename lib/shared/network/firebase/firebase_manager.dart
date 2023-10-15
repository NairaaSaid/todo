import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/models/task_model.dart';

class FirebaseManager {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromData(snapshot.data()!);
      },
      toFirestore: (task, _) {
        return task.toData();
      },
    );
  }

  static void addTask(TaskModel task) {
    var collection = getTaskCollection();
    var document = collection.doc();
    task.id = document.id;
    document.set(task);
  }
}
