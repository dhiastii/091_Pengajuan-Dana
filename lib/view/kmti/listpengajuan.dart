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

  ///memanggil listcontroller
  var authctrl = AuthController();

  ///memanggil authcontroller

  @override
  void initState() {
    super.initState();
    ls.getList();

    ///memanggil list ketika page dipanggil
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

                    ///membuat button sign out
                    onTap: () {
                      authctrl.signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));

                      ///navigasi ke halaman login
                    },
                    child: Container(
                      width: 50,
                      height: 30,

                      ///menampilkan image logout
                      child: Image.asset('assets/images/logout.png'),
                    )),
                SizedBox(
                  width: 2,
                ),
              ],
            ),
            Container(
              ///menampilkan logo
              child: Image.asset(
                'assets/images/logoatas.jpg',
                width: 150,
              ),
            ),
            Container(
              ///menampilkan teks daftar pengajuan dana
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
                    ///memeriksa apakah data tersedia atau tidak
                    return const CircularProgressIndicator();
                  }
                  final List<DocumentSnapshot> pengajuanlist = snapshot.data!;
                  return ListView.builder(
                    itemCount: pengajuanlist.length,
                    itemBuilder: (context, index) {
                      ///proses pengisian list dari firebase
                      var id = pengajuanlist[index]['id'].toString();
                      var namak = pengajuanlist[index]['namak'].toString();
                      var tgl = pengajuanlist[index]['tgl'].toString();
                      var desk = pengajuanlist[index]['desk'].toString();
                      var dana = pengajuanlist[index]['dana'].toString();
                      var pdf = pengajuanlist[index]['pdf'];
                      var status = pengajuanlist[index]['status'].toString();

                      Color boxColor;

                      /// Menentukan warna sesuai status
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

                                          ///navigasi ke halaman edit pengajuan
                                          id: id,
                                          namak: namak,
                                          tgl: tgl,
                                          desk: desk,
                                          dana: dana),
                                    ),
                                  );
                                },
                                child: const Icon(
                                  ///menampilkan icon edit untuk navigasi
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
                                      ///membuat dialog box untuk konfirmasi menghapus data
                                      title: const Text('Konfirmasi'),
                                      content: const Text(
                                          'Apakah Anda yakin ingin menghapus data ini?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),

                                          ///navigasi ke halaman sebelumnya jika batal menghapus data
                                          child: const Text('Batal'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            var rm =
                                                ls.removeList(id.toString());

                                            ///menghapus data dari list
                                            rm.then((value) {
                                              setState(() {
                                                ls.getList();
                                              });
                                            });
                                            Navigator.pop(context);

                                            ///navigasi ke halaman sebelumnya
                                          },
                                          child: const Text('Hapus'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Icon(
                                  /// menampilkan icon delete
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
                                  ///menampilkan data nama sesuai data di firebase
                                  'Nama Kegiatan: $namak',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Arsenal',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  //menampilkan data tanggal sesuai data di firebase
                                  'Tanggal Kegiatan: $tgl',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Arsenal',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  ///menampilkan data deskripsi sesuai data di firebase
                                  'Deskripsi Kegiatan: $desk',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Arsenal',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  ///menampilkan data dana sesuai data di firebase
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

                                        ///navigasi ke halaman view pdf
                                      },
                                      icon: const Icon(
                                        ///menampilkan icon pdf
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

                                    ///validasi jika status belum diberikan
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
                                        ///menampilkan data status sesuai data di firebase
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

            /// navigasi ke halaman add pengajuan
          );
        },
        child: const Icon(Icons.add),

        ///menampilkan button icon add
      ),
    );
  }
}
