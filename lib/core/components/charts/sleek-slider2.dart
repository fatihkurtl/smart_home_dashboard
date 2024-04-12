import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SleekSlider2 extends StatefulWidget {
  final double temperature;

  const SleekSlider2({Key? key, required this.temperature}) : super(key: key);

  @override
  _SleekSlider2State createState() => _SleekSlider2State();
}

class _SleekSlider2State extends State<SleekSlider2> {
  double _currentTemperature = 0.0;

  @override
  void initState() {
    super.initState();
    _currentTemperature = widget.temperature;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: -20,
            maximum: 100,
            showLabels: false,
            showTicks: false,
            axisLineStyle: const AxisLineStyle(
              thickness: 0.2,
              cornerStyle: CornerStyle.bothCurve,
              color: Color.fromARGB(30, 0, 169, 181),
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: const <GaugePointer>[
              RangePointer(
                value: 26,
                cornerStyle: CornerStyle.bothCurve,
                width: 0.2,
                sizeUnit: GaugeSizeUnit.factor,
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                positionFactor: 0.1,
                angle: 90,
                widget: Text(
                  '${_currentTemperature.toString()}°C',
                  style: const TextStyle(fontSize: 56),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
