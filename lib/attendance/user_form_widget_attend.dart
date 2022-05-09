// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'user_attend.dart';
import 'button_atten.dart';

class UserFormWidgetAtt extends StatefulWidget {
  final ValueChanged<UserAtt> onSavedUser;
  final UserAtt? user;

  const UserFormWidgetAtt({
    Key? key,
    this.user,
    required this.onSavedUser,
  }) : super(key: key);
  @override
  _UserFormWidgetAttState createState() => _UserFormWidgetAttState();
}

class _UserFormWidgetAttState extends State<UserFormWidgetAtt> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late bool begin;
  late TextEditingController controllerAttendance;
  //late int id;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  @override
  void didUpdateWidget(covariant UserFormWidgetAtt oldWidget) {
    super.didUpdateWidget(oldWidget);
    initUser();
  }

  void initUser() {
    final name = widget.user == null ? '' : widget.user!.name;
    final email = widget.user == null ? '' : widget.user!.email;
    final begin = widget.user == null ? true : widget.user!.begin;
    final attendance =
        widget.user == null ? 'Present' : widget.user!.attendance;
    // final id= widget.user ==null ? 0: widget.user!.name;
    //setState(() {

    controllerName = TextEditingController(text: name);
    controllerEmail = TextEditingController(text: email);
    controllerAttendance = TextEditingController(text: attendance);
    this.begin = begin;
    //this.id=0;
    //});
  }

  @override
  Widget build(BuildContext context) => Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildName(),
              const SizedBox(height: 16),
              buildEmail(),
              const SizedBox(height: 16),
              buildbegin(),
              const SizedBox(height: 16),
              buildAttendance(),
              const SizedBox(height: 16),
              buildSubmit(),
            ],
          ),
        ),
      );

  Widget buildName() => TextFormField(
        controller: controllerName,
        decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(),
        ),
        validator: (value) =>
            value != null && value.isEmpty ? 'enter name' : null,
      );
  Widget buildEmail() => TextFormField(
        controller: controllerEmail,
        decoration: InputDecoration(
          labelText: 'email',
          border: OutlineInputBorder(),
        ),
        validator: (value) =>
            value != null && !value.contains('@') ? 'email' : null,
      );
  Widget buildAttendance() => TextFormField(
        controller: controllerAttendance,
        decoration: InputDecoration(
          labelText: 'Attendance',
          border: OutlineInputBorder(),
        ),
        validator: (value) => value != null && !value.contains('') ? '' : null,
      );
  Widget buildbegin() => SwitchListTile(
        value: begin,
        title: Text('begin'),
        onChanged: (value) {
          setState(() => begin = value);
          setState(() {
            if (value) {
              //Userfields.attendance="Present" ;
              controllerAttendance.text = 'Present';
            } else {
              // Userfields.attendance="Absent" ;
              controllerAttendance.text = 'absent';
            }
          });
        },
      );
  Widget buildSubmit() => ButtonWidget(
        text: 'Save',
        onClicked: () {
          final form = formKey.currentState!;
          final isValid = form.validate();
          if (isValid) {
            final id = widget.user == null ? null : widget.user!.id;
            final user = UserAtt(
              id: id,
              name: controllerName.text,
              email: controllerEmail.text,
              begin: begin,
              attendance: controllerAttendance.text,
            );
            widget.onSavedUser(user);
          }
        },
      );
}
