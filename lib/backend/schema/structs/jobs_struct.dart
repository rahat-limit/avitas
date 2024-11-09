// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobsStruct extends FFFirebaseStruct {
  JobsStruct({
    DateTime? dateBegin,
    String? jobType,
    String? jobPlace,
    int? workersNeeded,
    String? instructions,
    int? jobCost,
    List<DateTime>? days,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dateBegin = dateBegin,
        _jobType = jobType,
        _jobPlace = jobPlace,
        _workersNeeded = workersNeeded,
        _instructions = instructions,
        _jobCost = jobCost,
        _days = days,
        super(firestoreUtilData);

  // "date_begin" field.
  DateTime? _dateBegin;
  DateTime? get dateBegin => _dateBegin;
  set dateBegin(DateTime? val) => _dateBegin = val;

  bool hasDateBegin() => _dateBegin != null;

  // "job_type" field.
  String? _jobType;
  String get jobType => _jobType ?? '';
  set jobType(String? val) => _jobType = val;

  bool hasJobType() => _jobType != null;

  // "job_place" field.
  String? _jobPlace;
  String get jobPlace => _jobPlace ?? '';
  set jobPlace(String? val) => _jobPlace = val;

  bool hasJobPlace() => _jobPlace != null;

  // "workers_needed" field.
  int? _workersNeeded;
  int get workersNeeded => _workersNeeded ?? 0;
  set workersNeeded(int? val) => _workersNeeded = val;

  void incrementWorkersNeeded(int amount) =>
      workersNeeded = workersNeeded + amount;

  bool hasWorkersNeeded() => _workersNeeded != null;

  // "instructions" field.
  String? _instructions;
  String get instructions => _instructions ?? '';
  set instructions(String? val) => _instructions = val;

  bool hasInstructions() => _instructions != null;

  // "job_cost" field.
  int? _jobCost;
  int get jobCost => _jobCost ?? 0;
  set jobCost(int? val) => _jobCost = val;

  void incrementJobCost(int amount) => jobCost = jobCost + amount;

  bool hasJobCost() => _jobCost != null;

  // "days" field.
  List<DateTime>? _days;
  List<DateTime> get days => _days ?? const [];
  set days(List<DateTime>? val) => _days = val;

  void updateDays(Function(List<DateTime>) updateFn) {
    updateFn(_days ??= []);
  }

  bool hasDays() => _days != null;

  static JobsStruct fromMap(Map<String, dynamic> data) => JobsStruct(
        dateBegin: data['date_begin'] as DateTime?,
        jobType: data['job_type'] as String?,
        jobPlace: data['job_place'] as String?,
        workersNeeded: castToType<int>(data['workers_needed']),
        instructions: data['instructions'] as String?,
        jobCost: castToType<int>(data['job_cost']),
        days: getDataList(data['days']),
      );

  static JobsStruct? maybeFromMap(dynamic data) =>
      data is Map ? JobsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'date_begin': _dateBegin,
        'job_type': _jobType,
        'job_place': _jobPlace,
        'workers_needed': _workersNeeded,
        'instructions': _instructions,
        'job_cost': _jobCost,
        'days': _days,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date_begin': serializeParam(
          _dateBegin,
          ParamType.DateTime,
        ),
        'job_type': serializeParam(
          _jobType,
          ParamType.String,
        ),
        'job_place': serializeParam(
          _jobPlace,
          ParamType.String,
        ),
        'workers_needed': serializeParam(
          _workersNeeded,
          ParamType.int,
        ),
        'instructions': serializeParam(
          _instructions,
          ParamType.String,
        ),
        'job_cost': serializeParam(
          _jobCost,
          ParamType.int,
        ),
        'days': serializeParam(
          _days,
          ParamType.DateTime,
          isList: true,
        ),
      }.withoutNulls;

  static JobsStruct fromSerializableMap(Map<String, dynamic> data) =>
      JobsStruct(
        dateBegin: deserializeParam(
          data['date_begin'],
          ParamType.DateTime,
          false,
        ),
        jobType: deserializeParam(
          data['job_type'],
          ParamType.String,
          false,
        ),
        jobPlace: deserializeParam(
          data['job_place'],
          ParamType.String,
          false,
        ),
        workersNeeded: deserializeParam(
          data['workers_needed'],
          ParamType.int,
          false,
        ),
        instructions: deserializeParam(
          data['instructions'],
          ParamType.String,
          false,
        ),
        jobCost: deserializeParam(
          data['job_cost'],
          ParamType.int,
          false,
        ),
        days: deserializeParam<DateTime>(
          data['days'],
          ParamType.DateTime,
          true,
        ),
      );

  @override
  String toString() => 'JobsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is JobsStruct &&
        dateBegin == other.dateBegin &&
        jobType == other.jobType &&
        jobPlace == other.jobPlace &&
        workersNeeded == other.workersNeeded &&
        instructions == other.instructions &&
        jobCost == other.jobCost &&
        listEquality.equals(days, other.days);
  }

  @override
  int get hashCode => const ListEquality().hash([
        dateBegin,
        jobType,
        jobPlace,
        workersNeeded,
        instructions,
        jobCost,
        days
      ]);
}

JobsStruct createJobsStruct({
  DateTime? dateBegin,
  String? jobType,
  String? jobPlace,
  int? workersNeeded,
  String? instructions,
  int? jobCost,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    JobsStruct(
      dateBegin: dateBegin,
      jobType: jobType,
      jobPlace: jobPlace,
      workersNeeded: workersNeeded,
      instructions: instructions,
      jobCost: jobCost,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

JobsStruct? updateJobsStruct(
  JobsStruct? jobs, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    jobs
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addJobsStructData(
  Map<String, dynamic> firestoreData,
  JobsStruct? jobs,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (jobs == null) {
    return;
  }
  if (jobs.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && jobs.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final jobsData = getJobsFirestoreData(jobs, forFieldValue);
  final nestedData = jobsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = jobs.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getJobsFirestoreData(
  JobsStruct? jobs, [
  bool forFieldValue = false,
]) {
  if (jobs == null) {
    return {};
  }
  final firestoreData = mapToFirestore(jobs.toMap());

  // Add any Firestore field values
  jobs.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getJobsListFirestoreData(
  List<JobsStruct>? jobss,
) =>
    jobss?.map((e) => getJobsFirestoreData(e, true)).toList() ?? [];
