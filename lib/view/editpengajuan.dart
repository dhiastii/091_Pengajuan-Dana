import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pengajuan_dana/controller/list_controller.dart';
import 'package:pengajuan_dana/model/list_model.dart';
import 'package:pengajuan_dana/view/addpengajuan.dart';
import 'package:pengajuan_dana/view/cobalist.dart';

class EditPengajuan extends StatefulWidget {
  const EditPengajuan(
      {super.key, this.id, this.namak, this.tgl, this.desk, this.dana});

  final String? id;
  final String? namak;
  final String? tgl;
  final String? desk;
  final String? dana;

  @override
  State<EditPengajuan> createState() => _EditPengajuanState();
}

class _EditPengajuanState extends State<EditPengajuan> {
  var listController = ListController();

  final formkey = GlobalKey<FormState>();

  //final List<DocumentSnapshot> data = snapshot.data!;

  String? newnamak;
  String? newtgl;
  String? newdesk;
  String? newdana;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Nama Kegiatan : '),
                onSaved: (value) {
                  newnamak = value;
                },
                initialValue: widget.namak,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Tanggal Kegiatan : '),
                onSaved: (value) {
                  newtgl = value;
                },
                initialValue: widget.tgl,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Deksripsi Kegiatan : '),
                onSaved: (value) {
                  newdesk = value;
                },
                initialValue: widget.desk,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Pengajuan Dana : Rp'),
                onSaved: (value) {
                  newdana = value;
                },
                initialValue: widget.dana,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    ListModel ls = ListModel(
                        dana: newdana!,
                        desk: newdesk!,
                        namak: newnamak!,
                        tgl: newtgl!,
                        id: widget.id);
                    listController.updateList(ls);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Pengajuan berhasil di update')));

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListPengajuan2(),
                      ),
                    );
                  } else {
                    Text('Gagal Update');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListPengajuan2(),
                        ));
                  }
                },
                child: const Text('Edit Pengajuan'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
