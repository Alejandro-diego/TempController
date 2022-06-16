import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dataprovider.dart';

class SetingPage extends StatefulWidget {
  const SetingPage({Key? key}) : super(key: key);

  @override
  State<SetingPage> createState() => _SetingPageState();
}

class _SetingPageState extends State<SetingPage> {
  final _database = FirebaseDatabase.instance.ref();

  var list = List<int>.generate(30, (i) => 0 + i);
  // late FixedExtentScrollController scroll = 10 as FixedExtentScrollController;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SetingPage"),
      ),
      body: Center(
        child: Consumer<DataProviderRTDB>(builder: (context, data, child) {
          return data.datosProvider != null
              ? Column(
                  children: [
                    Container(
                      height: 40,
                      margin:
                          const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 49, 45, 45)
                            .withOpacity(.3),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Center(child: Text('Limite de alarma')),
                    ),
                    Container(
                      height: 200,
                      margin:
                          const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 49, 45, 45)
                            .withOpacity(.3),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: 55,
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black),
                            ),
                            child: CupertinoPicker(
                              scrollController:FixedExtentScrollController(initialItem: data.datosProvider!.setAlarm1 ) ,
                              itemExtent: 64,
                              children: list
                                  .map((grados) => Center(
                                        child: Text(
                                          "$grados°",
                                          style: const TextStyle(
                                              color: Colors.blue),
                                        ),
                                      ))
                                  .toList(),
                              onSelectedItemChanged: (index) async {
                                setState(() {
                                  _database
                                      .child("data")
                                      .update({"set_alarm1": index});
                                });
                              },
                            ),
                          ),
                          const Text("Congelados"),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: 55,
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black),
                            ),
                            child: CupertinoPicker(
                               scrollController:FixedExtentScrollController(initialItem: data.datosProvider!.setAlarm2 ) ,
                              itemExtent: 64,
                              children: list
                                  .map((grados) => Center(
                                        child: Text(
                                          "$grados°",
                                          style: const TextStyle(
                                              color: Colors.green),
                                        ),
                                      ))
                                  .toList(),
                              onSelectedItemChanged: (index) async {
                                setState(() {
                                  _database
                                      .child("data")
                                      .update({"set_alarm2": index});
                                });
                              },
                            ),
                          ),
                          const Text("Resfriados"),
                        ],
                      ),
                    ),
                  ],
                )
              : const Center(child: CupertinoActivityIndicator());
        }),
      ),
    );
  }
}
