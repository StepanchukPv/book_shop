import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

part 'linear_charts_builders.dart';

class LinearChartsScreen extends StatefulWidget {
  const LinearChartsScreen({Key? key}) : super(key: key);

  @override
  State<LinearChartsScreen> createState() => _LinearChartsScreenState();
}

class _LinearChartsScreenState extends State<LinearChartsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Chart'),
      ),
      backgroundColor: Colors.indigo,
      body: const Padding(
        padding: EdgeInsets.only(
          top: 120.0,
          right: 10.0,
          left: 10.0,
        ),
        child: MyChart(),
      ),
    );
  }
}

class MyChart extends StatefulWidget {
  const MyChart({Key? key}) : super(key: key);

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  bool isInited = false;

  late final spots = generateSpots();
  late final spotsForAnimation = generateSpots(y: 5);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 150)).then((_) {
      setState(() {
        isInited = true;
      });
    });
  }

  List<FlSpot> generateSpots({double? y}) {
    final rand = Random();

    dev.log('generate');

    return List.generate(
      17,
      (index) => FlSpot(
        index.toDouble(),
        y ?? rand.nextInt(20) + 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: LineChart(
        swapAnimationDuration: const Duration(milliseconds: 400),
        swapAnimationCurve: Curves.easeIn,
        isInited
            ? _getChartTemplate(
                _lineChartBars(spots),
              )
            : _getChartTemplate(
                _lineChartBars(spotsForAnimation),
                maxY: 10,
              ),
      ),
    );
  }
}
