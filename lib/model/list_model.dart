import 'dart:convert';

class ListModel {
  String? id;
  final String namak;
  final String tgl;
  final String desk;
  final String dana;
  ListModel({
    this.id,
    required this.namak,
    required this.tgl,
    required this.desk,
    required this.dana,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'namak': namak,
      'tgl': tgl,
      'desk': desk,
      'dana': dana,
    };
  }

  factory ListModel.fromMap(Map<String, dynamic> map) {
    return ListModel(
      id: map['id'],
      namak: map['namak'] ?? '',
      tgl: map['tgl'] ?? '',
      desk: map['desk'] ?? '',
      dana: map['dana'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ListModel.fromJson(String source) =>
      ListModel.fromMap(json.decode(source));

  ListModel copyWith({
    String? id,
    String? namak,
    String? tgl,
    String? desk,
    String? dana,
  }) {
    return ListModel(
      id: id ?? this.id,
      namak: namak ?? this.namak,
      tgl: tgl ?? this.tgl,
      desk: desk ?? this.desk,
      dana: dana ?? this.dana,
    );
  }

  @override
  String toString() {
    return 'ListModel(id: $id, namak: $namak, tgl: $tgl, desk: $desk, dana: $dana)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListModel &&
        other.id == id &&
        other.namak == namak &&
        other.tgl == tgl &&
        other.desk == desk &&
        other.dana == dana;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        namak.hashCode ^
        tgl.hashCode ^
        desk.hashCode ^
        dana.hashCode;
  }
}
