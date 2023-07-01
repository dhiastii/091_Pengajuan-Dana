import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pengajuan_dana/controller/list_controller.dart';
import 'package:pengajuan_dana/view/addpengajuan.dart';
import 'package:pengajuan_dana/view/editpengajuan.dart';
import 'package:pengajuan_dana/view/viewpengajuan.dart';

class ListPengajuan2 extends StatefulWidget {
  const ListPengajuan2({Key? key}) : super(key: key);

  @override
  _ListPengajuan2State createState() => _ListPengajuan2State();
}

class _ListPengajuan2State extends State<ListPengajuan2> {
  var ls = ListController();

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
            Container(
              child: Image.asset(
                'assets/images/logoatas.jpg',
                width: 150,
                height: 150,
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
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: StreamBuilder<List<DocumentSnapshot>>(
                stream: ls.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
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
                      var status = pengajuanlist[index]['status'].toString();
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            child: Container(
                          width: double.infinity,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(59, 133, 199, 1),
                          ),
                          padding: EdgeInsets.only(left: 8.0),
                          child: Row(children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
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
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Konfirmasi'),
                                      content: Text(
                                          'Apakah Anda yakin ingin menghapus data ini?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('Batal'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            var rm =
                                                ls.removeList(id.toString());
                                            if (rm != null) {
                                              rm.then((value) {
                                                setState(() {
                                                  ls.getList();
                                                });
                                              });
                                            }
                                            Navigator.pop(context);
                                          },
                                          child: Text('Hapus'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Icon(
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
                                  'Nama Kegiatan: ' + namak,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Arsenal',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'Tanggal Kegiatan: ' + tgl,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Arsenal',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'Deskripsi Kegiatan: ' + desk,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Arsenal',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  'Pengajuan Dana: ' + dana,
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
            MaterialPageRoute(builder: (context) => AddPengajuan()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
