// ignore_for_file: file_names, prefer_const_constructors_in_immutables, dead_code

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_firebase/services/database.dart';

class TaskTile extends StatefulWidget {
  final String taskName;
  final bool completed;
  final String keys;

  TaskTile(
      {Key? key,
      required this.taskName,
      required this.completed,
      required this.keys})
      : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    final db = Services();

    TextEditingController editedNameController = TextEditingController();

    String nameOfTask = widget.taskName;

    return Dismissible(
      onDismissed: (direction) async {
        await db.deleteItem(docId: widget.keys);
      },
      key: Key(widget.taskName),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color(0xFFFFFAFA),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: ListTile(
            leading: widget.completed
                ? IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.checkCircle,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      db.pending(docId: widget.keys);
                    },
                  )
                : IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.timesCircle,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      db.done(docId: widget.keys);
                    },
                  ),
            title: _isEditing
                ? TextFormField(
                    controller: editedNameController,
                  )
                : Text(nameOfTask),
            trailing: _isEditing
                ? IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.check,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      nameOfTask = editedNameController.text;

                      if (nameOfTask.isNotEmpty) {
                        await db.updateItem(
                            updatedName: nameOfTask, docId: widget.keys);
                      }

                      setState(() {
                        _isEditing = false;
                        nameOfTask = editedNameController.text;
                      });
                    },
                  )
                : IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.edit,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isEditing = true;
                      });
                    },
                  )),
      ),
      background: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFdc3545),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        padding: const EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.delete),
      ),
    );
  }
}

   /*if (editedNameController.text.isNotEmpty) {
                db.updateItem(
                    updatedName: editedNameController.text, docId: widget.keys);
              }*/
              

/*

                nameOfTask = editedNameController.text;

                if (nameOfTask.isNotEmpty) {
                  await db.updateItem(
                      updatedName: nameOfTask, docId: widget.keys);
                }
*/