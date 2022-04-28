// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/UserModel.dart';
import 'package:mad_project/create_sheet.dart';
import 'package:mad_project/login.dart';
import 'package:mad_project/modify_sheets.dart';
import 'imageCarousel.dart';
import 'body.dart';
import 'referenceMaterial.dart';
import 'loading.dart';
import 'todoList.dart';
import 'reminder.dart';
import 'classList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel userLoggedIn = UserModel();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    setState(() {
      _loading = true;
    });
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      userLoggedIn = UserModel.fromMap(value.data());
      setState(() {});
    });
    setState(() {
      _loading = false;
    });
  }

  Widget build(BuildContext context) {
    final CreateButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF8E334C),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.width / 4,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ClassList()));
          },
          child: Text(
            "Create",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFFEC9454),
                fontWeight: FontWeight.bold),
          )),
    );
    final ModifyButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF8E334C),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.width / 4,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ModifySheetsPage()));
          },
          child: Text(
            "Modify",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFFEC9454),
                fontWeight: FontWeight.bold),
          )),
    );

    final CloseBottomSheetButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF8E334C),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.width / 4,
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Back",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFFEC9454),
                fontWeight: FontWeight.bold),
          )),
    );

    void BottomSheet() {
      showModalBottomSheet<void>(
        context: context,
        backgroundColor: Color(0xFFEC9454),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(20), child: CreateButton)),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(20), child: ModifyButton)),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CloseBottomSheetButton,
                  ))
                ],
              ),
            ),
          );
        },
      );
    }

    return _loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Color(0xFFEC9454)),
              title: Text(
                "T.I.M.S",
              ),
            ),
            drawer: Drawer(
              child: ListView(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/headerBackground.jpg'),
                              fit: BoxFit.cover)),
                      accountName: Text(
                        '${userLoggedIn.firstName}',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF8E334C),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Merriweather'),
                      ),
                      accountEmail: Text(
                        '${userLoggedIn.email}',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF8E334C),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Merriweather'),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text(
                        'Home',
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      dense: true,
                    ),
                    Divider(
                      color: Colors.grey[200],
                      height: 10,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
                      leading: Icon(Icons.people_alt_rounded),
                      title: Text(
                        'Attendance',
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      dense: true,
                    ),
                    Divider(
                      color: Colors.grey[200],
                      height: 10,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
                      leading: Icon(Icons.add_task_rounded),
                      title: Text(
                        'To-do',
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TodoList()));
                      },
                      dense: true,
                    ),
                    Divider(
                      color: Colors.grey[200],
                      height: 10,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
                      leading: Icon(Icons.access_alarm_rounded),
                      title: Text(
                        'Reminders',
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      },
                      dense: true,
                    ),
                    Divider(
                      color: Colors.grey[200],
                      height: 10,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
                      leading: Icon(Icons.analytics_rounded),
                      title: Text(
                        'Test Scores',
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClassList()));
                      },
                      dense: true,
                    ),
                    Divider(
                      color: Colors.grey[200],
                      height: 10,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
                      leading: Icon(Icons.article_outlined),
                      title: Text(
                        'Reference Material',
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Reference()));
                      },
                      dense: true,
                    ),
                    Divider(
                      color: Colors.grey[200],
                      height: 10,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
                      leading: Icon(Icons.logout_rounded),
                      title: Text(
                        'Log Out',
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {
                        // user!.signOut();
                        logout(context);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      dense: true,
                    ),
                  ]),
            ),
            body: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [ImageSlider(), Body()],
                ),
                SizedBox(),
                //Footer()
              ]),
            ),
          );
  }
}

Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
}
