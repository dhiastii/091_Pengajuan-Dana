import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String Uid;
  String nama;
  String nim;
  String nohp;
  String divisi;
  String email;
  String password;
  String role;
  UserModel({
    required this.Uid,
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
      'Uid': Uid,
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
      Uid: map['Uid'] ?? '',
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

  UserModel copyWith({
    String? Uid,
    String? nama,
    String? nim,
    String? nohp,
    String? divisi,
    String? email,
    String? password,
    String? role,
  }) {
    return UserModel(
      Uid: Uid ?? this.Uid,
      nama: nama ?? this.nama,
      nim: nim ?? this.nim,
      nohp: nohp ?? this.nohp,
      divisi: divisi ?? this.divisi,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  @override
  String toString() {
    return 'UserModel(Uid: $Uid, nama: $nama, nim: $nim, nohp: $nohp, divisi: $divisi, email: $email, password: $password, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.Uid == Uid &&
        other.nama == nama &&
        other.nim == nim &&
        other.nohp == nohp &&
        other.divisi == divisi &&
        other.email == email &&
        other.password == password &&
        other.role == role;
  }

  @override
  int get hashCode {
    return Uid.hashCode ^
        nama.hashCode ^
        nim.hashCode ^
        nohp.hashCode ^
        divisi.hashCode ^
        email.hashCode ^
        password.hashCode ^
        role.hashCode;
  }
}
