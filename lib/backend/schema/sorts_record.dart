import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SortsRecord extends FirestoreRecord {
  SortsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "total_weight" field.
  double? _totalWeight;
  double get totalWeight => _totalWeight ?? 0.0;
  bool hasTotalWeight() => _totalWeight != null;

  // "total_money" field.
  double? _totalMoney;
  double get totalMoney => _totalMoney ?? 0.0;
  bool hasTotalMoney() => _totalMoney != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  // "sort_name" field.
  String? _sortName;
  String get sortName => _sortName ?? '';
  bool hasSortName() => _sortName != null;

  // "total_weight_green" field.
  double? _totalWeightGreen;
  double get totalWeightGreen => _totalWeightGreen ?? 0.0;
  bool hasTotalWeightGreen() => _totalWeightGreen != null;

  // "total_weight_small" field.
  double? _totalWeightSmall;
  double get totalWeightSmall => _totalWeightSmall ?? 0.0;
  bool hasTotalWeightSmall() => _totalWeightSmall != null;

  // "last_time_updated" field.
  DateTime? _lastTimeUpdated;
  DateTime? get lastTimeUpdated => _lastTimeUpdated;
  bool hasLastTimeUpdated() => _lastTimeUpdated != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _totalWeight = castToType<double>(snapshotData['total_weight']);
    _totalMoney = castToType<double>(snapshotData['total_money']);
    _color = getSchemaColor(snapshotData['color']);
    _sortName = snapshotData['sort_name'] as String?;
    _totalWeightGreen = castToType<double>(snapshotData['total_weight_green']);
    _totalWeightSmall = castToType<double>(snapshotData['total_weight_small']);
    _lastTimeUpdated = snapshotData['last_time_updated'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sorts')
          : FirebaseFirestore.instance.collectionGroup('sorts');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('sorts').doc(id);

  static Stream<SortsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SortsRecord.fromSnapshot(s));

  static Future<SortsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SortsRecord.fromSnapshot(s));

  static SortsRecord fromSnapshot(DocumentSnapshot snapshot) => SortsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SortsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SortsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SortsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SortsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSortsRecordData({
  String? name,
  double? totalWeight,
  double? totalMoney,
  Color? color,
  String? sortName,
  double? totalWeightGreen,
  double? totalWeightSmall,
  DateTime? lastTimeUpdated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'total_weight': totalWeight,
      'total_money': totalMoney,
      'color': color,
      'sort_name': sortName,
      'total_weight_green': totalWeightGreen,
      'total_weight_small': totalWeightSmall,
      'last_time_updated': lastTimeUpdated,
    }.withoutNulls,
  );

  return firestoreData;
}

class SortsRecordDocumentEquality implements Equality<SortsRecord> {
  const SortsRecordDocumentEquality();

  @override
  bool equals(SortsRecord? e1, SortsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.totalWeight == e2?.totalWeight &&
        e1?.totalMoney == e2?.totalMoney &&
        e1?.color == e2?.color &&
        e1?.sortName == e2?.sortName &&
        e1?.totalWeightGreen == e2?.totalWeightGreen &&
        e1?.totalWeightSmall == e2?.totalWeightSmall &&
        e1?.lastTimeUpdated == e2?.lastTimeUpdated;
  }

  @override
  int hash(SortsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.totalWeight,
        e?.totalMoney,
        e?.color,
        e?.sortName,
        e?.totalWeightGreen,
        e?.totalWeightSmall,
        e?.lastTimeUpdated
      ]);

  @override
  bool isValidKey(Object? o) => o is SortsRecord;
}
