// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class Services {
  final CollectionReference _todoCollection =
      FirebaseFirestore.instance.collection('todo');

  Future<void> addItem({
    required String taskName,
  }) async {
    DocumentReference documentReferencer = _todoCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "taskName": taskName,
      "done": false,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Todo added to the database"))
        .catchError((e) => print(e));
  }

  Stream<QuerySnapshot> readData() {
    CollectionReference tasksFirestore = _todoCollection;

    return tasksFirestore.snapshots();
  }

  Future<void> updateItem({
    required String updatedName,
    required String docId,
  }) async {
    DocumentReference documentReferencer = _todoCollection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "taskName": updatedName,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Todo updated in the database"))
        .catchError((e) => print(e));
  }

  Future done({required String docId}) async {
    await _todoCollection.doc(docId).update({"done": true});
  }

  Future pending({required String docId}) async {
    await _todoCollection.doc(docId).update({"done": false});
  }

  Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer = _todoCollection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Todo deleted from the database'))
        .catchError((e) => print(e));
  }
}
