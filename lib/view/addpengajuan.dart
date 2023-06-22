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
        appBar: AppBar(
          title: Text('Add Pengajuan Dana'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
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
        ));
  }
}
