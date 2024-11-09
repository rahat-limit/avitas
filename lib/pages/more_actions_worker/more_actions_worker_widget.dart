import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/payment_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/old_app/leave_review/leave_review_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'more_actions_worker_model.dart';
export 'more_actions_worker_model.dart';

class MoreActionsWorkerWidget extends StatefulWidget {
  const MoreActionsWorkerWidget({
    super.key,
    required this.worker,
    required this.job,
  });

  final WorkerRecord? worker;
  final JobRecord? job;

  @override
  State<MoreActionsWorkerWidget> createState() =>
      _MoreActionsWorkerWidgetState();
}

class _MoreActionsWorkerWidgetState extends State<MoreActionsWorkerWidget> {
  late MoreActionsWorkerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoreActionsWorkerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: 50.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  _model.foundCommuteCopy = await queryCommuteRecordOnce(
                    parent: widget!.job?.reference,
                    queryBuilder: (commuteRecord) => commuteRecord
                        .where(
                          'come_in',
                          isLessThan: getCurrentTimestamp,
                        )
                        .where(
                          'date',
                          isEqualTo: dateTimeFormat("MEd", getCurrentTimestamp),
                        )
                        .where(
                          'worker',
                          isEqualTo: widget!.worker?.reference,
                        ),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);
                  if (_model.foundCommuteCopy != null) {
                    await Future.wait([
                      Future(() async {
                        await _model.foundCommuteCopy!.reference
                            .update(createCommuteRecordData(
                          comeOut: getCurrentTimestamp,
                        ));
                      }),
                      Future(() async {
                        await widget!.worker!.reference.update({
                          ...mapToFirestore(
                            {
                              'total_hours': FieldValue.increment(functions
                                  .countHours(_model.foundCommuteCopy?.comeIn,
                                      getCurrentTimestamp)!
                                  .toDouble()),
                            },
                          ),
                        });
                      }),
                      Future(() async {
                        await HoursRecord.createDoc(widget!.job!.reference)
                            .set(createHoursRecordData(
                          worker: widget!.worker?.name,
                          hoursWorked: functions
                              .countHours(_model.foundCommuteCopy?.comeIn,
                                  getCurrentTimestamp)
                              ?.toDouble(),
                          date: dateTimeFormat("MMMEd", getCurrentTimestamp),
                          cash: functions
                                  .countHours(_model.foundCommuteCopy?.comeIn,
                                      getCurrentTimestamp)!
                                  .toDouble() *
                              widget!.job!.priceOwner,
                        ));
                      }),
                      Future(() async {
                        await widget!.job!.reference.update({
                          ...createJobRecordData(
                            totalHours: functions
                                .countHours(_model.foundCommuteCopy?.comeIn,
                                    getCurrentTimestamp)
                                ?.toDouble(),
                          ),
                          ...mapToFirestore(
                            {
                              'total_cash_for_hours': FieldValue.increment(
                                  functions
                                          .countHours(
                                              _model.foundCommuteCopy?.comeIn,
                                              getCurrentTimestamp)!
                                          .toDouble() *
                                      widget!.job!.priceOwner),
                            },
                          ),
                        });
                      }),
                    ]);
                    await Future.wait([
                      Future(() async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Information updated',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Worker left'),
                              content: Text(
                                  '${widget!.worker?.name} left at ${dateTimeFormat("Hm", getCurrentTimestamp)}. By clicking one more time, you will update his leaving time of the worker!'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }),
                      Future(() async {
                        HapticFeedback.mediumImpact();
                      }),
                    ]);
                  } else {
                    await CommuteRecord.createDoc(widget!.job!.reference)
                        .set(createCommuteRecordData(
                      worker: widget!.worker?.reference,
                      comeIn: getCurrentTimestamp,
                      date: dateTimeFormat("MEd", getCurrentTimestamp),
                    ));
                    await Future.wait([
                      Future(() async {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Worker arrived'),
                              content: Text(
                                  '${widget!.worker?.name} arrived at ${dateTimeFormat("Hm", getCurrentTimestamp)}. By clicking one more time, you will setup the leaving time of the worker!'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }),
                      Future(() async {
                        HapticFeedback.mediumImpact();
                      }),
                    ]);
                  }

                  Navigator.pop(context);

                  safeSetState(() {});
                },
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Set time in/out',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Icon(
                          FFIcons.kclock,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);

                  context.pushNamed(
                    'ReportPage',
                    queryParameters: {
                      'job': serializeParam(
                        widget!.job?.reference,
                        ParamType.DocumentReference,
                      ),
                      'worker': serializeParam(
                        widget!.worker,
                        ParamType.Document,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'worker': widget!.worker,
                    },
                  );
                },
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Worker report',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Icon(
                          FFIcons.ktableCells,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: PaymentModalWidget(
                          worker: widget!.worker!,
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Icon(
                          FFIcons.kcurrencyDollar,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Make responsible?'),
                            content: Text(
                                'Are you sure you want to make this worker responsible for this job?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    await widget!.worker!.reference
                        .update(createWorkerRecordData(
                      isResponsible: true,
                    ));
                    triggerPushNotification(
                      notificationTitle: 'Responsible',
                      notificationText:
                          'Congratulations! You are not promoted to the responsible worker!',
                      notificationSound: 'default',
                      userRefs: [widget!.worker!.user!],
                      initialPageName: 'DetailPage',
                      parameterData: {
                        'job': widget!.job,
                      },
                    );
                  } else {
                    Navigator.pop(context);
                  }

                  Navigator.pop(context);
                },
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Make responsible',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Icon(
                          FFIcons.kchevronDoubleUp,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Remove worker?'),
                            content: Text(
                                'Are you sure you want to remove this worker from job?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Feedback'),
                              content: Text('Do you want to leave a feedback?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: Text('No'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: Text('Yes'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      triggerPushNotification(
                        notificationTitle: 'We are sorry!',
                        notificationText:
                            'You are no longer working on that site ${widget!.job?.location}',
                        notificationSound: 'default',
                        userRefs: [widget!.worker!.user!],
                        initialPageName: 'HomePage',
                        parameterData: {},
                      );
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: LeaveReviewWidget(
                              user: widget!.worker!.user!,
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    }
                    await widget!.worker!.reference.delete();
                  } else {
                    Navigator.pop(context);
                  }

                  Navigator.pop(context);
                },
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Remove from job',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Icon(
                          FFIcons.kuserMinus,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]
                .divide(SizedBox(height: 12.0))
                .addToStart(SizedBox(height: 12.0))
                .addToEnd(SizedBox(height: 30.0)),
          ),
        ],
      ),
    );
  }
}
