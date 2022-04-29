import 'package:flutter/material.dart';
import 'user_form_widget_attend.dart';
import 'user_attend.dart';
import 'user_sheet_api_attend.dart';
import 'navigate_users_widget_attend.dart';

class ModifySheetsPageAttend extends StatefulWidget {
  const ModifySheetsPageAttend({Key? key}) : super(key: key);

  @override
  _ModifySheetsPageAttendState createState() => _ModifySheetsPageAttendState();
}

class _ModifySheetsPageAttendState extends State<ModifySheetsPageAttend> {
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
          title: Text('Attendance'),
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
  Widget buildUserControls() => NavigateUsersWidgetAttend(
        text: '${index + 1}/${users.length} Attend',
        onClickedNextAttend: () {
          final nextIndex = index >= users.length - 1 ? 0 : index + 1;
          setState(() => index = nextIndex);
        },
        onClickedPreviousAttend: () {
          final previousIndex = index <= 0 ? users.length - 1 : index - 1;

          setState(() => index = previousIndex);
        },
      );
}
