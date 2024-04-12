import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SleekSlider extends StatefulWidget {
  final double temperature;

  const SleekSlider({Key? key, required this.temperature}) : super(key: key);

  @override
  _SleekSliderState createState() => _SleekSliderState();
}

class _SleekSliderState extends State<SleekSlider> {
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
      body: Center(
        child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
            size: 200,
            startAngle: 150,
            angleRange: 240,
            customWidths: CustomSliderWidths(
              trackWidth: 10,
              progressBarWidth: 20,
              shadowWidth: 30,
            ),
            customColors: CustomSliderColors(
              trackColor: Colors.grey[300],
              progressBarColor: Colors.blue,
              shadowColor: Colors.grey,
              shadowMaxOpacity: 0.2,
            ),
            infoProperties: InfoProperties(
              mainLabelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
              // bottomLabelText: '°C',
              bottomLabelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              modifier: (double value) {
                final roundedValue = value.ceil().toInt().toString();
                return '$roundedValue °C';
              },
            ),
          ),
          min: -60,
          max: 120,
          initialValue: _currentTemperature,
          onChange: (double value) {
            setState(() {
              _currentTemperature = value;
            });
          },
        ),
      ),
    );
  }
}
