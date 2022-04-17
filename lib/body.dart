// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

const MaterialColor primaryMaroon = MaterialColor(
  _MaroonPrimaryValue,
  <int, Color>{
    50: Color(0xFF8E334C),
    100: Color(0xFF8E334C),
    200: Color(0xFF8E334C),
    300: Color(0xFF8E334C),
    400: Color(0xFF8E334C),
    500: Color(_MaroonPrimaryValue),
    600: Color(0xFF8E334C),
    700: Color(0xFF8E334C),
    800: Color(0xFF8E334C),
    900: Color(0xFF8E334C),
  },
);
const int _MaroonPrimaryValue = 0xFF8E334C;

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final AttendanceButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFF8E334C),
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width / 3,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          onPressed: () {},
          child: Column(children: [
            Icon(
              Icons.people_alt_rounded,
              size: 30,
              color: Color(0xFFEC9454),
            ),
            Text(
              "Attendance",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFEC9454), fontWeight: FontWeight.w500),
            )
          ])),
    );

    final MarksButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFF8E334C),
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width / 3,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          onPressed: () {},
          child: Column(
            children: [
              Icon(
                Icons.analytics_rounded,
                size: 30,
                color: Color(0xFFEC9454),
              ),
              Text(
                "Test Scores",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFEC9454), fontWeight: FontWeight.w500),
              )
            ],
          )),
    );
    final TodoButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFF8E334C),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width / 3,
          onPressed: () {},
          child: Column(
            children: [
              Icon(
                Icons.add_task_rounded,
                size: 30,
                color: Color(0xFFEC9454),
              ),
              Text(
                "To-do",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFEC9454), fontWeight: FontWeight.w500),
              )
            ],
          )),
    );

    final ReminderButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFF8E334C),
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width / 3,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          onPressed: () {},
          child: Column(
            children: [
              Icon(
                Icons.access_alarm_rounded,
                size: 30,
                color: Color(0xFFEC9454),
              ),
              Text(
                "Reminder",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFEC9454), fontWeight: FontWeight.w500),
              )
            ],
          )),
    );
    final ReferenceButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFF8E334C),
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width / 3,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          onPressed: () {},
          child: Column(
            children: [
              Icon(
                Icons.article_outlined,
                size: 30,
                color: Color(0xFFEC9454),
              ),
              Text(
                "Reference",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFEC9454), fontWeight: FontWeight.w500),
              )
            ],
          )),
    );

    final SettingButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Color(0xFF8E334C),
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width / 3,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          onPressed: () {},
          child: Column(
            children: [
              Icon(
                Icons.settings,
                size: 30,
                color: Color(0xFFEC9454),
              ),
              Text(
                "Settings",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFEC9454), fontWeight: FontWeight.w500),
              )
            ],
          )),
    );
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [AttendanceButton, MarksButton],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [TodoButton, ReminderButton],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ReferenceButton, SettingButton],
          ),
        ],
      ),
    );
  }
}