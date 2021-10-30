// ignore_for_file: prefer_const_constructors,

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firebase/services/database.dart';
import 'package:todo_firebase/widgets/taskTile.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    final db = Services();

    return StreamBuilder<QuerySnapshot>(
        stream: db.readData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error ');
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16.0),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var datas = snapshot.data!.docs[index].data()! as dynamic;
                  String docKey = snapshot.data!.docs[index].id;
                  String taskName = datas['taskName'];
                  bool done = datas['done'];

                  return TaskTile(
                    taskName: taskName,
                    completed: done,
                    keys: docKey,
                  );
                });
          }

          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.red,
              ),
            ),
          );
        });
  }
}
