import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportGeneralRecord extends FirestoreRecord {
  ReportGeneralRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sort" field.
  String? _sort;
  String get sort => _sort ?? '';
  bool hasSort() => _sort != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "lb" field.
  double? _lb;
  double get lb => _lb ?? 0.0;
  bool hasLb() => _lb != null;

  // "money" field.
  double? _money;
  double get money => _money ?? 0.0;
  bool hasMoney() => _money != null;

  // "worker" field.
  DocumentReference? _worker;
  DocumentReference? get worker => _worker;
  bool hasWorker() => _worker != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "under_sort" field.
  DocumentReference? _underSort;
  DocumentReference? get underSort => _underSort;
  bool hasUnderSort() => _underSort != null;

  // "money_worker" field.
  double? _moneyWorker;
  double get moneyWorker => _moneyWorker ?? 0.0;
  bool hasMoneyWorker() => _moneyWorker != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _sort = snapshotData['sort'] as String?;
    _type = snapshotData['type'] as String?;
    _lb = castToType<double>(snapshotData['lb']);
    _money = castToType<double>(snapshotData['money']);
    _worker = snapshotData['worker'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _underSort = snapshotData['under_sort'] as DocumentReference?;
    _moneyWorker = castToType<double>(snapshotData['money_worker']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('report_general')
          : FirebaseFirestore.instance.collectionGroup('report_general');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('report_general').doc(id);

  static Stream<ReportGeneralRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportGeneralRecord.fromSnapshot(s));

  static Future<ReportGeneralRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportGeneralRecord.fromSnapshot(s));

  static ReportGeneralRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportGeneralRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportGeneralRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportGeneralRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportGeneralRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportGeneralRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportGeneralRecordData({
  String? sort,
  String? type,
  double? lb,
  double? money,
  DocumentReference? worker,
  DateTime? createdAt,
  DocumentReference? underSort,
  double? moneyWorker,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sort': sort,
      'type': type,
      'lb': lb,
      'money': money,
      'worker': worker,
      'created_at': createdAt,
      'under_sort': underSort,
      'money_worker': moneyWorker,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportGeneralRecordDocumentEquality
    implements Equality<ReportGeneralRecord> {
  const ReportGeneralRecordDocumentEquality();

  @override
  bool equals(ReportGeneralRecord? e1, ReportGeneralRecord? e2) {
    return e1?.sort == e2?.sort &&
        e1?.type == e2?.type &&
        e1?.lb == e2?.lb &&
        e1?.money == e2?.money &&
        e1?.worker == e2?.worker &&
        e1?.createdAt == e2?.createdAt &&
        e1?.underSort == e2?.underSort &&
        e1?.moneyWorker == e2?.moneyWorker;
  }

  @override
  int hash(ReportGeneralRecord? e) => const ListEquality().hash([
        e?.sort,
        e?.type,
        e?.lb,
        e?.money,
        e?.worker,
        e?.createdAt,
        e?.underSort,
        e?.moneyWorker
      ]);

  @override
  bool isValidKey(Object? o) => o is ReportGeneralRecord;
}
