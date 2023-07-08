import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pengajuan_dana/model/list_model.dart';

class ListController {
  final listCollection = FirebaseFirestore.instance.collection('pengajuan');

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  //add contact
  Future addList(ListModel lsmodel) async {
    //convert ContactModel ke map buat dihandle firestore sebagai json type
    final list = lsmodel.toMap();
    //add contasct ke collection dan get document reference
    final DocumentReference docRef = await listCollection.add(list);
    //get document id buat contact yang baru ditambah
    final String docId = docRef.id;
    //create new ContactModel pakai document id
    final ListModel listModel = ListModel(
        id: docId,
        namak: lsmodel.namak,
        tgl: lsmodel.tgl,
        desk: lsmodel.desk,
        dana: lsmodel.dana,
        pdf: lsmodel.pdf,
        status: lsmodel.status);

    await docRef.update(listModel.toMap());
  }

  Future updateList(ListModel lsmodel) async {
    final ListModel listModel = ListModel(
        id: lsmodel.id,
        namak: lsmodel.namak,
        tgl: lsmodel.tgl,
        desk: lsmodel.desk,
        dana: lsmodel.dana,
        pdf: lsmodel.pdf,
        status: lsmodel.status);

    await listCollection.doc(lsmodel.id).update(listModel.toMap());
    await getList();
  }

  Future removeList(String id) async {
    await listCollection.doc(id).delete();
    await getList();
  }

  Future getList() async {
    final list = await listCollection.get();
    streamController.add(list.docs);
    return list.docs;
  }
}
