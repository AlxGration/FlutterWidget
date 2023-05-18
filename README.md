# speedometer

Customizable speedometer widget for Flutter (Android, iOS) with onComplete observable method.

![Image](https://github.com/AlxGration/FlutterWidget/blob/main/img/screen.gif)

## Getting started

In order to use this package, add the following dependency in your Flutter project.
```yaml
dependencies:
  alxgration_speedometer: ^0.0.1
```
and then press "Pub get" if you are using AndroidStudio or run `flutter packages upgrade` otherwise.

In your Dart code, add import:
```dart
import 'package:alxgration_speedometer/speedometer.dart';
```

## Usage

Short example for package use. Longer examples in `/example` folder. 

```dart
Speedometer(
    size:200,
    minValue: 0,
    maxValue: 10,
    currentValue: progress,
    barColor: Colors.purple,
    pointerColor: Colors.black,
    displayText: "km/h",
    displayTextStyle: TextStyle(fontSize: 14, color: Colors.deepOrange),
    displayNumericStyle: TextStyle(fontSize: 24, color: Colors.red),
    onComplete: (){
        print("ON COMPLETE");
    },
);
```
## Data Types

The project's parameters have the following data types:

```dart
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
```

## Package
You can find the package [here](https://pub.dev/packages/alxgration_speedometer)
