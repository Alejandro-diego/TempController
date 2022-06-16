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
            showTicks: false,
            axisLineStyle: const AxisLineStyle(
                cornerStyle: CornerStyle.endCurve, thickness: 5),
            showLabels: false,
            labelOffset: 1,
            minimum: -25.00,
            maximum: 25.00,
            pointers: <GaugePointer>[
              RangePointer(
                color: Colors.blue,
                value: temp1,
                cornerStyle: CornerStyle.bothCurve,
                width: 5,
              )

              /*
              MarkerPointer(
                value: temp1,
                color: Colors.yellowAccent,
                markerHeight: 15,
                markerWidth: 15,
                markerType: MarkerType.invertedTriangle,
              )

              */
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Text('$temp1°',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  angle: 90,
                  positionFactor: 0)
            ],
          ),
        ],
      ),
    );
  }
}
