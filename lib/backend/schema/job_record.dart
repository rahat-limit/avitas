import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobRecord extends FirestoreRecord {
  JobRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "price_worker" field.
  double? _priceWorker;
  double get priceWorker => _priceWorker ?? 0.0;
  bool hasPriceWorker() => _priceWorker != null;

  // "price_owner" field.
  double? _priceOwner;
  double get priceOwner => _priceOwner ?? 0.0;
  bool hasPriceOwner() => _priceOwner != null;

  // "type_payment" field.
  String? _typePayment;
  String get typePayment => _typePayment ?? '';
  bool hasTypePayment() => _typePayment != null;

  // "gr_per_lb" field.
  double? _grPerLb;
  double get grPerLb => _grPerLb ?? 0.0;
  bool hasGrPerLb() => _grPerLb != null;

  // "instruction" field.
  String? _instruction;
  String get instruction => _instruction ?? '';
  bool hasInstruction() => _instruction != null;

  // "dates_begin" field.
  List<DateTime>? _datesBegin;
  List<DateTime> get datesBegin => _datesBegin ?? const [];
  bool hasDatesBegin() => _datesBegin != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "total_money" field.
  double? _totalMoney;
  double get totalMoney => _totalMoney ?? 0.0;
  bool hasTotalMoney() => _totalMoney != null;

  // "total_weight" field.
  double? _totalWeight;
  double get totalWeight => _totalWeight ?? 0.0;
  bool hasTotalWeight() => _totalWeight != null;

  // "additional_expenses" field.
  double? _additionalExpenses;
  double get additionalExpenses => _additionalExpenses ?? 0.0;
  bool hasAdditionalExpenses() => _additionalExpenses != null;

  // "total_cash_for_hours" field.
  double? _totalCashForHours;
  double get totalCashForHours => _totalCashForHours ?? 0.0;
  bool hasTotalCashForHours() => _totalCashForHours != null;

  // "total_hours" field.
  double? _totalHours;
  double get totalHours => _totalHours ?? 0.0;
  bool hasTotalHours() => _totalHours != null;

  // "payment_recieved" field.
  bool? _paymentRecieved;
  bool get paymentRecieved => _paymentRecieved ?? false;
  bool hasPaymentRecieved() => _paymentRecieved != null;

  // "payment_completed" field.
  bool? _paymentCompleted;
  bool get paymentCompleted => _paymentCompleted ?? false;
  bool hasPaymentCompleted() => _paymentCompleted != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as String?;
    _priceWorker = castToType<double>(snapshotData['price_worker']);
    _priceOwner = castToType<double>(snapshotData['price_owner']);
    _typePayment = snapshotData['type_payment'] as String?;
    _grPerLb = castToType<double>(snapshotData['gr_per_lb']);
    _instruction = snapshotData['instruction'] as String?;
    _datesBegin = getDataList(snapshotData['dates_begin']);
    _status = castToType<int>(snapshotData['status']);
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _totalMoney = castToType<double>(snapshotData['total_money']);
    _totalWeight = castToType<double>(snapshotData['total_weight']);
    _additionalExpenses =
        castToType<double>(snapshotData['additional_expenses']);
    _totalCashForHours =
        castToType<double>(snapshotData['total_cash_for_hours']);
    _totalHours = castToType<double>(snapshotData['total_hours']);
    _paymentRecieved = snapshotData['payment_recieved'] as bool?;
    _paymentCompleted = snapshotData['payment_completed'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('job');

  static Stream<JobRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobRecord.fromSnapshot(s));

  static Future<JobRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobRecord.fromSnapshot(s));

  static JobRecord fromSnapshot(DocumentSnapshot snapshot) => JobRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobRecordData({
  String? name,
  String? location,
  double? priceWorker,
  double? priceOwner,
  String? typePayment,
  double? grPerLb,
  String? instruction,
  int? status,
  DocumentReference? createdBy,
  double? totalMoney,
  double? totalWeight,
  double? additionalExpenses,
  double? totalCashForHours,
  double? totalHours,
  bool? paymentRecieved,
  bool? paymentCompleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'price_worker': priceWorker,
      'price_owner': priceOwner,
      'type_payment': typePayment,
      'gr_per_lb': grPerLb,
      'instruction': instruction,
      'status': status,
      'created_by': createdBy,
      'total_money': totalMoney,
      'total_weight': totalWeight,
      'additional_expenses': additionalExpenses,
      'total_cash_for_hours': totalCashForHours,
      'total_hours': totalHours,
      'payment_recieved': paymentRecieved,
      'payment_completed': paymentCompleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class JobRecordDocumentEquality implements Equality<JobRecord> {
  const JobRecordDocumentEquality();

  @override
  bool equals(JobRecord? e1, JobRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.priceWorker == e2?.priceWorker &&
        e1?.priceOwner == e2?.priceOwner &&
        e1?.typePayment == e2?.typePayment &&
        e1?.grPerLb == e2?.grPerLb &&
        e1?.instruction == e2?.instruction &&
        listEquality.equals(e1?.datesBegin, e2?.datesBegin) &&
        e1?.status == e2?.status &&
        e1?.createdBy == e2?.createdBy &&
        e1?.totalMoney == e2?.totalMoney &&
        e1?.totalWeight == e2?.totalWeight &&
        e1?.additionalExpenses == e2?.additionalExpenses &&
        e1?.totalCashForHours == e2?.totalCashForHours &&
        e1?.totalHours == e2?.totalHours &&
        e1?.paymentRecieved == e2?.paymentRecieved &&
        e1?.paymentCompleted == e2?.paymentCompleted;
  }

  @override
  int hash(JobRecord? e) => const ListEquality().hash([
        e?.name,
        e?.location,
        e?.priceWorker,
        e?.priceOwner,
        e?.typePayment,
        e?.grPerLb,
        e?.instruction,
        e?.datesBegin,
        e?.status,
        e?.createdBy,
        e?.totalMoney,
        e?.totalWeight,
        e?.additionalExpenses,
        e?.totalCashForHours,
        e?.totalHours,
        e?.paymentRecieved,
        e?.paymentCompleted
      ]);

  @override
  bool isValidKey(Object? o) => o is JobRecord;
}
