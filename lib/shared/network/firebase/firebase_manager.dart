import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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

  static Future<void> addTask(TaskModel task) {
    var collection = getTaskCollection();
    var document = collection.doc();
    task.id = document.id;
    return document.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime date) {
    return getTaskCollection()
        .where("date",
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }
  static Future<void> deleteTask(String taskId){

   return getTaskCollection().doc(taskId).delete();
  }
  static Future<void> updateTask(TaskModel model){

    return getTaskCollection().doc(model.id).update(model.toData());
  }
}
