import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommuteRecord extends FirestoreRecord {
  CommuteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "worker" field.
  DocumentReference? _worker;
  DocumentReference? get worker => _worker;
  bool hasWorker() => _worker != null;

  // "come_in" field.
  DateTime? _comeIn;
  DateTime? get comeIn => _comeIn;
  bool hasComeIn() => _comeIn != null;

  // "come_out" field.
  DateTime? _comeOut;
  DateTime? get comeOut => _comeOut;
  bool hasComeOut() => _comeOut != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _worker = snapshotData['worker'] as DocumentReference?;
    _comeIn = snapshotData['come_in'] as DateTime?;
    _comeOut = snapshotData['come_out'] as DateTime?;
    _date = snapshotData['date'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('commute')
          : FirebaseFirestore.instance.collectionGroup('commute');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('commute').doc(id);

  static Stream<CommuteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommuteRecord.fromSnapshot(s));

  static Future<CommuteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommuteRecord.fromSnapshot(s));

  static CommuteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommuteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommuteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommuteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommuteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommuteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommuteRecordData({
  DocumentReference? worker,
  DateTime? comeIn,
  DateTime? comeOut,
  String? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'worker': worker,
      'come_in': comeIn,
      'come_out': comeOut,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommuteRecordDocumentEquality implements Equality<CommuteRecord> {
  const CommuteRecordDocumentEquality();

  @override
  bool equals(CommuteRecord? e1, CommuteRecord? e2) {
    return e1?.worker == e2?.worker &&
        e1?.comeIn == e2?.comeIn &&
        e1?.comeOut == e2?.comeOut &&
        e1?.date == e2?.date;
  }

  @override
  int hash(CommuteRecord? e) =>
      const ListEquality().hash([e?.worker, e?.comeIn, e?.comeOut, e?.date]);

  @override
  bool isValidKey(Object? o) => o is CommuteRecord;
}
