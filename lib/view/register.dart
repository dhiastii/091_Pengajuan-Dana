import 'package:flutter/material.dart';
import 'package:pengajuan_dana/controller/auth_controller.dart';
import 'package:pengajuan_dana/model/user_model.dart';
import 'package:pengajuan_dana/view/login.dart';

class Register extends StatelessWidget {
  Register({super.key});

//globalkey buat kontrol dan akses formstate
//formstate buat validasi formulir di flutter
  final formkey = GlobalKey<FormState>;
  final authCtrl = AuthController();

  @override
  Widget build(BuildContext context) {
    String? nama;
    String? nim;
    String? nohp;
    String? jabatan;
    String? divisi;
    String? email;
    String? password;

    return Scaffold();
  }
}
