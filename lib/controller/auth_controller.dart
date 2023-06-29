import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pengajuan_dana/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  bool get succes => false;

  Future<UserModel?> registrasi(String nama, String nim, String nohp,
      String divisi, String email, String password, String role) async {
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);

      final User? user = userCredential.user;

      if (user != null) {
        final UserModel newUser = UserModel(
            uid: user.uid,
            nama: nama,
            nim: nim,
            nohp: nohp,
            divisi: divisi,
            email: user.email ?? '',
            password: password,
            role: role);

        await userCollection.doc(newUser.uid).set(newUser.toMap());

        return newUser;
      }
    } catch (e) {
      print('Error registering user: $e');
    }
  }

  Future<UserModel?> login(String email, String password) async {
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;

      if (user != null) {
        final DocumentSnapshot snapshot =
            await userCollection.doc(user.uid).get();

        final UserModel currentUser = UserModel(
            nama: snapshot['nama'] ?? '',
            uid: user.uid,
            divisi: snapshot['divisi'] ?? '',
            email: snapshot['email'] ?? '',
            nim: snapshot['nim'] ?? '',
            nohp: snapshot['nohp'] ?? '',
            password: snapshot['password'] ?? '',
            role: snapshot['role']);

        return currentUser;
      }
    } catch (e) {
      print('Error login in: $e');
    }

    return null;
  }

  UserModel? getCurrentUser() {
    final User? user = auth.currentUser;
    if (user != null) {
      return UserModel.fromFirebaseUser(user);
    }
    return null;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
