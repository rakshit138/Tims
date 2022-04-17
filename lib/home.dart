// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/UserModel.dart';
import 'package:mad_project/login.dart';
import 'imageCarousel.dart';
import 'body.dart';
import 'footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel userLoggedIn = UserModel();

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      userLoggedIn = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
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
                leading: Icon(Icons.access_alarm_rounded),
                title: Text(
                  'Reminders',
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
                leading: Icon(Icons.analytics_rounded),
                title: Text(
                  'Update Marks',
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
                leading: Icon(Icons.article_outlined),
                title: Text(
                  'Reference Material',
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



// Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//       ),
//       body: Column(
//         children: [
//           Container(
//             child: Text("welcome ${userLoggedIn.firstName}"),
//           ),
//           ActionChip(
//               label: Text("Log Out"),
//               onPressed: () {
//                 logout(context);
//               })
//         ],
//       ),
//     );


