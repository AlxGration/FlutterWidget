library speedometer;

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'ViewPainter.dart';

class Speedometer extends StatefulWidget {
  static const TextStyle defaultNumericStyle =
      TextStyle(color: Colors.black, fontSize: 24);
  static const TextStyle defaultTextStyle =
      TextStyle(color: Colors.black, fontSize: 18);

  Speedometer(
      {this.size = 200,
      this.minValue = 0,
      this.maxValue = 100,
      this.currentValue = 0,
      this.barColor = Colors.purple,
      this.pointerColor = Colors.black,
      this.displayNumericStyle = defaultNumericStyle,
      this.displayText = "",
      this.displayTextStyle = defaultTextStyle,
      this.onComplete = null});

  final double size;
  final int minValue;
  final int maxValue;
  final int currentValue;
  final Color barColor;
  final Color pointerColor;
  final TextStyle displayNumericStyle;
  final String displayText;
  final TextStyle displayTextStyle;
  final VoidCallback? onComplete;

  @override
  _SpeedometerState createState() => _SpeedometerState();
}

class _SpeedometerState extends State<Speedometer> {
  @override
  Widget build(BuildContext context) {
    double _size = widget.size;
    int _minValue = widget.minValue;
    int _maxValue = widget.maxValue;
    int _currentValue = widget.currentValue;
    double startAngle = 3.0;
    double endAngle = 21.0;

    double _pointerAngle = 0;
    if (_minValue <= _currentValue && _currentValue <= _maxValue) {
      _pointerAngle = (((_currentValue - _minValue) * (endAngle - startAngle)) /
              (_maxValue - _minValue)) +
          startAngle;
    } else if (_currentValue < _minValue) {
      _pointerAngle = startAngle;
    } else if (_currentValue > _maxValue) {
      _pointerAngle = endAngle;
    }

    if (_currentValue >= _maxValue){
       if (widget.onComplete != null){
         widget.onComplete!();
       }
    }

    return Container(
      color: Colors.transparent,
      child: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            width: _size,
            height: _size,
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(_size * 0.075),
                  child: CustomPaint(
                    /* bar drawing */
                    size: Size(_size, _size),
                    painter: ViewPainter(
                        startAngle: 9, sweepAngle: 18, color: widget.barColor),
                  ),
                ),
                Container(
                  //triangle among center of pointer and bottom right-left box of widget
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: TriangleClipper(),
                    child: Container(
                      width: _size,
                      height: _size * 0.5,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Container(
                  // center circle of pointer
                  alignment: Alignment.center,
                  child: Container(
                    width: _size * 0.1,
                    height: _size * 0.1,
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(
                      color: widget.pointerColor, //
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  // pointer (triangle) itself
                  alignment: Alignment.center,
                  child: Transform.rotate(
                    angle: math.pi / 12 * _pointerAngle,
                    child: ClipPath(
                      clipper: PointerClipper(),
                      child: Container(
                        width: _size * 0.9,
                        height: _size * 0.9,
                        color: widget.pointerColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  // value text displayed below speedometer
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, _size * 0.1),
                    child: Text(
                      widget.currentValue.toString(),
                      style: widget.displayNumericStyle,
                    ),
                  ),
                ),
                Container(
                  // measurement text displayed below speedometer
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      widget.displayText,
                      style: widget.displayTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
