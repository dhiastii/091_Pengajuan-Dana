import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pengajuan_dana/controller/auth_controller.dart';
import 'package:pengajuan_dana/view/cobalogin.dart';

class CobaPage extends StatefulWidget {
  const CobaPage({super.key});

  @override
  State<CobaPage> createState() => _CobaPageState();
}

class _CobaPageState extends State<CobaPage> {
  final formkey = GlobalKey<FormState>();
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

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Nama'),
                  onChanged: (value) {
                    nama = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'NIM'),
                  onChanged: (value) {
                    nim = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'No Hp'),
                  onChanged: (value) {
                    nohp = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Jabatan'),
                  onChanged: (value) {
                    jabatan = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Divisi'),
                  onChanged: (value) {
                    divisi = value;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Email'),
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    // Validasi menggunakan regex
                    if (value == null || value.isEmpty) {
                      return 'Email harus diisi';
                    }
                    // Regex pattern untuk validasi email
                    final emailRegex =
                        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';
                    // Mengecek apakah nilai email cocok dengan regex pattern
                    if (!RegExp(emailRegex).hasMatch(value)) {
                      return 'Email tidak valid';
                    }
                    return null; // Mengembalikan null jika email valid
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Password'),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login2()));
                    // if (formkey.currentState!.validate()) {
                    //   UserModel? registeredUser =
                    //       await authCtrl.registerWithEmailAndPassword(
                    //     email!,
                    //     password!,
                    //     nama!,
                    //   );

                    //   if (registeredUser != null) {
                    //     // Registration success
                    //     showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           title: const Text('Registration Success'),
                    //           content: const Text(
                    //               'You have successfully registered'),
                    //           actions: <Widget>[
                    //             TextButton(
                    //               onPressed: () {
                    //                 print(registeredUser.nama);
                    //                 Navigator.push(context,
                    //                     MaterialPageRoute(builder: (context) {
                    //                   return Login();
                    //                 }));
                    //                 // Navigate to the next screen or perform any desired action
                    //               },
                    //               child: const Text('OK'),
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   } else {
                    //     // Registration failed
                    //     showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           title: const Text('Registration Failed'),
                    //           content: const Text(
                    //               'Please check your email or password!'),
                    //           actions: <Widget>[
                    //             TextButton(
                    //               onPressed: () {
                    //                 Navigator.pop(context);
                    //               },
                    //               child: const Text('OK'),
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //   }
                    // }
                  },
                  child: const Text('Register'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
