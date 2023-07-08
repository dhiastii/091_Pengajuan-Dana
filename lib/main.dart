import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pengajuan_dana/view/kmti/listpengajuan.dart';
import 'package:pengajuan_dana/view/prodi/keputusan.dart';
import 'package:pengajuan_dana/view/login.dart';
import 'package:pengajuan_dana/view/register.dart';
import 'package:pengajuan_dana/view/splashscreen.dart';
import 'package:pengajuan_dana/view/prodi/viewprodi.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //buat setup firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Login());
  }
}
