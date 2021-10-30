// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:todo_firebase/services/database.dart';
import 'package:todo_firebase/widgets/tasks.dart';

import 'package:todo_firebase/widgets/welcome.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController taskNameController = TextEditingController();
    return Scaffold(
        backgroundColor: Color(0xFFD3D3D3),
        body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Top(),
          Container(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25.0, top: 40, bottom: 40.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: TextField(
                      textCapitalization: TextCapitalization.words,
                      controller: taskNameController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () async {
                            if (taskNameController.text.isNotEmpty) {
                              await Services().addItem(
                                  taskName: taskNameController.text.trim());
                            }
                            taskNameController.clear();
                          },
                          icon: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.black,
                          ),
                        ),
                        fillColor: Color(0xFFFFFAFA),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Enter the task name",
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 10, bottom: 10.0),
                child: Tasks()),
          ),
        ])));
  }
}
