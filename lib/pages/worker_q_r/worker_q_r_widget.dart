import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'worker_q_r_model.dart';
export 'worker_q_r_model.dart';

class WorkerQRWidget extends StatefulWidget {
  const WorkerQRWidget({
    super.key,
    required this.worker,
  });

  final WorkerRecord? worker;

  @override
  State<WorkerQRWidget> createState() => _WorkerQRWidgetState();
}

class _WorkerQRWidgetState extends State<WorkerQRWidget> {
  late WorkerQRModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkerQRModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Container(
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: BarcodeWidget(
            data: widget!.worker!.phone,
            barcode: Barcode.qrCode(),
            width: 200.0,
            height: 200.0,
            color: FlutterFlowTheme.of(context).primaryText,
            backgroundColor: Colors.transparent,
            errorBuilder: (_context, _error) => SizedBox(
              width: 200.0,
              height: 200.0,
            ),
            drawText: false,
          ),
        ),
      ),
    );
  }
}
