import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'colorcircle_model.dart';
export 'colorcircle_model.dart';

class ColorcircleWidget extends StatefulWidget {
  const ColorcircleWidget({
    super.key,
    required this.color,
    Color? borderColor,
  }) : this.borderColor = borderColor ?? Colors.white;

  final Color? color;
  final Color borderColor;

  @override
  State<ColorcircleWidget> createState() => _ColorcircleWidgetState();
}

class _ColorcircleWidgetState extends State<ColorcircleWidget> {
  late ColorcircleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColorcircleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: widget!.color,
        shape: BoxShape.circle,
        border: Border.all(
          color: widget!.borderColor,
        ),
      ),
    );
  }
}
