import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pengajuan_dana/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  /// Membuat objek untuk Firebase Authentication
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  /// Mendapatkan referensi koleksi 'users' pada Firestore

  bool get succes => false;

  /// Properti untuk mengecek sukses (belum diimplementasikan)

  /// Fungsi untuk melakukan registrasi user baru
  Future<UserModel?> registrasi(String nama, String nim, String nohp,
      String divisi, String email, String password, String role) async {
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);

      /// Mendaftarkan pengguna baru dengan email dan password

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

        /// Menyimpan data pengguna baru ke Firestore

        return newUser;
      }
    } catch (e) {
      print('Terjadi kesalahan saat mendaftarkan pengguna: $e');
    }
  }

  /// Fungsi untuk melakukan login
  Future<UserModel?> login(String email, String password) async {
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);

      /// Proses login ke Firebase
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
      print('Terjadi kesalahan saat login: $e');
    }

    return null;
  }

  /// Fungsi untuk mendapatkan pengguna yang sedang login
  UserModel? getCurrentUser() {
    final User? user = auth.currentUser;
    if (user != null) {
      return UserModel.fromFirebaseUser(user);
    }
    return null;
  }

  /// Fungsi untuk keluar (logout)
  Future<void> signOut() async {
    await auth.signOut();
  }
}
