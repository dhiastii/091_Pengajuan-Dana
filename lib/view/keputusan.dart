import 'package:flutter/material.dart';
import 'package:pengajuan_dana/controller/list_controller.dart';
import 'package:pengajuan_dana/view/cobalist.dart';
import 'package:pengajuan_dana/view/viewpengajuan.dart';

class Keputusan extends StatefulWidget {
  final String namaKegiatan;
  final String tanggalKegiatan;
  final String deskripsiKegiatan;
  final String pengajuanDana;

  const Keputusan({
    Key? key,
    required this.namaKegiatan,
    required this.tanggalKegiatan,
    required this.deskripsiKegiatan,
    required this.pengajuanDana,
  }) : super(key: key);

  @override
  _KeputusanState createState() => _KeputusanState();
}

class _KeputusanState extends State<Keputusan> {
  String status = 'Menunggu';

  void _setApprovalStatus(String newStatus) {
    setState(() {
      status = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        left: 115,
        child: Text(
          'Pengajuan Dana',
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
      Padding(
        padding: EdgeInsets.fromLTRB(10, 165, 10, 300),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue, // Warna biru
          ),
          padding: EdgeInsets.all(10), // Padding di dalam kotak
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Kegiatan: ${widget.namaKegiatan}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Tanggal Kegiatan: ${widget.tanggalKegiatan}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Deskripsi Kegiatan: ${widget.deskripsiKegiatan}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                'Pengajuan Dana: ${widget.pengajuanDana}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                'Status: $status',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(
                  height: 10), // Memberikan jarak antara teks status dan button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _setApprovalStatus('Diterima');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green, // Warna latar belakang hijau
                    ),
                    child: const Text('Terima'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _setApprovalStatus('Ditolak');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Warna latar belakang merah
                    ),
                    child: const Text('Tolak'),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    ]));
  }
}
