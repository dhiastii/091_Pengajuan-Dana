import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:pengajuan_dana/controller/auth_controller.dart';
import 'package:pengajuan_dana/controller/list_controller.dart';
import 'package:pengajuan_dana/view/kmti/addpengajuan.dart';
import 'package:pengajuan_dana/view/kmti/editpengajuan.dart';
import 'package:pengajuan_dana/view/login.dart';
import 'package:pengajuan_dana/view/viewpdf.dart';

class ListPengajuan extends StatefulWidget {
  const ListPengajuan({Key? key}) : super(key: key);

  @override
  _ListPengajuanState createState() => _ListPengajuanState();
}

class _ListPengajuanState extends State<ListPengajuan> {
  var ls = ListController();
  var authctrl = AuthController();

  @override
  void initState() {
    super.initState();
    ls.getList();
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
              child: const Text(
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
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: StreamBuilder<List<DocumentSnapshot>>(
                stream: ls.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final List<DocumentSnapshot> pengajuanlist = snapshot.data!;
                  return ListView.builder(
                    itemCount: pengajuanlist.length,
                    itemBuilder: (context, index) {
                      var id = pengajuanlist[index]['id'].toString();
                      var namak = pengajuanlist[index]['namak'].toString();
                      var tgl = pengajuanlist[index]['tgl'].toString();
                      var desk = pengajuanlist[index]['desk'].toString();
                      var dana = pengajuanlist[index]['dana'].toString();
                      var pdf = pengajuanlist[index]['pdf'];
                      var status = pengajuanlist[index]['status'].toString();

                      Color boxColor;

                      // Menentukan warna sesuai status
                      switch (pengajuanlist[index]['status']) {
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

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: boxColor,
                          ),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditPengajuan(
                                          id: id,
                                          namak: namak,
                                          tgl: tgl,
                                          desk: desk,
                                          dana: dana),
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Konfirmasi'),
                                      content: const Text(
                                          'Apakah Anda yakin ingin menghapus data ini?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Batal'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            var rm =
                                                ls.removeList(id.toString());
                                            rm.then((value) {
                                              setState(() {
                                                ls.getList();
                                              });
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Hapus'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama Kegiatan: $namak',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Arsenal',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'Tanggal Kegiatan: $tgl',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Arsenal',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'Deskripsi Kegiatan: $desk',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Arsenal',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'Pengajuan Dana: $dana',
                                  style: const TextStyle(
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
                                status == null || status == 1
                                    ? const Text(
                                        'Status: Menunggu',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Arsenal',
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    : Text(
                                        'Status: $status',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Arsenal',
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                              ],
                            ),
                          ]),
                        )),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPengajuan()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
