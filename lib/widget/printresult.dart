import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../models/data.dart';
import '../models/streamen.dart';

class PrintResul extends StatefulWidget {
  const PrintResul({Key? key}) : super(key: key);

  @override
  State<PrintResul> createState() => _PrintResulState();
}

class _PrintResulState extends State<PrintResul> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: StreamBuilder(
        stream: DataStream().getDataStream(),
        builder: (context, snapshot) {
          final tileList = <FlSpot>[];
          
          if (snapshot.hasData) {
            final myDatos = snapshot.data as List<Data>;

            tileList.addAll(
              myDatos.map(
                (nextDato) {
                  return FlSpot(
                      nextDato.timestamp.toDouble(), nextDato.temp2.toDouble());
                },
              ),
            );
          }
          return LineChart(
            LineChartData(
              minY: 0,
              maxY: 21,
              
              gridData: FlGridData(
                show: true,
              ),
              borderData: FlBorderData(
                show: false,
              ),
              titlesData: FlTitlesData(),
              lineBarsData: [
                LineChartBarData(spots: tileList),
              ],
            ),
          );
        },
      ),
    );
  }
}
