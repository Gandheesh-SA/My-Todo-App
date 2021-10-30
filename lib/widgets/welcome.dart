import 'package:flutter/material.dart';
import 'package:todo_firebase/services/date.dart';
import 'package:todo_firebase/services/time.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_firebase/constants/styles.dart';

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String time = Time().formattedTime;
    String date = CurrentDate().complete;

    return Container(
        padding: const EdgeInsets.only(
            left: 25.0, right: 25.0, top: 40, bottom: 40.0),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
          ),
          //color: Color(0xFF17096D),
          color: Color(0xFF1A1A1A),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            time,
            style: headingOne,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            date,
            style: headingTwo,
          ),
          const SizedBox(
            height: 25.0,
          ),
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30.0,
            child: Icon(
              FontAwesomeIcons.bars,
              size: 25,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Text(
            'TO DO APP',
            style: headingOne,
          ),
        ]));
  }
}
