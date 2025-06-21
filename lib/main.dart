import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Demo Home Page')),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            padding: const EdgeInsets.all(18.0),
            width: 600,
            height: 600,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Chart(
                layers: [
                  ChartAxisLayer(
                    settings: ChartAxisSettings(
                      x: ChartAxisSettingsAxis(
                        frequency: 1.0,
                        max: 13.0,
                        min: 7.0,
                        textStyle: TextStyle(color: Colors.black, fontSize: 10.0),
                      ),
                      y: ChartAxisSettingsAxis(
                        frequency: 100.0,
                        max: 300.0,
                        min: 0.0,
                        textStyle: TextStyle(color: Colors.black, fontSize: 10.0),
                      ),
                    ),
                    labelX: (value) => value.toInt().toString(),
                    labelY: (value) => value.toInt().toString(),
                  ),
                  ChartLineLayer(
                    items: List.generate(
                      13 - 7 + 1,
                      (index) => ChartLineDataItem(
                        // color: const Color(0xFF8043F9),
                        value: Random().nextInt(280) + 20,
                        x: index.toDouble() + 7,
                      ),
                    ),
                    settings: const ChartLineSettings(
                      thickness: 8.0,
                      color: Colors.cyanAccent,
                      // radius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
