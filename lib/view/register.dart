import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pengajuan_dana/controller/auth_controller.dart';
import 'package:pengajuan_dana/model/user_model.dart';
import 'package:pengajuan_dana/view/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  final authCtrl = AuthController();
  String? nama;
  String? nim;
  String? nohp;
  String? divisi;
  String? email;
  String? password;
  String role = 'K';

  bool eyeToogle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Positioned(
            top: 1,
            left: 130,
            child: Image.asset(
              'assets/images/logoatas.jpg',
              width: 150,
              height: 150,
            )),
        Positioned(
          top: 120,
          left: 170,
          child: Text(
            'Register',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Arsenal',
              fontSize: 24,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1,
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 50,
          right: 50,
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
                    // Validasi
                    if (value == null || value.isEmpty) {
                      return 'Email harus diisi';
                    } else if (!value.contains("@") || !value.contains(".")) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(hintText: 'Password'),
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password harus diisi";
                    } else if (value.length < 6) {
                      return "Password minimal berisi 6 karakter";
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Login()));
                    if (formkey.currentState!.validate()) {
                      UserModel? registeredUser = await authCtrl.registrasi(
                          nama!, nim!, nohp!, divisi!, email!, password!, role);

                      if (registeredUser != null) {
                        // Registration success
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Registration Success'),
                              content: const Text(
                                  'You have successfully registered'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    print(registeredUser.nama);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Login();
                                    }));
                                    // Navigate to the next screen or perform any desired action
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // Registration failed
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Registration Failed'),
                              content: const Text(
                                  'Please check your email or password!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Register()));
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  },
                  child: const Text('Register'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
