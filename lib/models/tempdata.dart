class TempData {
  late int temp1;
  late int temp2;
  late bool alarm1;
  late bool alarm2;
  late bool comp;
  late int setAlarm1;
  late int setAlarm2;

  TempData(
      {required this.alarm1,
      required this.setAlarm1,
      required this.setAlarm2,
      required this.comp,
      required this.alarm2,
      required this.temp1,
      required this.temp2});

  factory TempData.fromMap(Map<String, dynamic> map) {
    return TempData(
      setAlarm1: map['set_alarm1'] ?? 10,
      setAlarm2: map['set_alarm2'] ?? 10,
      temp1: map['sensor1'] ?? 1,
      temp2: map['sensor2'] ?? 1,
      alarm1: map['alarm1'] ?? false,
      alarm2: map['alarm2'] ?? false,
      comp: map['comp'] ?? false,
    );
  }
}
