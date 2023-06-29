import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pengajuan_dana/view/addpengajuan.dart';
import 'package:pengajuan_dana/view/viewpengajuan.dart';

class ListPengajuan2 extends StatefulWidget {
  const ListPengajuan2({Key? key}) : super(key: key);

  @override
  _ListPengajuan2State createState() => _ListPengajuan2State();
}

class _ListPengajuan2State extends State<ListPengajuan2> {
  late List<Map<String, dynamic>> pengajuanList = [];

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
        };
      }).toList();

      setState(() {
        pengajuanList = data;
      });
    } catch (e) {
      print('Error fetching data: $e');
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
              height: 400,
              child: ListView.builder(
                itemCount: pengajuanList.length,
                itemBuilder: (BuildContext context, int index) {
                  var pengajuan = pengajuanList[index];
                  var namaKegiatan = pengajuan['namak'];
                  var tanggalKegiatan = pengajuan['tgl'];
                  var deskripsiKegiatan = pengajuan['desk'];
                  var pengajuanDana = pengajuan['dana'];

                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(59, 133, 199, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 700,
            left: 330,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPengajuan()),
                );
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(240),
                  image: DecorationImage(
                    image: AssetImage('assets/images/plus.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 700,
            left: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewProdi()),
                );
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(240),
                  image: DecorationImage(
                    image: AssetImage('assets/images/pen.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
