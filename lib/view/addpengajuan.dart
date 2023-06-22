import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pengajuan_dana/view/editpengajuan.dart';
import 'package:pengajuan_dana/view/list.dart';

class AddPengajuan extends StatelessWidget {
  const AddPengajuan({super.key});

  @override
  Widget build(BuildContext context) {
    String namak;
    String tgl;
    String desk;
    String dana;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Add Pengajuan Dana'),
        // ),
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
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(hintText: 'Nama Kegiatan'),
            onChanged: (value) {
              namak = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Tanggal Kegiatan'),
            onChanged: (value) {
              tgl = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Deskripsi Kegiatan'),
            onChanged: (value) {
              desk = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Pengajuan Dana'),
            onChanged: (value) {
              dana = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Upload Proposal'),
            onChanged: (value) {
              dana = value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditPengajuan()));
            },
            child: const Text('Tambah Pengajuan'),
          ),
        ]),
      )
    ]));
  }
}
