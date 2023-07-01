import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pengajuan_dana/controller/list_controller.dart';
import 'package:pengajuan_dana/model/list_model.dart';
import 'package:pengajuan_dana/view/cobalist.dart';

class AddPengajuan extends StatefulWidget {
  const AddPengajuan({super.key});

  @override
  State<AddPengajuan> createState() => _AddPengajuanState();
}

class _AddPengajuanState extends State<AddPengajuan> {
  var listController = ListController();

  final formkey = GlobalKey<FormState>();

  String? namak;
  String? tgl;
  String? desk;
  String? dana;
  PlatformFile? pickedFile;

  Future<void> _selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        pickedFile = result.files.first;
      });
    }
  }

  Future<void> _uploadFile() async {
    if (pickedFile != null) {
      final file = File(pickedFile!.path!);
      final fileName = pickedFile!.name;

      try {
        // Upload the file to Firebase Storage
        final storageRef = FirebaseStorage.instance.ref().child(fileName);
        final uploadTask = storageRef.putFile(file);
        final TaskSnapshot taskSnapshot = await uploadTask;

        // Retrieve the download URL of the uploaded file
        final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        // TODO: Save the download URL to Firestore or perform further actions
        // with the uploaded file.

        print('File uploaded successfully. Download URL: $downloadUrl');
      } catch (error) {
        print('Error uploading file: $error');
      }
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
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Nama Kegiatan'),
                    onChanged: (value) {
                      namak = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Tanggal Kegiatan'),
                    onChanged: (value) {
                      tgl = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Deskripsi Kegiatan'),
                    onChanged: (value) {
                      desk = value;
                    },
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Pengajuan Dana'),
                    onChanged: (value) {
                      dana = value;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Status'),
                    initialValue: 'Status : Menunggu',
                    enabled: false,
                  ),
                  if (pickedFile != null)
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text(pickedFile!.name),
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _selectFile,
                    child: const Text('Select Proposal'),
                  ),
                  ElevatedButton(
                    onPressed: _uploadFile,
                    child: const Text('Upload Proposal'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        ListModel cm = ListModel(
                            namak: namak!,
                            tgl: tgl!,
                            desk: desk!,
                            dana: dana!,
                            pdf: pickedFile?.name);
                        listController.addList(cm);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Proposal Added')));

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListPengajuan2(),
                          ),
                        );
                      }
                    },
                    child: const Text('Tambah Proposal'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
