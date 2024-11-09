import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "car" field.
  bool? _car;
  bool get car => _car ?? false;
  bool hasCar() => _car != null;

  // "karma" field.
  int? _karma;
  int get karma => _karma ?? 0;
  bool hasKarma() => _karma != null;

  // "expirience" field.
  String? _expirience;
  String get expirience => _expirience ?? '';
  bool hasExpirience() => _expirience != null;

  // "work_type" field.
  String? _workType;
  String get workType => _workType ?? '';
  bool hasWorkType() => _workType != null;

  // "role" field.
  int? _role;
  int get role => _role ?? 0;
  bool hasRole() => _role != null;

  // "working_days" field.
  List<DateTime>? _workingDays;
  List<DateTime> get workingDays => _workingDays ?? const [];
  bool hasWorkingDays() => _workingDays != null;

  // "jobs" field.
  List<DocumentReference>? _jobs;
  List<DocumentReference> get jobs => _jobs ?? const [];
  bool hasJobs() => _jobs != null;

  // "managers" field.
  List<DocumentReference>? _managers;
  List<DocumentReference> get managers => _managers ?? const [];
  bool hasManagers() => _managers != null;

  // "manager_code" field.
  String? _managerCode;
  String get managerCode => _managerCode ?? '';
  bool hasManagerCode() => _managerCode != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _car = snapshotData['car'] as bool?;
    _karma = castToType<int>(snapshotData['karma']);
    _expirience = snapshotData['expirience'] as String?;
    _workType = snapshotData['work_type'] as String?;
    _role = castToType<int>(snapshotData['role']);
    _workingDays = getDataList(snapshotData['working_days']);

    // Convert jobs strings to DocumentReferences
    final jobsList = snapshotData['jobs'] as List<dynamic>?;
    _jobs = jobsList
        ?.map((job) {
          if (job is DocumentReference) return job;
          if (job is String) return FirebaseFirestore.instance.doc(job);
          return null;
        })
        .whereType<DocumentReference>()
        .toList();

    // Convert managers strings to DocumentReferences
    final managersList = snapshotData['managers'] as List<dynamic>?;
    _managers = managersList
        ?.map((manager) {
          if (manager is DocumentReference) return manager;
          if (manager is String) return FirebaseFirestore.instance.doc(manager);
          return null;
        })
        .whereType<DocumentReference>()
        .toList();

    _managerCode = snapshotData['manager_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? car,
  int? karma,
  String? expirience,
  String? workType,
  int? role,
  String? managerCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'car': car,
      'karma': karma,
      'expirience': expirience,
      'work_type': workType,
      'role': role,
      'manager_code': managerCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.car == e2?.car &&
        e1?.karma == e2?.karma &&
        e1?.expirience == e2?.expirience &&
        e1?.workType == e2?.workType &&
        e1?.role == e2?.role &&
        listEquality.equals(e1?.workingDays, e2?.workingDays) &&
        listEquality.equals(e1?.jobs, e2?.jobs) &&
        listEquality.equals(e1?.managers, e2?.managers) &&
        e1?.managerCode == e2?.managerCode;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.car,
        e?.karma,
        e?.expirience,
        e?.workType,
        e?.role,
        e?.workingDays,
        e?.jobs,
        e?.managers,
        e?.managerCode
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
