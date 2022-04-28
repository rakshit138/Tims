import 'package:flutter/material.dart';
import 'user.dart';
import 'button.dart';

class UserFormWidget extends StatefulWidget {
  final ValueChanged<User> onSavedUser;
  final User? user;

  const UserFormWidget({
    Key? key,
    this.user,
    required this.onSavedUser,
  }) : super(key: key);
  @override
  _UserFormWidgetState createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerquiz1;
  late TextEditingController controllerquiz2;
  late TextEditingController controllerinsem1;
  late TextEditingController controllerinsem2;
  late bool begin;
  //late int id;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  @override
  void didUpdateWidget(covariant UserFormWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    initUser();
  }

  void initUser() {
    final name = widget.user == null ? '' : widget.user!.name;
    final email = widget.user == null ? '' : widget.user!.email;
    final begin = widget.user == null ? true : widget.user!.begin;
    final quiz1 = widget.user == null ? 0 : widget.user!.quiz1;
    final quiz2 = widget.user == null ? 0 : widget.user!.quiz2;
    final insem1 = widget.user == null ? 0 : widget.user!.insem1;
    final insem2 = widget.user == null ? 0 : widget.user!.insem2;
    // final id= widget.user ==null ? 0: widget.user!.name;
    //setState(() {

    controllerName = TextEditingController(text: name);
    controllerEmail = TextEditingController(text: email);
    controllerquiz1 = TextEditingController(text: quiz1.toString());
    controllerquiz2 = TextEditingController(text: quiz2.toString());
    controllerinsem1 = TextEditingController(text: insem1.toString());
    controllerinsem2 = TextEditingController(text: insem2.toString());
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
              // buildbegin(),
              const SizedBox(height: 16),
              buildquiz1(),
              const SizedBox(height: 16),
              buildinsem1(),
              const SizedBox(height: 16),
              buildquiz2(),
              const SizedBox(height: 16),
              buildinsem2(),
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
  Widget buildquiz1() => TextFormField(
        controller: controllerquiz1,
        decoration: InputDecoration(
          labelText: 'Quiz 1',
          border: OutlineInputBorder(),
        ),
        validator: (value) => value != null && value.isEmpty ? '0' : null,
      );
  Widget buildquiz2() => TextFormField(
        controller: controllerquiz2,
        decoration: InputDecoration(
          labelText: 'Quiz 2',
          border: OutlineInputBorder(),
        ),
        validator: (value) => value != null && value.isEmpty ? '0' : null,
      );
  Widget buildinsem1() => TextFormField(
        controller: controllerinsem1,
        decoration: InputDecoration(
          labelText: 'Insem 1',
          border: OutlineInputBorder(),
        ),
        validator: (value) => value != null && value.isEmpty ? '0' : null,
      );
  Widget buildinsem2() => TextFormField(
        controller: controllerinsem2,
        decoration: InputDecoration(
          labelText: 'Insem 2',
          border: OutlineInputBorder(),
        ),
        validator: (value) => value != null && value.isEmpty ? '0' : null,
      );

  Widget buildbegin() => SwitchListTile(
        value: begin,
        title: Text('begin'),
        onChanged: (value) => setState(() => begin = value),
      );

  Widget buildSubmit() => ButtonWidget(
        text: 'Save',
        onClicked: () {
          final form = formKey.currentState!;
          final isValid = form.validate();
          if (isValid) {
            final id = widget.user == null ? null : widget.user!.id;
            final user = User(
              id: id,
              name: controllerName.text,
              email: controllerEmail.text,
              begin: begin,
              quiz1: int.parse(controllerquiz1.text),
              quiz2: int.parse(controllerquiz2.text),
              insem1: int.parse(controllerinsem1.text),
              insem2: int.parse(controllerinsem2.text),
            );
            widget.onSavedUser(user);
          }
        },
      );
}
