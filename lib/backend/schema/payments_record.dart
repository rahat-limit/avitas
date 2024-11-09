import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentsRecord extends FirestoreRecord {
  PaymentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "paid_by" field.
  DocumentReference? _paidBy;
  DocumentReference? get paidBy => _paidBy;
  bool hasPaidBy() => _paidBy != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "latlng" field.
  LatLng? _latlng;
  LatLng? get latlng => _latlng;
  bool hasLatlng() => _latlng != null;

  // "paid_at" field.
  DateTime? _paidAt;
  DateTime? get paidAt => _paidAt;
  bool hasPaidAt() => _paidAt != null;

  // "paid_to" field.
  List<DocumentReference>? _paidTo;
  List<DocumentReference> get paidTo => _paidTo ?? const [];
  bool hasPaidTo() => _paidTo != null;

  void _initializeFields() {
    _paidBy = snapshotData['paid_by'] as DocumentReference?;
    _amount = castToType<int>(snapshotData['amount']);
    _photo = snapshotData['photo'] as String?;
    _latlng = snapshotData['latlng'] as LatLng?;
    _paidAt = snapshotData['paid_at'] as DateTime?;
    _paidTo = getDataList(snapshotData['paid_to']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentsRecord.fromSnapshot(s));

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentsRecord.fromSnapshot(s));

  static PaymentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentsRecordData({
  DocumentReference? paidBy,
  int? amount,
  String? photo,
  LatLng? latlng,
  DateTime? paidAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'paid_by': paidBy,
      'amount': amount,
      'photo': photo,
      'latlng': latlng,
      'paid_at': paidAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentsRecordDocumentEquality implements Equality<PaymentsRecord> {
  const PaymentsRecordDocumentEquality();

  @override
  bool equals(PaymentsRecord? e1, PaymentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.paidBy == e2?.paidBy &&
        e1?.amount == e2?.amount &&
        e1?.photo == e2?.photo &&
        e1?.latlng == e2?.latlng &&
        e1?.paidAt == e2?.paidAt &&
        listEquality.equals(e1?.paidTo, e2?.paidTo);
  }

  @override
  int hash(PaymentsRecord? e) => const ListEquality()
      .hash([e?.paidBy, e?.amount, e?.photo, e?.latlng, e?.paidAt, e?.paidTo]);

  @override
  bool isValidKey(Object? o) => o is PaymentsRecord;
}
