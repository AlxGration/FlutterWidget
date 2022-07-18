# speedometer

Customizable speedometer widget for Flutter (Android, iOS) with onComplete observable method.

![Image](https://github.com/AlxGration/FlutterWidget/blob/main/img/screen.gif)

## Getting started

In order to use this package, add the following dependency in your Flutter project.
```yaml
dependencies:
 speedometer: ^0.0.1
```
and then press "Pub get" if you are using AndroidStudio or run `flutter packages upgrade` otherwise.

In your Dart code, add import:
```dart
import 'package:speedometer/speedometer.dart';
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

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
