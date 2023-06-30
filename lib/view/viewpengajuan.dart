import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pengajuan_dana/controller/list_controller.dart';
import 'package:pengajuan_dana/view/addpengajuan.dart';
import 'package:pengajuan_dana/view/keputusan.dart';
import 'package:pengajuan_dana/view/viewpengajuan.dart';

class ViewProdi extends StatefulWidget {
  const ViewProdi({Key? key}) : super(key: key);

  @override
  _ViewProdiState createState() => _ViewProdiState();
}

class _ViewProdiState extends State<ViewProdi> {
  late List<Map<String, dynamic>> pengajuanList = [];
  var ls = ListController();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('pengajuan').get();

      final List<Map<String, dynamic>> data = snapshot.docs.map((doc) {
        final Map<String, dynamic> docData = doc.data() as Map<String, dynamic>;
        return {
          'namak': docData['namak'],
          'tgl': docData['tgl'],
          'desk': docData['desk'],
          'dana': docData['dana'],
          'status': docData['status'],
        };
      }).toList();

      setState(() {
        pengajuanList = data;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void _navigateToKeputusan(Map<String, dynamic> pengajuan) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Keputusan(
          namaKegiatan: pengajuan['namak'],
          tanggalKegiatan: pengajuan['tgl'],
          deskripsiKegiatan: pengajuan['desk'],
          pengajuanDana: pengajuan['dana'],
        ),
      ),
    );
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
            left: 75,
            child: Text(
              'Daftar Pengajuan Dana',
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
            top: 160,
            left: 27,
            child: Container(
              width: 337,
              height: 550,
              child: ListView.builder(
                itemCount: pengajuanList.length,
                itemBuilder: (BuildContext context, int index) {
                  var pengajuan = pengajuanList[index];
                  var namaKegiatan = pengajuan['namak'];
                  var tanggalKegiatan = pengajuan['tgl'];
                  var deskripsiKegiatan = pengajuan['desk'];
                  var pengajuanDana = pengajuan['dana'];
                  var status = pengajuan['status'];

                  return GestureDetector(
                      onTap: () {
                        _navigateToKeputusan(pengajuan);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(59, 133, 199, 1),
                          ),
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama Kegiatan: $namaKegiatan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Arsenal',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                'Tanggal Kegiatan: $tanggalKegiatan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Arsenal',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                'Deskripsi Kegiatan: $deskripsiKegiatan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Arsenal',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                'Pengajuan Dana: $pengajuanDana',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Arsenal',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                'Status: $status',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Arsenal',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
