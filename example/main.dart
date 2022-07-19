import 'package:flutter/material.dart';
import 'package:alxgration_speedometer/speedometer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepPurple,
              accentColor: Colors.deepOrangeAccent)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int progress = 0;
  int maxVal = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Speedometer Widget"),
        ),
        body: Column(children: [
          Speedometer(
            size: 200,
            minValue: 0,
            maxValue: maxVal,
            currentValue: progress,
            barColor: Colors.purple,
            pointerColor: Colors.black,
            displayText: "km/h",
            displayTextStyle: TextStyle(fontSize: 24, color: Colors.deepOrange),
            displayNumericStyle: TextStyle(fontSize: 24, color: Colors.red),
            onComplete: () {
              showSnackbar();
            },
          ),
          ElevatedButton(
              onPressed: () {
                increaseProgress();
              },
              child: Text("start"))
        ])
    );
  }



  void showSnackbar() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("ON COMPLETE"),
          )
      );
    });
  }

  void increaseProgress() async {
    for (int i = 0; i < maxVal; i++) {
      var j = Future.delayed(const Duration(seconds: 1), () {
        return i;
      });
      progress = (await j) + 1;
      setState(() {});
    }
  }
}
