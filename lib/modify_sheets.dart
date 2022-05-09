// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'main.dart';
import 'user_form_widget.dart';
import 'user.dart';
import 'user_sheet_api.dart';
import 'navigate_users_widget.dart';

class ModifySheetsPage extends StatefulWidget {
  const ModifySheetsPage({Key? key}) : super(key: key);

  @override
  _ModifySheetsPageState createState() => _ModifySheetsPageState();
}

class _ModifySheetsPageState extends State<ModifySheetsPage> {
  //  User? user;
  int index = 0;
  List<User> users = [];

  @override
  void initState() {
    super.initState();

    getUsers();
  }

  Future getUsers() async {
    // final user = await  UserssheetApi.getById(1);
    final users = await UserssheetApi.getAll();
    // print(user!.toJson());

    setState(() {
      this.users = users;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFFEC9454)),
          title: Text("Modify"),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            children: [
              UserFormWidget(
                user: users.isEmpty ? null : users[index],
                //user: user,
                onSavedUser: (user) async {
                  await UserssheetApi.update(user.id!, user.toJson());
                },
              ),
              const SizedBox(height: 16),
              if (users.isNotEmpty) buildUserControls(),
            ],
          ),
        ),
      );
  Widget buildUserControls() => NavigateUsersWidget(
        text: '${index + 1}/${users.length} Users',
        onClickedNext: () {
          final nextIndex = index >= users.length - 1 ? 0 : index + 1;
          setState(() => index = nextIndex);
        },
        onClickedPrevious: () {
          final previousIndex = index <= 0 ? users.length - 1 : index - 1;

          setState(() => index = previousIndex);
        },
      );
}
