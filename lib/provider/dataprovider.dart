import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import '../models/tempdata.dart';

class DataProviderRTDB extends ChangeNotifier {
  TempData? _datosProvider;
  final _db = FirebaseDatabase.instance.ref();
  String _date = "minutos";

  late StreamSubscription<DatabaseEvent> _dataStream;

  TempData? get datosProvider => _datosProvider;

  String get date => _date;

  DataProviderRTDB() {
    _obtener();
  }
  void _obtener() {
    _dataStream = _db.child('data').onValue.listen((event) {
      final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      _datosProvider = TempData.fromMap(data);
      notifyListeners();
    });
  }

  
  void dateSelect(String value) {
    _date = value;
    notifyListeners();
    
  }

  @override
  void dispose() {
    _dataStream;
    super.dispose();
  }
}
