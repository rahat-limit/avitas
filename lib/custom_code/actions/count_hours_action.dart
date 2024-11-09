// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

int? countHoursAction(
  DateTime? todayDate,
  DateTime? setDate,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  if (todayDate == null || setDate == null) {
    return null;
  }

  // Calculate the difference in hours between todayDate and setDate
  final difference = todayDate.difference(setDate);
  final hoursDifference = difference.inHours.abs();

  return hoursDifference;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
