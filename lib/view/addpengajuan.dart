import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

class AddPengajuan extends StatefulWidget {
  const AddPengajuan({Key? key});

  @override
  _AddPengajuanState createState() => _AddPengajuanState();
}

class _AddPengajuanState extends State<AddPengajuan> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _danaController = TextEditingController();

  late String _filePath;

  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path!;
      });
    }
  }

  Future<void> _tambahPengajuan() async {
    try {
      // Membuat dokumen baru pada koleksi "pengajuan"
      final pengajuanRef = _firestore.collection('pengajuan').doc();

      // Mengambil ID pengguna yang sedang login
      final user = _auth.currentUser;
      final userId = user?.uid;

      // Membuat data pengajuan
      final pengajuanData = {
        'nama_kegiatan': _namaController.text,
        'tanggal_kegiatan': _tanggalController.text,
        'deskripsi_kegiatan': _deskripsiController.text,
        'pengajuan_dana': _danaController.text,
        'user_id': userId,
      };

      // Menyimpan data pengajuan ke Firestore
      await pengajuanRef.set(pengajuanData);

      // Menyimpan file PDF ke Firebase Storage
      if (_filePath.isNotEmpty) {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('pengajuan')
            .child(pengajuanRef.id)
            .child('proposal.pdf');

        final fileData = File(_filePath);
        final uploadTask = storageRef.putFile(fileData);

        await uploadTask.whenComplete(() => null);
      }

      // Menampilkan pesan sukses
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Pengajuan Berhasil'),
            content: const Text('Pengajuan Anda telah ditambahkan.'),
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
    } catch (e) {
      // Menampilkan pesan error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Pengajuan Gagal'),
            content:
                const Text('Terjadi kesalahan saat menambahkan pengajuan.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 1,
            left: 130,
            child: Image.asset(
              'assets/images/logoatas.jpg',
              width: 150,
              height: 150,
            ),
          ),
          Positioned(
            top: 120,
            left: 65,
            child: Text(
              'Formulir Pengajuan Dana',
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
            top: 180,
            left: 30,
            right: 50,
            child: Column(
              children: [
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(hintText: 'Nama Kegiatan'),
                ),
                TextFormField(
                  controller: _tanggalController,
                  decoration:
                      const InputDecoration(hintText: 'Tanggal Kegiatan'),
                ),
                TextFormField(
                  controller: _deskripsiController,
                  decoration:
                      const InputDecoration(hintText: 'Deskripsi Kegiatan'),
                ),
                TextFormField(
                  controller: _danaController,
                  decoration: const InputDecoration(hintText: 'Pengajuan Dana'),
                ),
                ElevatedButton(
                  onPressed: _selectFile,
                  child: const Text('Upload Proposal'),
                ),
                ElevatedButton(
                  onPressed: _tambahPengajuan,
                  child: const Text('Tambah Pengajuan'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
