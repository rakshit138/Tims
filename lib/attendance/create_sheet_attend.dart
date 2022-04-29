import 'package:flutter/material.dart';
//import 'package:marks/button_atten.dart';

import 'user_attend.dart';
import 'user_sheet_api_attend.dart';
import 'user_form_widget_attend.dart';

class CreateSheetPageAttend extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Attendance"),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(32),
            child: UserFormWidgetAtt(
              onSavedUser: (user) async {
                final id = await UserssheetApiAtt.getRowCount() + 1;
                final newUser = user.copy(id: id);
                await UserssheetApiAtt.insert([newUser.toJson()]);
                //insertUsers();
                // final user=User(
                // id:1,
                //name:'paul',
                //email:'vve@gmail.com',
                //begin:true,
                //);
                /* final user1={
            Userfields.id:2,
            Userfields.name:'paul1',
            Userfields.email:'vvqe@gmail.com',
            Userfields.begin:true,
          };
          final user2={
            Userfields.id:3,
            Userfields.name:'paul3',
            Userfields.email:'vve2@gmail.com',
            Userfields.begin:false,
          };

          */
                // await UserssheetApi.insert([user.toJson()]);
              },
            )),
      );
  Future insertUsers() async {
    final users = [
      UserAtt(
          id: 1,
          name: 'god',
          email: 'dv@gmail.com',
          begin: true,
          attendance: 'present'),
    ];
    final jsonUsers = users.map((user) => user.toJson()).toList();
    await UserssheetApiAtt.insert(jsonUsers);
  }
}
