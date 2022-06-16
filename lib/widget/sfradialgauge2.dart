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
            showTicks: false,
            axisLineStyle: const AxisLineStyle(
                cornerStyle: CornerStyle.endCurve, thickness: 5),
            showLabels: false,
            labelOffset: 1,
            minimum: -5.00,
            maximum: 25.00,
            pointers: <GaugePointer>[
              RangePointer(
                color: Colors.green,
                value: temp2,
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
                  widget: Text('$temp2°',
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
