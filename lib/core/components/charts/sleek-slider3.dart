import 'package:flutter/material.dart';
import 'package:smart_home_dashboard/core/utils.dart';
import 'package:smart_home_dashboard/core/widgets/custom_draw.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double progressVal = 0.5;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return SweepGradient(
              startAngle: degToRad(0).toDouble(),
              endAngle: degToRad(184).toDouble(),
              colors: [Colors.blue[200]!, Colors.grey.withAlpha(50)],
              stops: [progressVal, progressVal],
              transform: GradientRotation(
                degToRad(178).toDouble(),
              ),
            ).createShader(rect);
          },
          child: const Center(
            child: CustomArc(),
          ),
        ),
        Center(
          child: Container(
            width: kDiameter - 30,
            height: kDiameter - 30,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 20,
                style: BorderStyle.solid,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  spreadRadius: 10,
                  color: Colors.blue.withAlpha(normalize(progressVal * 20000, 100, 255).toInt()),
                  offset: const Offset(1, 3),
                ),
              ],
            ),
            child: SleekCircularSlider(
              min: kMinDegree,
              max: kMaxDegree,
              initialValue: 22,
              appearance: CircularSliderAppearance(
                startAngle: 180,
                angleRange: 180,
                size: kDiameter - 30,
                customWidths: CustomSliderWidths(
                  trackWidth: 10,
                  shadowWidth: 0,
                  progressBarWidth: 01,
                  handlerSize: 15,
                ),
                customColors: CustomSliderColors(
                  hideShadow: true,
                  progressBarColor: Colors.transparent,
                  trackColor: Colors.transparent,
                  dotColor: Colors.blue,
                ),
              ),
              onChange: (value) {
                setState(() {
                  var normalizedValue = normalize(value, kMinDegree, kMaxDegree);
                  progressVal = normalizedValue.toDouble();
                });
              },
              innerWidget: (percentage) {
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${percentage.toInt()}°C',
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 50,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Image.asset(
                        percentage.toInt() < 10
                            ? 'lib/assets/icons/snow.png'
                            : percentage.toInt() < 25
                                ? 'lib/assets/icons/weather.png'
                                : 'lib/assets/icons/sun.png',
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
