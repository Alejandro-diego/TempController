class Data {
  late int temp1;
  late int temp2;
 
  late int timestamp;

  Data(
      {
      required this.timestamp,
      
      required this.temp1,
      required this.temp2});

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      timestamp: map['timestamp'] ?? 1655077122,
      temp1: map['sensor1'] ?? 1,
      temp2: map['sensor2'] ?? 1,
     
    );
  }
}
