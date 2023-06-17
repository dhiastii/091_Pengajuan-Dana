import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String nama;
  String email;
  String Uid;
  UserModel({
    required this.nama,
    required this.email,
    required this.Uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'email': email,
      'Uid': Uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      nama: map['nama'] ?? '',
      email: map['email'] ?? '',
      Uid: map['Uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
