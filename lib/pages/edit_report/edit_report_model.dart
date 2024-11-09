import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/colorcircle_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_report_widget.dart' show EditReportWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditReportModel extends FlutterFlowModel<EditReportWidget> {
  ///  Local state fields for this component.

  Color? chosenColor;

  double? totalWeight;

  double? totalMoney;

  double? totalMoneyWorker;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for colorcircle component.
  late ColorcircleModel colorcircleModel1;
  // Model for colorcircle component.
  late ColorcircleModel colorcircleModel2;
  // Model for colorcircle component.
  late ColorcircleModel colorcircleModel3;
  // Model for colorcircle component.
  late ColorcircleModel colorcircleModel4;
  // Model for colorcircle component.
  late ColorcircleModel colorcircleModel5;
  // Model for colorcircle component.
  late ColorcircleModel colorcircleModel6;
  // Model for colorcircle component.
  late ColorcircleModel colorcircleModel7;
  // Model for colorcircle component.
  late ColorcircleModel colorcircleModel8;
  // Model for colorcircle component.
  late ColorcircleModel colorcircleModel9;
  // Model for colorcircle component.
  late ColorcircleModel colorcircleModel10;
  Color? colorPicked;
  // State field(s) for shortBio widget.
  final shortBioKey1 = GlobalKey();
  FocusNode? shortBioFocusNode1;
  TextEditingController? shortBioTextController1;
  String? shortBioSelectedOption1;
  String? Function(BuildContext, String?)? shortBioTextController1Validator;
  // State field(s) for shortBio widget.
  FocusNode? shortBioFocusNode2;
  TextEditingController? shortBioTextController2;
  String? Function(BuildContext, String?)? shortBioTextController2Validator;

  @override
  void initState(BuildContext context) {
    colorcircleModel1 = createModel(context, () => ColorcircleModel());
    colorcircleModel2 = createModel(context, () => ColorcircleModel());
    colorcircleModel3 = createModel(context, () => ColorcircleModel());
    colorcircleModel4 = createModel(context, () => ColorcircleModel());
    colorcircleModel5 = createModel(context, () => ColorcircleModel());
    colorcircleModel6 = createModel(context, () => ColorcircleModel());
    colorcircleModel7 = createModel(context, () => ColorcircleModel());
    colorcircleModel8 = createModel(context, () => ColorcircleModel());
    colorcircleModel9 = createModel(context, () => ColorcircleModel());
    colorcircleModel10 = createModel(context, () => ColorcircleModel());
  }

  @override
  void dispose() {
    colorcircleModel1.dispose();
    colorcircleModel2.dispose();
    colorcircleModel3.dispose();
    colorcircleModel4.dispose();
    colorcircleModel5.dispose();
    colorcircleModel6.dispose();
    colorcircleModel7.dispose();
    colorcircleModel8.dispose();
    colorcircleModel9.dispose();
    colorcircleModel10.dispose();
    shortBioFocusNode1?.dispose();

    shortBioFocusNode2?.dispose();
    shortBioTextController2?.dispose();
  }
}
