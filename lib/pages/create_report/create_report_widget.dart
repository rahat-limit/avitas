import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/colorcircle_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_report_model.dart';
export 'create_report_model.dart';

class CreateReportWidget extends StatefulWidget {
  const CreateReportWidget({
    super.key,
    required this.worker,
    required this.job,
  });

  final WorkerRecord? worker;
  final JobRecord? job;

  @override
  State<CreateReportWidget> createState() => _CreateReportWidgetState();
}

class _CreateReportWidgetState extends State<CreateReportWidget> {
  late CreateReportModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateReportModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.chosenColor = _model.chosenColor != null
          ? _model.chosenColor
          : FFAppState().lastColor;
      safeSetState(() {});
    });

    _model.shortBioTextController1 ??=
        TextEditingController(text: FFAppState().lastSort);

    _model.shortBioTextController2 ??= TextEditingController();
    _model.shortBioFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Container(
                        width: 50.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget!.worker?.name,
                        'name',
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Outfit',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
                FlutterFlowChoiceChips(
                  options: [
                    ChipData('BIG'),
                    ChipData('SMALL'),
                    ChipData('GREEN')
                  ],
                  onChanged: (val) => safeSetState(
                      () => _model.choiceChipsValue = val?.firstOrNull),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: valueOrDefault<Color>(
                      _model.chosenColor,
                      FlutterFlowTheme.of(context).alternate,
                    ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).primaryText,
                    iconSize: 18.0,
                    labelPadding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 18.0,
                    labelPadding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  chipSpacing: 12.0,
                  rowSpacing: 12.0,
                  multiselect: false,
                  alignment: WrapAlignment.start,
                  controller: _model.choiceChipsValueController ??=
                      FormFieldController<List<String>>(
                    [],
                  ),
                  wrapped: true,
                ),
                if (_model.choiceChipsValue != null &&
                    _model.choiceChipsValue != '')
                  Wrap(
                    spacing: 12.0,
                    runSpacing: 12.0,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.chosenColor = Color(0xFFFFC3C3);
                          safeSetState(() {});
                        },
                        child: wrapWithModel(
                          model: _model.colorcircleModel1,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: ColorcircleWidget(
                            color: Color(0xFFFFC3C3),
                            borderColor: _model.chosenColor == Color(0xFFFFC3C3)
                                ? Colors.black
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.chosenColor = Color(0xFFFFE1C3);
                          safeSetState(() {});
                        },
                        child: wrapWithModel(
                          model: _model.colorcircleModel2,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: ColorcircleWidget(
                            color: Color(0xFFFFE1C3),
                            borderColor: _model.chosenColor == Color(0xFFFFE1C3)
                                ? Colors.black
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.chosenColor = Color(0xFFC3FFD6);
                          safeSetState(() {});
                        },
                        child: wrapWithModel(
                          model: _model.colorcircleModel3,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: ColorcircleWidget(
                            color: Color(0xFFC3FFD6),
                            borderColor: _model.chosenColor == Color(0xFFC3FFD6)
                                ? Colors.black
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.chosenColor = Color(0xFFC3F5FF);
                          safeSetState(() {});
                        },
                        child: wrapWithModel(
                          model: _model.colorcircleModel4,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: ColorcircleWidget(
                            color: Color(0xFFC3F5FF),
                            borderColor: _model.chosenColor == Color(0xFFC3F5FF)
                                ? Colors.black
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.chosenColor = Color(0xFFC3C5FF);
                          safeSetState(() {});
                        },
                        child: wrapWithModel(
                          model: _model.colorcircleModel5,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: ColorcircleWidget(
                            color: Color(0xFFC3C5FF),
                            borderColor: _model.chosenColor == Color(0xFFC3F5FF)
                                ? Colors.black
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.chosenColor = Color(0xFFFFC3FF);
                          safeSetState(() {});
                        },
                        child: wrapWithModel(
                          model: _model.colorcircleModel6,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: ColorcircleWidget(
                            color: Color(0xFFFFC3FF),
                            borderColor: _model.chosenColor == Color(0xFFFFC3FF)
                                ? Colors.black
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.chosenColor = Color(0xFFFF8585);
                          safeSetState(() {});
                        },
                        child: wrapWithModel(
                          model: _model.colorcircleModel7,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: ColorcircleWidget(
                            color: Color(0xFFFF8585),
                            borderColor: _model.chosenColor == Color(0xFFFF8585)
                                ? Colors.black
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.chosenColor = Color(0xFFFFDF8A);
                          safeSetState(() {});
                        },
                        child: wrapWithModel(
                          model: _model.colorcircleModel8,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: ColorcircleWidget(
                            color: Color(0xFFFFDF8A),
                            borderColor: _model.chosenColor == Color(0xFFFFDF8A)
                                ? Colors.black
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.chosenColor = Color(0xFF7FFFA3);
                          safeSetState(() {});
                        },
                        child: wrapWithModel(
                          model: _model.colorcircleModel9,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: ColorcircleWidget(
                            color: Color(0xFF7FFFA3),
                            borderColor: _model.chosenColor == Color(0xFFC3F5FF)
                                ? Colors.black
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.chosenColor = Color(0xFF6AC8FF);
                          safeSetState(() {});
                        },
                        child: wrapWithModel(
                          model: _model.colorcircleModel10,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: ColorcircleWidget(
                            color: _model.chosenColor == Color(0xFF6AC8FF)
                                ? Colors.black
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                if (_model.choiceChipsValue != null &&
                    _model.choiceChipsValue != '')
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      final _colorPickedColor = await showFFColorPicker(
                        context,
                        currentColor: _model.colorPicked ??=
                            FlutterFlowTheme.of(context).primary,
                        showRecentColors: true,
                        allowOpacity: true,
                        textColor: FlutterFlowTheme.of(context).primaryText,
                        secondaryTextColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        primaryButtonBackgroundColor:
                            FlutterFlowTheme.of(context).primary,
                        primaryButtonTextColor: Colors.white,
                        primaryButtonBorderColor: Colors.transparent,
                        displayAsBottomSheet: isMobileWidth(context),
                      );

                      if (_colorPickedColor != null) {
                        safeSetState(
                            () => _model.colorPicked = _colorPickedColor);
                      }

                      _model.chosenColor = _model.colorPicked;
                      safeSetState(() {});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Set a custom color',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: _model.colorPicked != null
                                ? valueOrDefault<Color>(
                                    _model.colorPicked,
                                    FlutterFlowTheme.of(context).primary,
                                  )
                                : FlutterFlowTheme.of(context).primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                Autocomplete<String>(
                  initialValue: TextEditingValue(text: FFAppState().lastSort),
                  optionsBuilder: (textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return FFAppState().sorts.where((option) {
                      final lowercaseOption = option.toLowerCase();
                      return lowercaseOption
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  optionsViewBuilder: (context, onSelected, options) {
                    return AutocompleteOptionsList(
                      textFieldKey: _model.shortBioKey1,
                      textController: _model.shortBioTextController1!,
                      options: options.toList(),
                      onSelected: onSelected,
                      textStyle: TextStyle(),
                      textHighlightStyle: TextStyle(),
                      elevation: 4.0,
                      optionBackgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      optionHighlightColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      maxHeight: 200.0,
                    );
                  },
                  onSelected: (String selection) {
                    safeSetState(
                        () => _model.shortBioSelectedOption1 = selection);
                    FocusScope.of(context).unfocus();
                  },
                  fieldViewBuilder: (
                    context,
                    textEditingController,
                    focusNode,
                    onEditingComplete,
                  ) {
                    _model.shortBioFocusNode1 = focusNode;

                    _model.shortBioTextController1 = textEditingController;
                    return TextFormField(
                      key: _model.shortBioKey1,
                      controller: textEditingController,
                      focusNode: focusNode,
                      onEditingComplete: onEditingComplete,
                      textCapitalization: TextCapitalization.characters,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Sort',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 32.0, 20.0, 12.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                      textAlign: TextAlign.start,
                      validator: _model.shortBioTextController1Validator
                          .asValidator(context),
                    );
                  },
                ),
                TextFormField(
                  controller: _model.shortBioTextController2,
                  focusNode: _model.shortBioFocusNode2,
                  textInputAction: TextInputAction.done,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Weight (in gramms)',
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 32.0, 20.0, 12.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                  validator: _model.shortBioTextController2Validator
                      .asValidator(context),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        _model.totalWeight =
                            double.parse(_model.shortBioTextController2.text) /
                                widget!.job!.grPerLb;
                        _model.totalMoney =
                            (double.parse(_model.shortBioTextController2.text) /
                                    widget!.job!.grPerLb) *
                                widget!.job!.priceOwner;
                        _model.totalMoneyWorker =
                            (double.parse(_model.shortBioTextController2.text) /
                                    widget!.job!.grPerLb) *
                                widget!.job!.priceWorker;
                        safeSetState(() {});
                        await Future.wait([
                          Future(() async {
                            await widget!.job!.reference.update({
                              ...mapToFirestore(
                                {
                                  'total_money':
                                      FieldValue.increment(_model.totalMoney!),
                                  'total_weight':
                                      FieldValue.increment(_model.totalWeight!),
                                },
                              ),
                            });

                            await widget!.worker!.reference
                                .update(createWorkerRecordData(
                              totalCash: _model.totalMoneyWorker,
                              totalWeight: _model.totalWeight,
                            ));
                            _model.foundSort = await querySortsRecordOnce(
                              parent: widget!.job?.reference,
                              queryBuilder: (sortsRecord) => sortsRecord.where(
                                'sort_name',
                                isEqualTo: _model.shortBioTextController1.text,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            if (_model.foundSort != null) {
                              await ReportGeneralRecord.createDoc(
                                      widget!.job!.reference)
                                  .set(createReportGeneralRecordData(
                                sort: _model.shortBioTextController1.text,
                                type: _model.choiceChipsValue,
                                lb: _model.totalWeight,
                                money: _model.totalMoney,
                                worker: widget!.worker?.reference,
                                createdAt: getCurrentTimestamp,
                                underSort: _model.foundSort?.reference,
                                moneyWorker: _model.totalMoneyWorker,
                              ));

                              await _model.foundSort!.reference.update({
                                ...createSortsRecordData(
                                  totalMoney: _model.totalMoney,
                                  lastTimeUpdated: getCurrentTimestamp,
                                ),
                                ...mapToFirestore(
                                  {
                                    'total_weight': FieldValue.increment(
                                        _model.choiceChipsValue == 'BIG'
                                            ? _model.totalWeight!
                                            : 0.0),
                                    'total_weight_green': FieldValue.increment(
                                        _model.choiceChipsValue == 'GREEN'
                                            ? _model.totalWeight!
                                            : 0.0),
                                    'total_weight_small': FieldValue.increment(
                                        _model.choiceChipsValue == 'SMALL'
                                            ? _model.totalWeight!
                                            : 0.0),
                                  },
                                ),
                              });
                            } else {
                              var sortsRecordReference =
                                  SortsRecord.createDoc(widget!.job!.reference);
                              await sortsRecordReference
                                  .set(createSortsRecordData(
                                name: _model.choiceChipsValue,
                                totalWeight: _model.choiceChipsValue == 'BIG'
                                    ? _model.totalWeight
                                    : 0.0,
                                totalMoney: _model.totalMoney,
                                color: _model.chosenColor != null
                                    ? _model.chosenColor
                                    : _model.colorPicked,
                                sortName: _model.shortBioTextController1.text,
                                totalWeightGreen:
                                    _model.choiceChipsValue == 'GREEN'
                                        ? _model.totalWeight
                                        : 0.0,
                                totalWeightSmall:
                                    _model.choiceChipsValue == 'SMALL'
                                        ? _model.totalWeight
                                        : 0.0,
                                lastTimeUpdated: getCurrentTimestamp,
                              ));
                              _model.newSort = SortsRecord.getDocumentFromData(
                                  createSortsRecordData(
                                    name: _model.choiceChipsValue,
                                    totalWeight:
                                        _model.choiceChipsValue == 'BIG'
                                            ? _model.totalWeight
                                            : 0.0,
                                    totalMoney: _model.totalMoney,
                                    color: _model.chosenColor != null
                                        ? _model.chosenColor
                                        : _model.colorPicked,
                                    sortName:
                                        _model.shortBioTextController1.text,
                                    totalWeightGreen:
                                        _model.choiceChipsValue == 'GREEN'
                                            ? _model.totalWeight
                                            : 0.0,
                                    totalWeightSmall:
                                        _model.choiceChipsValue == 'SMALL'
                                            ? _model.totalWeight
                                            : 0.0,
                                    lastTimeUpdated: getCurrentTimestamp,
                                  ),
                                  sortsRecordReference);

                              await ReportGeneralRecord.createDoc(
                                      widget!.job!.reference)
                                  .set(createReportGeneralRecordData(
                                sort: _model.shortBioTextController1.text,
                                type: _model.choiceChipsValue,
                                lb: _model.totalWeight,
                                money: _model.totalMoney,
                                worker: widget!.worker?.reference,
                                createdAt: getCurrentTimestamp,
                                underSort: _model.newSort?.reference,
                                moneyWorker: _model.totalMoneyWorker,
                              ));
                            }
                          }),
                          Future(() async {
                            _model.foundSortMain =
                                await querySortsMainRecordOnce(
                              queryBuilder: (sortsMainRecord) =>
                                  sortsMainRecord.where(
                                'title',
                                isEqualTo: _model.shortBioTextController1.text,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            if (!(_model.foundSortMain != null)) {
                              await SortsMainRecord.collection
                                  .doc()
                                  .set(createSortsMainRecordData(
                                    title: _model.shortBioTextController1.text,
                                    color: _model.chosenColor,
                                  ));
                            }
                          }),
                        ]);
                        Navigator.pop(context);

                        safeSetState(() {});
                      },
                      text: 'Create',
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ]
                  .divide(SizedBox(height: 12.0))
                  .addToStart(SizedBox(height: 16.0))
                  .addToEnd(SizedBox(height: 30.0)),
            ),
          ),
        ),
      ),
    );
  }
}
