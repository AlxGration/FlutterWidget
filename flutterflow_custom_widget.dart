// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:alxgration_speedometer/speedometer.dart';

class SpeedometerWidget extends StatelessWidget {
  final double size;
  final int minValue;
  final int maxValue;
  final int currentValue;
  final Color barColor;
  final Color pointerColor;
  final String displayText;
  final VoidCallback? onComplete;

  SpeedometerWidget({
    Key? key,
    this.size = 200.0,
    this.minValue = 0,
    this.maxValue = 100,
    this.currentValue = 50,
    this.barColor = Colors.blue,
    this.pointerColor = Colors.black,
    this.displayText = "km/h",
    this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensure currentValue is within range
    final validCurrentValue =
        (currentValue >= minValue && currentValue <= maxValue)
            ? currentValue
            : (currentValue < minValue ? minValue : maxValue);

    return Speedometer(
      size: size,
      minValue: minValue,
      maxValue: maxValue,
      currentValue: validCurrentValue,
      barColor: barColor,
      pointerColor: pointerColor,
      displayText: displayText,
      displayTextStyle: TextStyle(fontSize: 24, color: Colors.deepOrange),
      displayNumericStyle: TextStyle(fontSize: 24, color: Colors.red),
      onComplete: onComplete,
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
