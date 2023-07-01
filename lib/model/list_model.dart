import 'dart:convert';

class ListModel {
  String? id;
  final String namak;
  final String tgl;
  final String desk;
  final String dana;
  String? status;
  String? pdf;
  ListModel({
    this.id,
    required this.namak,
    required this.tgl,
    required this.desk,
    required this.dana,
    this.status,
    this.pdf,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'namak': namak,
      'tgl': tgl,
      'desk': desk,
      'dana': dana,
      'status': status,
      'pdf': pdf,
    };
  }

  factory ListModel.fromMap(Map<String, dynamic> map) {
    return ListModel(
      id: map['id'],
      namak: map['namak'] ?? '',
      tgl: map['tgl'] ?? '',
      desk: map['desk'] ?? '',
      dana: map['dana'] ?? '',
      status: map['status'],
      pdf: map['pdf'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ListModel.fromJson(String source) =>
      ListModel.fromMap(json.decode(source));
}
