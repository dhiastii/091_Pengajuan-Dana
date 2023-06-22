import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pengajuan_dana/view/addpengajuan.dart';

class ListPengajuan extends StatefulWidget {
  const ListPengajuan({super.key});

  @override
  State<ListPengajuan> createState() => _ListPengajuanState();
}

class _ListPengajuanState extends State<ListPengajuan> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator DaftarpengajuanWidget - FRAME
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
        left: 85,
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
      // width: 360,
      // height: 640,
      // decoration: BoxDecoration(
      //   color: Color.fromRGBO(255, 255, 255, 1),
      // ),
      // child: Stack(children: <Widget>[
      Positioned(
          top: 160,
          left: 27,
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
          top: 170,
          left: 30,
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
          top: 195,
          left: 29,
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
          top: 220,
          left: 32,
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
          top: 245,
          left: 31,
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
          top: 247,
          left: 41,
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
    ]));
  }
}
