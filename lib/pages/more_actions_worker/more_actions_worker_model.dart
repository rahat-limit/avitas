import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/payment_modal_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/old_app/leave_review/leave_review_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'more_actions_worker_widget.dart' show MoreActionsWorkerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoreActionsWorkerModel extends FlutterFlowModel<MoreActionsWorkerWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  CommuteRecord? foundCommuteCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
