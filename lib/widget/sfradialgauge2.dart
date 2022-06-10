import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Sfgauge2 extends StatelessWidget {
  const Sfgauge2({Key? key, required this.temp2}) : super(key: key);

  final double temp2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: SfRadialGauge(
        title: const GaugeTitle(
            text: 'Resfriados',
            textStyle: TextStyle(
                color: Colors.amberAccent,
                fontSize: 12.0,
                fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(
            labelOffset: 1,
            minimum: -5.00,
            maximum: 25.00,
            ranges: <GaugeRange>[
              GaugeRange(
                  startValue: -5,
                  endValue: 0,
                  color: Colors.orange,
                  startWidth: 5,
                  endWidth: 5),
              GaugeRange(
                  startValue: 0,
                  endValue: 10,
                  color: Colors.greenAccent,
                  startWidth: 5,
                  endWidth: 5),
              GaugeRange(
                  startValue: 10,
                  endValue: 25,
                  color: Colors.red,
                  startWidth: 5,
                  endWidth: 5)
            ],
            pointers: <GaugePointer>[
              MarkerPointer(
                value: temp2,
                color: Colors.yellowAccent,
                markerHeight: 15,
                markerWidth: 15,
                markerType: MarkerType.invertedTriangle,
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Text('$temp2°',
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
