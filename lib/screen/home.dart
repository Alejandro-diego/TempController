import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tempcontrol/provider/dataprovider.dart';

import '../widget/button.dart';
import '../widget/categorries.dart';

import '../widget/chart.dart';
import '../widget/sfradialgauge1.dart';
import '../widget/sfradialgauge2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _database = FirebaseDatabase.instance.ref();

  late bool compState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<int>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 0,
                      child: Text('LimparMinutos'),
                    ),
                    const PopupMenuItem(
                      value: 1,
                      child: Text('LogOut'),
                    ),
                  ]),
        ],
        title: const Text("Controlador Temperatura"),
      ),
      body: Consumer<DataProviderRTDB>(
        builder: (context, data, child) {
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
                      child: const Categories(),
                    ),
                    Container(
                      height: 250,
                      margin:
                          const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 49, 45, 45)
                            .withOpacity(.3),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const ChartLine(),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 49, 45, 45)
                            .withOpacity(.3),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 170,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.datosProvider!.comp
                                    ? 'Comp:  ON'
                                    : 'Comp:  OFF'),
                                const Text('Consumo:  2268 whats'),
                                const Text('Press baixa:  71.3 psi'),
                                const Spacer(),
                                Row(children: [
                                  Switch(
                                      value: data.datosProvider!.comp,
                                      onChanged: (bool valor) async {
                                        dialog();
      
                                        setState(() {
                                          compState = valor;
                                        });
                                      }),
                                  const Text('Desligar camara')
                                ]),
                                Row(
                                  children: [
                                    NeuButton(
                                      onTap: () {
                                        setState(() {
                                          _database.child("data").update({
                                            "alarm1":
                                                !data.datosProvider!.alarm1
                                          });
                                        });
                                      },
                                      isButtonPressed:
                                          data.datosProvider!.alarm1,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(data.datosProvider!.alarm1
                                        ? 'Alarm1 : ON'
                                        : 'Alarm1 : OFF'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Sfgauge1(
                            temp1: (data.datosProvider!.temp1.toDouble() ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 49, 45, 45)
                            .withOpacity(.3),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 180,
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.datosProvider!.comp
                                    ? 'Comp:  ON'
                                    : 'Comp:  OFF'),
                                const Text('Consumo:  2268 whats'),
                                const Text('Press baixa:  71.3 psi'),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    NeuButton(
                                      onTap: () {
                                        setState(() {
                                          _database.child("data").update({
                                            "alarm2":
                                                !data.datosProvider!.alarm2
                                          });
                                        });
                                      },
                                      isButtonPressed:
                                          data.datosProvider!.alarm2,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(data.datosProvider!.alarm2
                                        ? 'Alarm2 : ON'
                                        : 'Alarm2 : OFF'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Sfgauge2(
                            temp2: (data.datosProvider!.temp2.toDouble() ),
                          )
                        ],
                      ),
                    ),
      
      
                
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  void dialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(.5),
          title: const Text("ATENCAO"),
          content: Text(compState ? 'Ligar Compresor?' : 'Deligar Compresor?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
                setState(() {
                  _database.child('data').update({
                    'comp': compState,
                  });
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void onSelected(BuildContext context, int item) async {
    switch (item) {
      case 0:
        await _database.child('DataTemp/minutos').remove();

        break;
      case 1:
        FirebaseAuth.instance.signOut();
        break;
    }
  }
}
