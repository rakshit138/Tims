import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Userfields{
  static const String id='id';
  static const String name='name';
  static const String email='email';
  static const String begin='begin';
  static const String attendance='attendance';

  static List<String> getfields()=>[id,name,email,begin,attendance];

}
class User
{
  final int? id;
  final String name;
  final String email;
  final bool begin;
  final String? attendance;
  const User(
  {
     this.id,
    required this.name,
    required this.email,
    required this.begin,
    this.attendance,


});

  User copy(
  {
    int? id,
    String? name,
    String? email,
    bool? begin,
    String? attendance
}
      )=>
      User(
        id:id ?? this.id,
        name:name ?? this.name,
        email:email ?? this.email,
        begin:begin ?? this.begin,
        attendance: attendance??this.attendance



      );
  static User fromJson(Map<String,dynamic>json)=>User(
    id:jsonDecode(json[Userfields.id]),
    name: json[Userfields.name],
    email: json[Userfields.email],
    begin: jsonDecode(json[Userfields.begin]),
    attendance: json[Userfields.attendance],

  );
  Map<String,dynamic> toJson()=>
      {
        Userfields.id: id,
        Userfields.name: name,
        Userfields.email: email,
        Userfields.begin: begin,
        Userfields.attendance: attendance,

      };


}