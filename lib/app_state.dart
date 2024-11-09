import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _lastSort = prefs.getString('ff_lastSort') ?? _lastSort;
    });
    _safeInit(() {
      _sorts = prefs.getStringList('ff_sorts') ?? _sorts;
    });
    _safeInit(() {
      _lastColor =
          _colorFromIntValue(prefs.getInt('ff_lastColor')) ?? _lastColor;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _lastSort = '';
  String get lastSort => _lastSort;
  set lastSort(String value) {
    _lastSort = value;
    prefs.setString('ff_lastSort', value);
  }

  List<String> _sorts = [];
  List<String> get sorts => _sorts;
  set sorts(List<String> value) {
    _sorts = value;
    prefs.setStringList('ff_sorts', value);
  }

  void addToSorts(String value) {
    sorts.add(value);
    prefs.setStringList('ff_sorts', _sorts);
  }

  void removeFromSorts(String value) {
    sorts.remove(value);
    prefs.setStringList('ff_sorts', _sorts);
  }

  void removeAtIndexFromSorts(int index) {
    sorts.removeAt(index);
    prefs.setStringList('ff_sorts', _sorts);
  }

  void updateSortsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    sorts[index] = updateFn(_sorts[index]);
    prefs.setStringList('ff_sorts', _sorts);
  }

  void insertAtIndexInSorts(int index, String value) {
    sorts.insert(index, value);
    prefs.setStringList('ff_sorts', _sorts);
  }

  Color _lastColor = Colors.transparent;
  Color get lastColor => _lastColor;
  set lastColor(Color value) {
    _lastColor = value;
    prefs.setInt('ff_lastColor', value.value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
