// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'button.dart';
import 'main.dart';
import 'user.dart';
import 'user_sheet_api.dart';
import 'user_form_widget.dart';

class CreateSheetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFFEC9454)),
          title: Text("Create"),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(32),
            child: UserFormWidget(
              onSavedUser: (user) async {
                final id = await UserssheetApi.getRowCount() + 1;
                final newUser = user.copy(id: id);
                await UserssheetApi.insert([newUser.toJson()]);
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
      User(
          id: 1,
          name: 'god',
          email: 'dv@gmail.com',
          //  begin: true,
          quiz1: 0,
          quiz2: 0,
          insem1: 0,
          insem2: 0),
    ];
    final jsonUsers = users.map((user) => user.toJson()).toList();
    await UserssheetApi.insert(jsonUsers);
  }
}
