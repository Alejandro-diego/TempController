import 'package:firebase_database/firebase_database.dart';

import 'data.dart';

class DataStream {
  final _db = FirebaseDatabase.instance.ref();

  Stream<List<Data>> getDataStream() {
    final minutosStream = _db.child('DataTemp/minutos').limitToLast(5).onValue;
    final result = minutosStream.map((event) {
      final minutoMap =
          Map<String, dynamic>.from(event.snapshot.value as dynamic);
      final minutosList = minutoMap.entries.map((element) {
        return Data.fromMap(Map<String, dynamic>.from(element.value));
      }).toList();
      return minutosList;
    });
    return result;
  }
}