import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/old_app/choose_working_days/choose_working_days_widget.dart';
import '/old_app/empty/empty_widget.dart';
import '/pages/additional_amount/additional_amount_widget.dart';
import '/pages/create_report/create_report_widget.dart';
import '/pages/more_actions_worker/more_actions_worker_widget.dart';
import '/pages/new_worker/new_worker_widget.dart';
import '/pages/worker_q_r/worker_q_r_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'detail_page_widget.dart' show DetailPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailPageModel extends FlutterFlowModel<DetailPageWidget> {
  ///  Local state fields for this page.

  int pageIndex = 0;

  bool isHidden = false;

  ///  State fields for stateful widgets in this page.

  var scannedWorker = '';
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  WorkerRecord? foundWorker;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  CommuteRecord? foundCommute;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UsersRecord>? users;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<WorkerRecord>? workersUnpaid;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
