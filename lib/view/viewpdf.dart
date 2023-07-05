import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class viewPdf extends StatefulWidget {
  final String pdfurl;
  const viewPdf({super.key, required this.pdfurl});

  @override
  State<viewPdf> createState() => _viewPdfState();
}

class _viewPdfState extends State<viewPdf> {
  PDFDocument? document;

  void inisialisePdf() async {
    document = await PDFDocument.fromURL(widget.pdfurl);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inisialisePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: document != null
            ? PDFViewer(
                document: document!,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
