import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/data.dart';
import '../provider/dataprovider.dart';

class ChartLine extends StatefulWidget {
  const ChartLine({Key? key}) : super(key: key);

  @override
  State<ChartLine> createState() => _ChartLineState();
}

class _ChartLineState extends State<ChartLine> {
  final dataRef = FirebaseDatabase.instance.ref().child("DataTemp");
  final DateFormat minutos = DateFormat("HH:mm");
  final DateFormat horas = DateFormat("HH:mm");
  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
      stream: dataRef
          .child(context.watch<DataProviderRTDB>().date)
          .limitToLast(10)
          .onValue,
      builder: (BuildContext context, AsyncSnapshot snap) {
        Widget widget;
        if (snap.hasData) {
          List<Data> chartData = <Data>[];
          Map data = snap.data.snapshot.value;
          for (Map childData in data.values) {
            // here we are storing the data into a list which is used for chart’s data source
            chartData.add(Data.fromMap(childData.cast<String, dynamic>()));
          }
          widget = SfCartesianChart(
          
          
          
          
          
          
          
          
          
          
          
          
            
            
          
         
            primaryXAxis: CategoryAxis(labelRotation: 45,),
              
          
          
            series: <ChartSeries<Data, dynamic>>[
              LineSeries<Data, dynamic>(
                
                  dataSource: chartData,
                  color: const Color.fromARGB(255, 0, 255, 234),
                  xValueMapper: (Data data, _) => minutos.format(DateTime.fromMillisecondsSinceEpoch(data.timestamp)),
                  
                  yValueMapper: (Data data, _) => data.temp2),
              LineSeries<Data, dynamic>(
                  dataSource: chartData,
                  color: const Color.fromARGB(255, 0, 162, 255),
                  xValueMapper: (Data data, _) => minutos.format(
                      DateTime.fromMillisecondsSinceEpoch(data.timestamp)),
                  // DateTime.fromMillisecondsSinceEpoch(
                  //         data.xValue), //    (data.xValue),
                  yValueMapper: (Data data, _) => data.temp1),
            ],
          
          
           
          );
        } else {
          widget = const Center(child: CircularProgressIndicator());
        }
        return widget;
      },
    );
  }
}
