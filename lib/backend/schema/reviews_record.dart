import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "from_user" field.
  DocumentReference? _fromUser;
  DocumentReference? get fromUser => _fromUser;
  bool hasFromUser() => _fromUser != null;

  // "to_user" field.
  DocumentReference? _toUser;
  DocumentReference? get toUser => _toUser;
  bool hasToUser() => _toUser != null;

  // "review" field.
  String? _review;
  String get review => _review ?? '';
  bool hasReview() => _review != null;

  // "like" field.
  bool? _like;
  bool get like => _like ?? false;
  bool hasLike() => _like != null;

  void _initializeFields() {
    _fromUser = snapshotData['from_user'] as DocumentReference?;
    _toUser = snapshotData['to_user'] as DocumentReference?;
    _review = snapshotData['review'] as String?;
    _like = snapshotData['like'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  DocumentReference? fromUser,
  DocumentReference? toUser,
  String? review,
  bool? like,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'from_user': fromUser,
      'to_user': toUser,
      'review': review,
      'like': like,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.fromUser == e2?.fromUser &&
        e1?.toUser == e2?.toUser &&
        e1?.review == e2?.review &&
        e1?.like == e2?.like;
  }

  @override
  int hash(ReviewsRecord? e) =>
      const ListEquality().hash([e?.fromUser, e?.toUser, e?.review, e?.like]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
