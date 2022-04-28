// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/login.dart';
import 'user_sheet_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  UserssheetApi.init();

  runApp(const MyApp());
}

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

//Color(0xFFEC9454) Orange color add const
//Color(0xFF8E334C) MAROON COLOR ADD CONST

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'T.I.M.S',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: Color(0xFFEC9454),
                  fontSize: 28,
                )),
            primaryColor: Color(0xFF8E334C),
            primarySwatch: primaryMaroon),
        home: LoginScreen());
  }
}
