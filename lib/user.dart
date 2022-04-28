import 'dart:convert';

class Userfields {
  static const String id = 'id';
  static const String name = 'name';
  static const String email = 'email';
  static const String begin = 'begin';
  static const String quiz1 = 'Quiz 1';
  static const String quiz2 = 'Quiz 2';
  static const String insem1 = 'Insem 1';
  static const String insem2 = 'Insem 2';

  static List<String> getfields() =>
      [id, name, email, begin, quiz1, quiz2, insem1, insem2];
}

class User {
  final int? id;
  final String name;
  final String email;
  final bool begin;
  final int quiz1;
  final int quiz2;
  final int insem1;
  final int insem2;

  const User({
    this.id,
    required this.name,
    required this.email,
    required this.begin,
    required this.quiz1,
    required this.quiz2,
    required this.insem1,
    required this.insem2,
  });

  User copy({
    int? id,
    String? name,
    String? email,
    bool? begin,
    int? quiz1,
    int? quiz2,
    int? insem1,
    int? insem2,
  }) =>
      User(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          begin: begin ?? this.begin,
          quiz1: quiz1 ?? this.quiz1,
          quiz2: quiz2 ?? this.quiz2,
          insem1: insem1 ?? this.insem1,
          insem2: insem2 ?? this.insem2);
  static User fromJson(Map<String, dynamic> json) => User(
        id: jsonDecode(json[Userfields.id]),
        name: json[Userfields.name],
        email: json[Userfields.email],
        begin: jsonDecode(json[Userfields.begin]),
        quiz1: jsonDecode(json[Userfields.quiz1]),
        quiz2: jsonDecode(json[Userfields.quiz2]),
        insem1: jsonDecode(json[Userfields.insem1]),
        insem2: jsonDecode(json[Userfields.insem2]),
      );
  Map<String, dynamic> toJson() => {
        Userfields.id: id,
        Userfields.name: name,
        Userfields.email: email,
        Userfields.begin: begin,
        Userfields.quiz1: quiz1,
        Userfields.quiz2: quiz2,
        Userfields.insem1: insem1,
        Userfields.insem2: insem2,
      };
}
