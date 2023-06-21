import 'package:flutter/material.dart';
import 'package:pengajuan_dana/controller/auth_controller.dart';
import 'package:pengajuan_dana/model/user_model.dart';
import 'package:pengajuan_dana/view/SplashScreen.dart';
import 'package:pengajuan_dana/view/list.dart';

class Login2 extends StatelessWidget {
  Login2({super.key});
  final formkey = GlobalKey<FormState>();

  final authCr = AuthController();

  @override
  Widget build(BuildContext context) {
    String? email;

    String? password;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logoatas.jpg',
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 30,
            left: 170,
            child: Text(
              'Login',
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
            top: 160,
            left: 50,
            right: 50,
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Email'),
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Password'),
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        UserModel? registeredUser = await authCr
                            .signInWithEmailAndPassword(email!, password!);

                        if (registeredUser != null) {
                          // Registration successful
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Login Success'),
                                content: const Text(
                                    'You have successfully logged in.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      print(registeredUser.nama);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return ListPengajuan();
                                        }),
                                      );
                                      //Navigate to the next screen or perform any desired action
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
                                title: const Text('Login Failed'),
                                content:
                                    const Text('Check your email or password!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
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
                    child: const Text('Login'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SplashScreenn(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
