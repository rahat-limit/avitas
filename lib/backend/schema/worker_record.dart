import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkerRecord extends FirestoreRecord {
  WorkerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "totalCash" field.
  double? _totalCash;
  double get totalCash => _totalCash ?? 0.0;
  bool hasTotalCash() => _totalCash != null;

  // "totalWeight" field.
  double? _totalWeight;
  double get totalWeight => _totalWeight ?? 0.0;
  bool hasTotalWeight() => _totalWeight != null;

  // "isResponsible" field.
  bool? _isResponsible;
  bool get isResponsible => _isResponsible ?? false;
  bool hasIsResponsible() => _isResponsible != null;

  // "paid" field.
  bool? _paid;
  bool get paid => _paid ?? false;
  bool hasPaid() => _paid != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "total_hours" field.
  double? _totalHours;
  double get totalHours => _totalHours ?? 0.0;
  bool hasTotalHours() => _totalHours != null;

  // "isAccepted" field.
  bool? _isAccepted;
  bool get isAccepted => _isAccepted ?? false;
  bool hasIsAccepted() => _isAccepted != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "working_days" field.
  List<String>? _workingDays;
  List<String> get workingDays => _workingDays ?? const [];
  bool hasWorkingDays() => _workingDays != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _phone = snapshotData['phone'] as String?;
    _name = snapshotData['name'] as String?;
    _totalCash = castToType<double>(snapshotData['totalCash']);
    _totalWeight = castToType<double>(snapshotData['totalWeight']);
    _isResponsible = snapshotData['isResponsible'] as bool?;
    _paid = snapshotData['paid'] as bool?;
    _amount = castToType<double>(snapshotData['amount']);
    _user = snapshotData['user'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _totalHours = castToType<double>(snapshotData['total_hours']);
    _isAccepted = snapshotData['isAccepted'] as bool?;
    _location = snapshotData['location'] as LatLng?;
    _workingDays = getDataList(snapshotData['working_days']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('worker')
          : FirebaseFirestore.instance.collectionGroup('worker');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('worker').doc(id);

  static Stream<WorkerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkerRecord.fromSnapshot(s));

  static Future<WorkerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkerRecord.fromSnapshot(s));

  static WorkerRecord fromSnapshot(DocumentSnapshot snapshot) => WorkerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkerRecordData({
  String? phone,
  String? name,
  double? totalCash,
  double? totalWeight,
  bool? isResponsible,
  bool? paid,
  double? amount,
  DocumentReference? user,
  int? status,
  double? totalHours,
  bool? isAccepted,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'phone': phone,
      'name': name,
      'totalCash': totalCash,
      'totalWeight': totalWeight,
      'isResponsible': isResponsible,
      'paid': paid,
      'amount': amount,
      'user': user,
      'status': status,
      'total_hours': totalHours,
      'isAccepted': isAccepted,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkerRecordDocumentEquality implements Equality<WorkerRecord> {
  const WorkerRecordDocumentEquality();

  @override
  bool equals(WorkerRecord? e1, WorkerRecord? e2) {
    const listEquality = ListEquality();
    return e1?.phone == e2?.phone &&
        e1?.name == e2?.name &&
        e1?.totalCash == e2?.totalCash &&
        e1?.totalWeight == e2?.totalWeight &&
        e1?.isResponsible == e2?.isResponsible &&
        e1?.paid == e2?.paid &&
        e1?.amount == e2?.amount &&
        e1?.user == e2?.user &&
        e1?.status == e2?.status &&
        e1?.totalHours == e2?.totalHours &&
        e1?.isAccepted == e2?.isAccepted &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.workingDays, e2?.workingDays);
  }

  @override
  int hash(WorkerRecord? e) => const ListEquality().hash([
        e?.phone,
        e?.name,
        e?.totalCash,
        e?.totalWeight,
        e?.isResponsible,
        e?.paid,
        e?.amount,
        e?.user,
        e?.status,
        e?.totalHours,
        e?.isAccepted,
        e?.location,
        e?.workingDays
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkerRecord;
}
