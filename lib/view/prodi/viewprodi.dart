import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pengajuan_dana/controller/auth_controller.dart';
import 'package:pengajuan_dana/controller/list_controller.dart';
import 'package:pengajuan_dana/view/kmti/addpengajuan.dart';
import 'package:pengajuan_dana/view/prodi/keputusan.dart';
import 'package:pengajuan_dana/view/login.dart';
import 'package:pengajuan_dana/view/prodi/viewprodi.dart';
import 'package:pengajuan_dana/view/viewpdf.dart';

class ViewProdi extends StatefulWidget {
  const ViewProdi({super.key});

  @override
  _ViewProdiState createState() => _ViewProdiState();
}

class _ViewProdiState extends State<ViewProdi> {
  late List<Map<String, dynamic>> pengajuanList = [];
  var ls = ListController();
  var authctrl = AuthController();

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
          'id': docData['id'],
          'namak': docData['namak'],
          'tgl': docData['tgl'],
          'desk': docData['desk'],
          'dana': docData['dana'],
          'pdf': docData['pdf'],
          'status': docData['status']
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
          id: pengajuan['id'],
          namaKegiatan: pengajuan['namak'],
          tanggalKegiatan: pengajuan['tgl'],
          deskripsiKegiatan: pengajuan['desk'],
          pengajuanDana: pengajuan['dana'],
          pdf: pengajuan['pdf'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {
                      authctrl.signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Container(
                      width: 50,
                      height: 30,
                      child: Image.asset('assets/images/logout.png'),
                    )),
                SizedBox(
                  width: 2,
                ),
              ],
            ),
            Container(
              child: Image.asset(
                'assets/images/logoatas.jpg',
                width: 150,
              ),
            ),
            Container(
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
            Container(
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
                  var pdf = pengajuan['pdf'];
                  var status = pengajuan['status'].toString();

                  Color boxColor;

                  // Menentukan warna sesuai status
                  switch (status) {
                    case 'Menunggu':
                      boxColor = Colors.grey;
                      break;
                    case 'Diterima':
                      boxColor = Colors.green;
                      break;
                    case 'Ditolak':
                      boxColor = Colors.red;
                      break;
                    default:
                      boxColor = Colors.blue;
                  }

                  return GestureDetector(
                    onTap: () {
                      _navigateToKeputusan(pengajuan);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: boxColor,
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
                            status == null
                                ? Text(
                                    'Status: Menunggu',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Arsenal',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                : Text(
                                    'Status: ' + status,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Arsenal',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                viewPdf(pdfurl: pdf)));
                                  },
                                  icon: const Icon(
                                    Icons.picture_as_pdf,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                const Text(
                                  'Dokumen Proposal',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Arsenal',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
