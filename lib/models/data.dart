class Data {
  late int temp1;
  late int temp2;
  late bool alarm1;
  late bool alarm2;
  late bool comp;
  late int timestamp;

  Data(
      {required this.alarm1,
      required this.timestamp,
      required this.comp,
      required this.alarm2,
      required this.temp1,
      required this.temp2});

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      timestamp: map['n'] ?? 1655077122,
      temp1: map['sensor1'] ?? 1,
      temp2: map['sensor2'] ?? 1,
      alarm1: map['alarm1'] ?? false,
      alarm2: map['alarm2'] ?? false,
      comp: map['comp'] ?? false,
    );
  }
}
