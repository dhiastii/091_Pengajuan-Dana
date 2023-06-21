import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListPengajuan extends StatefulWidget {
  const ListPengajuan({super.key});

  @override
  State<ListPengajuan> createState() => _ListPengajuanState();
}

class _ListPengajuanState extends State<ListPengajuan> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator DaftarpengajuanWidget - FRAME
    return Container(
        width: 360,
        height: 640,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 500,
              left: 12,
              child: Container(
                  width: 337,
                  height: 116,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Color.fromRGBO(59, 133, 199, 1),
                  ))),
          Positioned(
              top: 509,
              left: 21,
              child: Text(
                'Nama Kegiatan    : ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 535,
              left: 21,
              child: Text(
                'Tanggal Kegiatan : ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 561,
              left: 21,
              child: Text(
                'Pengajuan Dana  :',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 590,
              left: 21,
              child: Container(
                  width: 83,
                  height: 19,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45),
                    ),
                    color: Color.fromRGBO(5, 255, 0, 1),
                  ))),
          Positioned(
              top: 589,
              left: 33,
              child: Text(
                'Disetujui',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 15,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 62,
              left: 69,
              child: Text(
                'Daftar Pengajuan Dana',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 24,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 107,
              left: 12,
              child: Container(
                  width: 337,
                  height: 116,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Color.fromRGBO(59, 133, 199, 1),
                  ))),
          Positioned(
              top: 585,
              left: 304,
              child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(240),
                      topRight: Radius.circular(240),
                      bottomLeft: Radius.circular(240),
                      bottomRight: Radius.circular(240),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/images/plus.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 116,
              left: 21,
              child: Text(
                'Nama Kegiatan    : ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 142,
              left: 21,
              child: Text(
                'Tanggal Kegiatan : ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 168,
              left: 21,
              child: Text(
                'Pengajuan Dana  :',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 197,
              left: 21,
              child: Container(
                  width: 83,
                  height: 19,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45),
                    ),
                    color: Color.fromRGBO(5, 255, 0, 1),
                  ))),
          Positioned(
              top: 196,
              left: 33,
              child: Text(
                'Disetujui',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 15,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 369,
              left: 12,
              child: Container(
                  width: 337,
                  height: 116,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Color.fromRGBO(59, 133, 199, 1),
                  ))),
          Positioned(
              top: 378,
              left: 21,
              child: Text(
                'Nama Kegiatan    : ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 404,
              left: 21,
              child: Text(
                'Tanggal Kegiatan : ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 430,
              left: 21,
              child: Text(
                'Pengajuan Dana  :',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 459,
              left: 21,
              child: Container(
                  width: 83,
                  height: 20,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 1,
                        left: 0,
                        child: Container(
                            width: 83,
                            height: 19,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(45),
                                topRight: Radius.circular(45),
                                bottomLeft: Radius.circular(45),
                                bottomRight: Radius.circular(45),
                              ),
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ))),
                    Positioned(
                        top: 0,
                        left: 9,
                        child: Text(
                          'Menunggu',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Arsenal',
                              fontSize: 15,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                  ]))),
          Positioned(
              top: 238,
              left: 12,
              child: Container(
                  width: 337,
                  height: 116,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Color.fromRGBO(59, 133, 199, 1),
                  ))),
          Positioned(
              top: 247,
              left: 21,
              child: Text(
                'Nama Kegiatan    : ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 273,
              left: 21,
              child: Text(
                'Tanggal Kegiatan : ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 299,
              left: 21,
              child: Text(
                'Pengajuan Dana  :',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Arsenal',
                    fontSize: 16,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 328,
              left: 21,
              child: Container(
                  width: 83,
                  height: 19,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 83,
                            height: 19,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(45),
                                topRight: Radius.circular(45),
                                bottomLeft: Radius.circular(45),
                                bottomRight: Radius.circular(45),
                              ),
                              color: Color.fromRGBO(255, 2, 2, 1),
                            ))),
                    Positioned(
                        top: 0,
                        left: 20,
                        child: Text(
                          'Ditolak',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Arsenal',
                              fontSize: 15,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )),
                  ]))),
        ]));
  }
}
