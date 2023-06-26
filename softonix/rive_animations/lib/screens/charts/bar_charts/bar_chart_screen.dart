import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartScreen extends StatelessWidget {
  const BarChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text('Custom Bar Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: const [
            Expanded(
              child: CustomChartBar(),
            ),
            Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}

class CustomChartBar extends StatefulWidget {
  const CustomChartBar({Key? key}) : super(key: key);

  @override
  State<CustomChartBar> createState() => _CustomChartBarState();
}

class _CustomChartBarState extends State<CustomChartBar> {
  bool isInit = false;

  late final mainBars = generateBars();
  late final barsForAnimation = generateBars(y: 3);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 150)).then((value) {
      setState(() {
        isInit = true;
      });
    });
  }

  List<Offset> generateBars({double? y}) {
    final rand = Random();

    return List.generate(17, (index) {
      return Offset(index.toDouble(), y ?? rand.nextInt(10) + 5.0);
    });
  }

  List<BarChartGroupData> get barGroups {
    final list = isInit ? mainBars : barsForAnimation;

    final minValue = mainBars.fold<double>(1000, (previousValue, element) {
      if (element.dy < previousValue) {
        previousValue = element.dy;
      }

      return previousValue;
    });

    List<BarChartGroupData> requestedData = [];

    for (int i = 0; i < list.length; i++) {
      requestedData.add(
        buildChart(
          x: list[i].dx,
          y: list[i].dy,
          isMin: mainBars[i].dy == minValue,
        ),
      );
    }

    return requestedData;
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 20.0,
        barGroups: barGroups,
        borderData: FlBorderData(show: false),
        titlesData: _titlesData,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipRoundedRadius: 20.0,
            tooltipPadding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0)
                    .copyWith(top: 7.0),
            tooltipBgColor: Colors.pink,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(group.barRods.last.toY.toStringAsFixed(2),
                  const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center);
            },
          ),
        ),
        gridData: FlGridData(
          show: false,
        ),
      ),
      swapAnimationDuration: const Duration(milliseconds: 350),
      swapAnimationCurve: Curves.easeInQuart,
    );
  }
}

BarChartGroupData buildChart({
  required double x,
  required double y,
  required bool isMin,
}) {
  return BarChartGroupData(
    x: x.toInt() + 1,
    barRods: [
      BarChartRodData(
        toY: y.toDouble(),
        gradient: LinearGradient(
          colors: isMin
              ? [Colors.pinkAccent, Colors.pink]
              : [Colors.lightBlueAccent, Colors.blue.shade600],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        width: 20,
        borderRadius: BorderRadius.circular(2.0),
      ),
    ],
  );
}

FlTitlesData get _titlesData {
  return FlTitlesData(
    rightTitles: AxisTitles(),
    topTitles: AxisTitles(),
    leftTitles: AxisTitles(),
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        interval: 1.0,
        getTitlesWidget: (value, _) => _TitlesWidget(
          value: value,
        ),
      ),
    ),
  );
}

class _TitlesWidget extends StatelessWidget {
  const _TitlesWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  final double value;

  String get _title {
    final intValue = value.toInt();

    if (intValue < 10 && intValue != 0) {
      return '0$intValue';
    }
    return '$intValue';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Text(
        _title,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
