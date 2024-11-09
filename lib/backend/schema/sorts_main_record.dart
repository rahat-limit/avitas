import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SortsMainRecord extends FirestoreRecord {
  SortsMainRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _color = getSchemaColor(snapshotData['color']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sorts_main');

  static Stream<SortsMainRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SortsMainRecord.fromSnapshot(s));

  static Future<SortsMainRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SortsMainRecord.fromSnapshot(s));

  static SortsMainRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SortsMainRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SortsMainRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SortsMainRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SortsMainRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SortsMainRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSortsMainRecordData({
  String? title,
  Color? color,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'color': color,
    }.withoutNulls,
  );

  return firestoreData;
}

class SortsMainRecordDocumentEquality implements Equality<SortsMainRecord> {
  const SortsMainRecordDocumentEquality();

  @override
  bool equals(SortsMainRecord? e1, SortsMainRecord? e2) {
    return e1?.title == e2?.title && e1?.color == e2?.color;
  }

  @override
  int hash(SortsMainRecord? e) =>
      const ListEquality().hash([e?.title, e?.color]);

  @override
  bool isValidKey(Object? o) => o is SortsMainRecord;
}
