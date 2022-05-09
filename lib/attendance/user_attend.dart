// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/cupertino.dart';

class UserfieldsAtt {
  static const String id = 'id';
  static const String name = 'name';
  static const String email = 'email';
  static const String begin = 'begin';
  static String attendance = 'attendance';

  static List<String> getfields() => [id, name, email, begin, attendance];
}

class UserAtt {
  final int? id;
  final String name;
  final String email;
  final bool begin;
  final String? attendance;
  const UserAtt({
    this.id,
    required this.name,
    required this.email,
    required this.begin,
    this.attendance,
  });

  UserAtt copy(
          {int? id,
          String? name,
          String? email,
          bool? begin,
          String? attendance}) =>
      UserAtt(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          begin: begin ?? this.begin,
          attendance: attendance ?? this.attendance);
  static UserAtt fromJson(Map<String, dynamic> json) => UserAtt(
        id: jsonDecode(json[UserfieldsAtt.id]),
        name: json[UserfieldsAtt.name],
        email: json[UserfieldsAtt.email],
        begin: jsonDecode(json[UserfieldsAtt.begin]),
        attendance: json[UserfieldsAtt.attendance],
      );
  Map<String, dynamic> toJson() => {
        UserfieldsAtt.id: id,
        UserfieldsAtt.name: name,
        UserfieldsAtt.email: email,
        UserfieldsAtt.begin: begin,
        UserfieldsAtt.attendance: attendance,
      };
}
