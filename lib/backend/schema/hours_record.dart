import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HoursRecord extends FirestoreRecord {
  HoursRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "worker" field.
  String? _worker;
  String get worker => _worker ?? '';
  bool hasWorker() => _worker != null;

  // "hours_worked" field.
  double? _hoursWorked;
  double get hoursWorked => _hoursWorked ?? 0.0;
  bool hasHoursWorked() => _hoursWorked != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "cash" field.
  double? _cash;
  double get cash => _cash ?? 0.0;
  bool hasCash() => _cash != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _worker = snapshotData['worker'] as String?;
    _hoursWorked = castToType<double>(snapshotData['hours_worked']);
    _date = snapshotData['date'] as String?;
    _cash = castToType<double>(snapshotData['cash']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('hours')
          : FirebaseFirestore.instance.collectionGroup('hours');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('hours').doc(id);

  static Stream<HoursRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HoursRecord.fromSnapshot(s));

  static Future<HoursRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HoursRecord.fromSnapshot(s));

  static HoursRecord fromSnapshot(DocumentSnapshot snapshot) => HoursRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HoursRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HoursRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HoursRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HoursRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHoursRecordData({
  String? worker,
  double? hoursWorked,
  String? date,
  double? cash,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'worker': worker,
      'hours_worked': hoursWorked,
      'date': date,
      'cash': cash,
    }.withoutNulls,
  );

  return firestoreData;
}

class HoursRecordDocumentEquality implements Equality<HoursRecord> {
  const HoursRecordDocumentEquality();

  @override
  bool equals(HoursRecord? e1, HoursRecord? e2) {
    return e1?.worker == e2?.worker &&
        e1?.hoursWorked == e2?.hoursWorked &&
        e1?.date == e2?.date &&
        e1?.cash == e2?.cash;
  }

  @override
  int hash(HoursRecord? e) =>
      const ListEquality().hash([e?.worker, e?.hoursWorked, e?.date, e?.cash]);

  @override
  bool isValidKey(Object? o) => o is HoursRecord;
}
