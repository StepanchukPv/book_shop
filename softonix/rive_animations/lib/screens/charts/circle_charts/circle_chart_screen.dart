import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircleChartScreen extends StatelessWidget {
  const CircleChartScreen({Key? key}) : super(key: key);

  List<_PieData> get pieData {
    return List.generate(4, (index) => _PieData('aaaaa', 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SfCircularChart(
              title: ChartTitle(text: 'Sales by sales person'),
              legend: Legend(isVisible: true),
              series: <PieSeries<_PieData, String>>[
            PieSeries<_PieData, String>(
                explode: true,
                explodeIndex: 0,
                dataSource: pieData,
                xValueMapper: (_PieData data, _) => data.xData,
                yValueMapper: (_PieData data, _) => data.yData,
                dataLabelMapper: (_PieData data, _) => data.text,
                dataLabelSettings: const DataLabelSettings(isVisible: true)),
          ])),
    );
  }
}

class _PieData {
  _PieData(this.xData, this.yData, [this.text = '']);
  final String xData;
  final num yData;
  final String text;
}
