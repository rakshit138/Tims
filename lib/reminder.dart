// import 'package:flutter/material.dart';

// import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
// import 'package:flutter/cupertino.dart';

// class Reminder extends StatefulWidget {
//   @override
//   State<Reminder> createState() => _ReminderState();
// }

// class _ReminderState extends State<Reminder> {
//   // creating text ediiting controller to take hour
//   // and minute as input
//   TextEditingController hourController = TextEditingController();
//   TextEditingController minuteController = TextEditingController();
//   TextEditingController labelController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Alarm'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//             child: Column(children: <Widget>[
//           const SizedBox(height: 30),
//           Container(
//             child: const Text("Enter time",
//                 style: TextStyle(
//                   fontSize: 20,
//                 )),
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 40,
//                 width: 60,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.rectangle,
//                   color: Colors.white,
//                 ),
//                 child: Center(
//                   child: TextField(
//                     controller: hourController,
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 20),
//               Container(
//                 height: 40,
//                 width: 60,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.rectangle,
//                   color: Colors.white,
//                 ),
//                 child: Center(
//                   child: TextField(
//                     controller: minuteController,
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             child: const Text("Enter Description",
//                 style: TextStyle(
//                   fontSize: 20,
//                 )),
//           ),
//           SizedBox(
//             height: 100,
//             width: MediaQuery.of(context).size.width * 0.5,
//             child: TextFormField(
//               controller: labelController,
//               keyboardType: TextInputType.text,
//               onSaved: (value) {
//                 value = labelController.text;
//               },
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.all(25),
//             child: TextButton(
//               child: const Text(
//                 'Create alarm',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//               onPressed: () {
//                 int hour;
//                 int minutes;
//                 String label;
//                 hour = int.parse(hourController.text);
//                 minutes = int.parse(minuteController.text);
//                 label = labelController.text;
//                 // creating alarm after converting hour
//                 // and minute into integer
//                 FlutterAlarmClock.createAlarm(hour, minutes, title: label);
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // show alarm
//               FlutterAlarmClock.showAlarms();
//             },
//             child: const Text(
//               'Show Alarms',
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//         ])),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // creating text ediiting controller to take hour
  // and minute as input
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  TextEditingController labelController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final CreateAlarmButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF8E334C),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width / 3,
          onPressed: () {
            int hour;
            int minutes;
            String label;
            hour = int.parse(hourController.text);
            minutes = int.parse(minuteController.text);
            label = labelController.text;
            // creating alarm after converting hour
            // and minute into integer
            FlutterAlarmClock.createAlarm(hour, minutes, title: label);
          },
          child: Text(
            "Create Alarm",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFFEC9454),
                fontWeight: FontWeight.bold),
          )),
    );
    final ShowAlarmButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF8E334C),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width / 3,
          onPressed: () {
            FlutterAlarmClock.showAlarms();
          },
          child: Text(
            "Show Alarm",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFFEC9454),
                fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFEC9454)),
        title: const Text('Alarm'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
              const SizedBox(height: 30),
              Container(
                child: const Text("Enter time",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: TextField(
                        controller: hourController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    height: 40,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: TextField(
                        controller: minuteController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: const Text("Enter Description",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  controller: labelController,
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    value = labelController.text;
                  },
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.all(25),
              //   child: TextButton(
              //     child: const Text(
              //       'Create alarm',
              //       style: TextStyle(fontSize: 20.0),
              //     ),
              //     onPressed: () {
              //       int hour;
              //       int minutes;
              //       String label;
              //       hour = int.parse(hourController.text);
              //       minutes = int.parse(minuteController.text);
              //       label = labelController.text;
              //       // creating alarm after converting hour
              //       // and minute into integer
              //       FlutterAlarmClock.createAlarm(hour, minutes, title: label);
              //     },
              //   ),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     // show alarm
              //     FlutterAlarmClock.showAlarms();
              //   },
              //   child: const Text(
              //     'Show Alarms',
              //     style: TextStyle(fontSize: 20, color: Color(0xFFEC9454)),
              //   ),
            ])),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            CreateAlarmButton,
            SizedBox(
              height: 35,
            ),
            ShowAlarmButton
          ],
        ),
      ),
    );
  }
}
