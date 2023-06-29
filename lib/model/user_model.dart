import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String uid;
  String nama;
  String nim;
  String nohp;
  String divisi;
  String email;
  String password;
  String role;
  UserModel({
    required this.uid,
    required this.nama,
    required this.nim,
    required this.nohp,
    required this.divisi,
    required this.email,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nama': nama,
      'nim': nim,
      'nohp': nohp,
      'divisi': divisi,
      'email': email,
      'password': password,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      nama: map['nama'] ?? '',
      nim: map['nim'] ?? '',
      nohp: map['nohp'] ?? '',
      divisi: map['divisi'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      role: map['role'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  static UserModel? fromFirebaseUser(User user) {}
}
