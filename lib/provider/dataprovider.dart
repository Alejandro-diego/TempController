import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:tempcontrol/models/data.dart';

class DataProviderRTDB extends ChangeNotifier {
  Data? _datosProvider;
  final _db = FirebaseDatabase.instance.ref();

  late StreamSubscription<DatabaseEvent> _dataStream;

  Data? get datosProvider => _datosProvider;

  DataProviderRTDB() {
    _obtener();
  }
  void _obtener() {
    _dataStream = _db.child("data").onValue.listen((event) {
      final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      _datosProvider = Data.fromMap(data);
       notifyListeners();

    });
  }

  @override
  void dispose() {
    _dataStream;
    super.dispose();
  }
}
