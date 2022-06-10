import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Sfgauge1 extends StatelessWidget {
  const Sfgauge1({Key? key, required this.temp1}) : super(key: key);

  final double temp1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: SfRadialGauge(
        title: const GaugeTitle(
            text: 'Congelados',
            textStyle: TextStyle(
                color: Colors.amberAccent,
                fontSize: 12.0,
                fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(
            labelOffset: 1,
            minimum: -25.00,
            maximum: 25.00,
            ranges: <GaugeRange>[
              GaugeRange(
                  startValue: -25,
                  endValue: -20,
                  color: Colors.orange,
                  startWidth: 5,
                  endWidth: 5),
              GaugeRange(
                  startValue: -20,
                  endValue: 0,
                  color: Colors.greenAccent,
                  startWidth: 5,
                  endWidth: 5),
              GaugeRange(
                  startValue: 0,
                  endValue: 25,
                  color: Colors.red,
                  startWidth: 5,
                  endWidth: 5)
            ],
            pointers: <GaugePointer>[
              MarkerPointer(
                value: temp1,
                color: Colors.yellowAccent,
                markerHeight: 15,
                markerWidth: 15,
                markerType: MarkerType.invertedTriangle,
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Text('$temp1°',
                      style: const TextStyle(
                          
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  angle: 90,
                  positionFactor: 0)
            ],
          ),
        ],
      ),
    );
  }
}
