import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_job_widget.dart' show CreateJobWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateJobModel extends FlutterFlowModel<CreateJobWidget> {
  ///  Local state fields for this page.

  List<DateTime> workingDays = [];
  void addToWorkingDays(DateTime item) => workingDays.add(item);
  void removeFromWorkingDays(DateTime item) => workingDays.remove(item);
  void removeAtIndexFromWorkingDays(int index) => workingDays.removeAt(index);
  void insertAtIndexInWorkingDays(int index, DateTime item) =>
      workingDays.insert(index, item);
  void updateWorkingDaysAtIndex(int index, Function(DateTime) updateFn) =>
      workingDays[index] = updateFn(workingDays[index]);

  int? grlb;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for task widget.
  FocusNode? taskFocusNode;
  TextEditingController? taskTextController;
  String? Function(BuildContext, String?)? taskTextControllerValidator;
  String? _taskTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for cost widget.
  FocusNode? costFocusNode1;
  TextEditingController? costTextController1;
  String? Function(BuildContext, String?)? costTextController1Validator;
  String? _costTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for cost widget.
  FocusNode? costFocusNode2;
  TextEditingController? costTextController2;
  String? Function(BuildContext, String?)? costTextController2Validator;
  String? _costTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  JobRecord? newJob1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  JobRecord? newJob;

  @override
  void initState(BuildContext context) {
    taskTextControllerValidator = _taskTextControllerValidator;
    costTextController1Validator = _costTextController1Validator;
    costTextController2Validator = _costTextController2Validator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    taskFocusNode?.dispose();
    taskTextController?.dispose();

    costFocusNode1?.dispose();
    costTextController1?.dispose();

    costFocusNode2?.dispose();
    costTextController2?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
