import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListController {
  final listCollection = FirebaseFirestore.instance.collection('pengajuan');

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;
}
