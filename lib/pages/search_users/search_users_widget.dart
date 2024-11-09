import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'search_users_model.dart';
export 'search_users_model.dart';

class SearchUsersWidget extends StatefulWidget {
  const SearchUsersWidget({
    super.key,
    required this.job,
  });

  final DocumentReference? job;

  @override
  State<SearchUsersWidget> createState() => _SearchUsersWidgetState();
}

class _SearchUsersWidgetState extends State<SearchUsersWidget> {
  late SearchUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchUsersModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invite workers',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Outfit',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                'Invite workers to join',
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 4.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 44.0,
                fillColor: FlutterFlowTheme.of(context).alternate,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: LinearPercentIndicator(
                    percent: 1.0,
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    lineHeight: 12.0,
                    animation: true,
                    animateFromLastPercent: true,
                    progressColor: FlutterFlowTheme.of(context).secondary,
                    backgroundColor: Color(0xFFE0E3E7),
                    barRadius: Radius.circular(0.0),
                    padding: EdgeInsets.zero,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 0.0, 0.0),
                          child: Text(
                            'Your workers',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            _model.checkboxListTileCheckedItems1.length
                                .toString(),
                            '0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(2.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'Selected',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) => usersRecord
                          .where(
                            'role',
                            isEqualTo: 0,
                          )
                          .where(
                            'managers',
                            arrayContains: currentUserReference,
                          )
                          .orderBy('display_name'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<UsersRecord> listViewUsersRecordList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewUsersRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewUsersRecord =
                              listViewUsersRecordList[listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 8.0),
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          child: Image.network(
                                            listViewUsersRecord.photoUrl,
                                            width: 44.0,
                                            height: 44.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Theme(
                                        data: ThemeData(
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: CheckboxListTile(
                                          value: _model
                                                  .checkboxListTileValueMap1[
                                              listViewUsersRecord] ??= false,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.checkboxListTileValueMap1[
                                                        listViewUsersRecord] =
                                                    newValue!);
                                            if (newValue!) {
                                              await listViewUsersRecord
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'jobs':
                                                        FieldValue.arrayUnion(
                                                            [widget!.job]),
                                                  },
                                                ),
                                              });

                                              var workerRecordReference =
                                                  WorkerRecord.createDoc(
                                                      widget!.job!);
                                              await workerRecordReference
                                                  .set(createWorkerRecordData(
                                                phone: listViewUsersRecord
                                                    .phoneNumber,
                                                name: listViewUsersRecord
                                                    .displayName,
                                                user: listViewUsersRecord
                                                    .reference,
                                                status: 0,
                                                paid: false,
                                                isAccepted: false,
                                              ));
                                              _model.newWorker = WorkerRecord
                                                  .getDocumentFromData(
                                                      createWorkerRecordData(
                                                        phone:
                                                            listViewUsersRecord
                                                                .phoneNumber,
                                                        name:
                                                            listViewUsersRecord
                                                                .displayName,
                                                        user:
                                                            listViewUsersRecord
                                                                .reference,
                                                        status: 0,
                                                        paid: false,
                                                        isAccepted: false,
                                                      ),
                                                      workerRecordReference);
                                              HapticFeedback.mediumImpact();

                                              safeSetState(() {});
                                            } else {
                                              await listViewUsersRecord
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'jobs':
                                                        FieldValue.arrayRemove(
                                                            [widget!.job]),
                                                  },
                                                ),
                                              });
                                              await _model.newWorker!.reference
                                                  .delete();
                                              HapticFeedback.mediumImpact();
                                            }
                                          },
                                          title: Text(
                                            listViewUsersRecord.displayName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                  lineHeight: 2.0,
                                                ),
                                          ),
                                          subtitle: Text(
                                            'Karma: ${valueOrDefault<String>(
                                              listViewUsersRecord.karma
                                                  .toString(),
                                              '0',
                                            )}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor: Colors.white,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  indent: 12.0,
                  endIndent: 12.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                if ((currentUserEmail == 'balinteegor@gmail.com') ||
                    (currentUserEmail == 'dias@f-tap.app') ||
                    (currentUserEmail == 'Se.kuy.fin@gmail.com'))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord
                            .where(
                              'role',
                              isEqualTo: 0,
                            )
                            .orderBy('display_name'),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> listViewUsersRecordList =
                            snapshot.data!;

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewUsersRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewUsersRecord =
                                listViewUsersRecordList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 8.0),
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            child: Image.network(
                                              listViewUsersRecord.photoUrl,
                                              width: 44.0,
                                              height: 44.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Theme(
                                          data: ThemeData(
                                            unselectedWidgetColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                          ),
                                          child: CheckboxListTile(
                                            value: _model
                                                    .checkboxListTileValueMap2[
                                                listViewUsersRecord] ??= false,
                                            onChanged: (newValue) async {
                                              safeSetState(() =>
                                                  _model.checkboxListTileValueMap2[
                                                          listViewUsersRecord] =
                                                      newValue!);
                                              if (newValue!) {
                                                await listViewUsersRecord
                                                    .reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'jobs':
                                                          FieldValue.arrayUnion(
                                                              [widget!.job]),
                                                    },
                                                  ),
                                                });

                                                var workerRecordReference =
                                                    WorkerRecord.createDoc(
                                                        widget!.job!);
                                                await workerRecordReference
                                                    .set(createWorkerRecordData(
                                                  phone: listViewUsersRecord
                                                      .phoneNumber,
                                                  name: listViewUsersRecord
                                                      .displayName,
                                                  user: listViewUsersRecord
                                                      .reference,
                                                  status: 0,
                                                  paid: false,
                                                  isAccepted: false,
                                                ));
                                                _model.newWorkerNoManager =
                                                    WorkerRecord.getDocumentFromData(
                                                        createWorkerRecordData(
                                                          phone:
                                                              listViewUsersRecord
                                                                  .phoneNumber,
                                                          name:
                                                              listViewUsersRecord
                                                                  .displayName,
                                                          user:
                                                              listViewUsersRecord
                                                                  .reference,
                                                          status: 0,
                                                          paid: false,
                                                          isAccepted: false,
                                                        ),
                                                        workerRecordReference);
                                                HapticFeedback.mediumImpact();

                                                safeSetState(() {});
                                              } else {
                                                await listViewUsersRecord
                                                    .reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'jobs': FieldValue
                                                          .arrayRemove(
                                                              [widget!.job]),
                                                    },
                                                  ),
                                                });
                                                await _model.newWorkerNoManager!
                                                    .reference
                                                    .delete();
                                                HapticFeedback.mediumImpact();
                                              }
                                            },
                                            title: Text(
                                              listViewUsersRecord.displayName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                        lineHeight: 2.0,
                                                      ),
                                            ),
                                            subtitle: Text(
                                              'Karma: ${valueOrDefault<String>(
                                                listViewUsersRecord.karma
                                                    .toString(),
                                                '0',
                                              )}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            checkColor: Colors.white,
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 140.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).accent4,
                      FlutterFlowTheme.of(context).secondaryBackground
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    var notificationsRecordReference =
                        NotificationsRecord.collection.doc();
                    await notificationsRecordReference.set({
                      ...createNotificationsRecordData(
                        title: 'New Job',
                        description:
                            '${currentUserDisplayName} is inviting you for a new job',
                        createdAt: getCurrentTimestamp,
                        job: widget!.job,
                      ),
                      ...mapToFirestore(
                        {
                          'users_for': _model.checkboxListTileCheckedItems1
                              .map((e) => e.reference)
                              .toList(),
                        },
                      ),
                    });
                    _model.invitesSent =
                        NotificationsRecord.getDocumentFromData({
                      ...createNotificationsRecordData(
                        title: 'New Job',
                        description:
                            '${currentUserDisplayName} is inviting you for a new job',
                        createdAt: getCurrentTimestamp,
                        job: widget!.job,
                      ),
                      ...mapToFirestore(
                        {
                          'users_for': _model.checkboxListTileCheckedItems1
                              .map((e) => e.reference)
                              .toList(),
                        },
                      ),
                    }, notificationsRecordReference);
                    triggerPushNotification(
                      notificationTitle: 'You are invited',
                      notificationText:
                          'New job is starting soon! You are invited for that job!',
                      notificationSound: 'default',
                      userRefs: _model.checkboxListTileCheckedItems1
                          .map((e) => e.reference)
                          .toList(),
                      initialPageName: 'HomePage',
                      parameterData: {},
                    );
                    context.safePop();

                    safeSetState(() {});
                  },
                  text: 'Send Invites',
                  options: FFButtonOptions(
                    width: 270.0,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
