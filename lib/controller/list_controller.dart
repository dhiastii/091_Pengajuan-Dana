import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pengajuan_dana/model/list_model.dart';

class ListController {
  ///menghubungkan aplikasi dengan firebase dan collection pengajuan
  final listCollection = FirebaseFirestore.instance.collection('pengajuan');

  final StreamController<List<DocumentSnapshot>> streamController =
      StreamController<List<DocumentSnapshot>>.broadcast();

  Stream<List<DocumentSnapshot>> get stream => streamController.stream;

  ///add list pengajuan
  Future addList(ListModel lsmodel) async {
    ///convert ListModel ke map buat dihandle firestore sebagai json type
    final list = lsmodel.toMap();

    ///add list pengajuan ke collection dan get document reference
    final DocumentReference docRef = await listCollection.add(list);

    ///get document id buat list yang baru ditambah
    final String docId = docRef.id;

    ///create new ListModel pakai document id
    final ListModel listModel = ListModel(
        id: docId,
        namak: lsmodel.namak,
        tgl: lsmodel.tgl,
        desk: lsmodel.desk,
        dana: lsmodel.dana,
        pdf: lsmodel.pdf,
        status: lsmodel.status);

    ///mengupdate data yang diinputan
    await docRef.update(listModel.toMap());
  }

  ///update list pengajuan
  Future updateList(ListModel lsmodel) async {
    final ListModel listModel = ListModel(
        id: lsmodel.id,
        namak: lsmodel.namak,
        tgl: lsmodel.tgl,
        desk: lsmodel.desk,
        dana: lsmodel.dana,
        pdf: lsmodel.pdf,
        status: lsmodel.status);

    ///mengambil data dari listCollection, mencari id yang sama, lalu update datanya
    await listCollection.doc(lsmodel.id).update(listModel.toMap());

    ///memanggil data list
    await getList();
  }

  ///menghapus list pengajuan
  Future removeList(String id) async {
    ///mengambil data dari listCollection dan id yang sama, lalu delete
    await listCollection.doc(id).delete();
    await getList();
  }

  ///memanggil list
  Future getList() async {
    final list = await listCollection.get();
    streamController.add(list.docs);
    return list.docs;
  }
}
