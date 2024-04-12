import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGauge extends StatefulWidget {
  final double temperature;

  const RadialGauge({Key? key, required this.temperature}) : super(key: key);

  @override
  _RadialGaugeState createState() => _RadialGaugeState();
}

class _RadialGaugeState extends State<RadialGauge> {
  double _currentTemperature = 0.0;

  @override
  void initState() {
    super.initState();
    _currentTemperature = widget.temperature;
  }

  void _incrementTemperature() {
    setState(() {
      _currentTemperature += 1;
    });
  }

  void _decrementTemperature() {
    setState(() {
      _currentTemperature -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Card(
            color: Colors.grey[300],
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: -60,
                  maximum: 120,
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: -60,
                      endValue: -10,
                      color: Colors.blue,
                    ),
                    GaugeRange(
                      startValue: -10,
                      endValue: 10,
                      color: Colors.yellow,
                    ),
                    GaugeRange(
                      startValue: 10,
                      endValue: 35,
                      color: Colors.orange,
                    ),
                    GaugeRange(
                      startValue: 35,
                      endValue: 70,
                      color: Colors.red,
                    ),
                    GaugeRange(
                      startValue: 70,
                      endValue: 120,
                      color: Colors.purple,
                    ),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: _currentTemperature,
                      enableAnimation: true,
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Text(
                          '$_currentTemperature °C',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        positionFactor: 0.8,
                        angle: 90)
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementTemperature,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _decrementTemperature,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




// SfRadialGauge(
//           axes: <RadialAxis>[
//             RadialAxis(
//               ticksPosition: ElementsPosition.outside,
//               labelsPosition: ElementsPosition.outside,
//               minorTicksPerInterval: 5,
//               axisLineStyle: const AxisLineStyle(
//                 thicknessUnit: GaugeSizeUnit.factor,
//                 thickness: 0.1,
//               ),
//               axisLabelStyle: const GaugeTextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               radiusFactor: 0.97,
//               majorTickStyle: const MajorTickStyle(length: 0.1, thickness: 2, lengthUnit: GaugeSizeUnit.factor),
//               minorTickStyle: const MinorTickStyle(length: 0.05, thickness: 1.5, lengthUnit: GaugeSizeUnit.factor),
//               minimum: -60,
//               maximum: 120,
//               interval: 20,
//               startAngle: 115,
//               endAngle: 65,
//               ranges: <GaugeRange>[
//                 GaugeRange(
//                   startValue: -60,
//                   endValue: 120,
//                   startWidth: 0.1,
//                   sizeUnit: GaugeSizeUnit.factor,
//                   endWidth: 0.1,
//                   gradient: const SweepGradient(stops: <double>[0.2, 0.5, 0.75], colors: <Color>[Colors.green, Colors.yellow, Colors.red]),
//                 )
//               ],
//               pointers: const <GaugePointer>[
//                 NeedlePointer(
//                   value: 60,
//                   needleColor: Colors.black,
//                   tailStyle: TailStyle(length: 0.18, width: 8, color: Colors.black, lengthUnit: GaugeSizeUnit.factor),
//                   needleLength: 0.68,
//                   needleStartWidth: 1,
//                   needleEndWidth: 8,
//                   knobStyle: KnobStyle(
//                     knobRadius: 0.07,
//                     color: Colors.white,
//                     borderWidth: 0.05,
//                     borderColor: Colors.black,
//                   ),
//                   lengthUnit: GaugeSizeUnit.factor,
//                 ),
//               ],
//             ),
//           ],
//         ),