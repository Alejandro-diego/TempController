import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:tempcontrol/models/data.dart';

class DataProviderRTDB extends ChangeNotifier {
  Data? _datosProvider;
  final _db = FirebaseDatabase.instance.ref().child("DataTemp");
  String _date = "minutos";

  late StreamSubscription<DatabaseEvent> _dataStream;

  Data? get datosProvider => _datosProvider;

  String get date => _date;

  DataProviderRTDB() {
    _obtener1();
  }
  void _obtener1() {
    _dataStream = _db.child('horas').limitToLast(2).onValue.listen((event) {
      final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      _datosProvider = Data.fromMap(data);
      notifyListeners();
    });
  }

  void _obtener() {
    _dataStream = _db.child("data").onValue.listen((event) {
      final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      _datosProvider = Data.fromMap(data);
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
