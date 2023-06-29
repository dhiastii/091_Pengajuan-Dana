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
  late String? _filePath;

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
                  // ElevatedButton(
                  //   onPressed: _selectFile,
                  //   child: const Text('Upload Proposal'),
                  // ),
                  ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        ListModel cm = ListModel(
                            namak: namak!, tgl: tgl!, desk: desk!, dana: dana!);
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
                      //print(cm);
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
