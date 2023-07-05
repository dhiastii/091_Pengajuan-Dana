import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pengajuan_dana/controller/list_controller.dart';
import 'package:pengajuan_dana/model/list_model.dart';
import 'package:pengajuan_dana/view/kmti/addpengajuan.dart';
import 'package:pengajuan_dana/view/kmti/listpengajuan.dart';

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
        body: Stack(children: <Widget>[
      Positioned(
          top: 1,
          left: 120,
          child: Image.asset(
            'assets/images/logoatas.jpg',
            width: 150,
            height: 150,
          )),
      Positioned(
        top: 120,
        left: 90,
        child: Text(
          'Edit Pengajuan Dana',
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
        top: 150,
        left: 30,
        right: 30,
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
                        builder: (context) => const ListPengajuan(),
                      ),
                    );
                  } else {
                    Text('Gagal Update');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListPengajuan(),
                        ));
                  }
                },
                child: const Text('Edit Pengajuan'),
              )
            ],
          ),
        ),
      ),
    ]));
  }
}
