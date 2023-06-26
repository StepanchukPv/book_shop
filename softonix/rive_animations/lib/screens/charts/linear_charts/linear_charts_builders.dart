part of 'linear_charts_screen.dart';

// [Start] LineChartData section
LineChartData _getChartTemplate(
  List<LineChartBarData> lineBarsData, {
  double? maxY,
}) {
  return LineChartData(
    minY: 0.0,
    maxY: maxY,
    borderData: FlBorderData(show: false),
    lineBarsData: lineBarsData,
    gridData: FlGridData(
        // show: false,

        ),
    titlesData: _titlesData,
    lineTouchData: LineTouchData(
      getTouchedSpotIndicator: (_, lst) {
        return lst.map((e) {
          return TouchedSpotIndicatorData(
            FlLine(
              color: Colors.white,
              dashArray: [3, 2],
            ),
            FlDotData(
              show: false,
            ),
          );
        }).toList();
      },
      touchTooltipData: LineTouchTooltipData(
          maxContentWidth: 100,
          tooltipRoundedRadius: 30.0,
          tooltipBgColor: Colors.white,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              return LineTooltipItem(
                touchedSpot.y.toStringAsFixed(2),
                const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              );
            }).toList();
          }),
    ),
  );
}

// [End] LineChartData section

// [Start] LineChartBar section

List<LineChartBarData> _lineChartBars(List<FlSpot> spots) {
  return [
    LineChartBarData(
      spots: spots,
      isCurved: false,
      color: Colors.white70,
      showingIndicators: List.generate(17, (index) => index),
      barWidth: 2,
      dotData: FlDotData(
        getDotPainter: (_, __, ___, ____) {
          return FlDotCirclePainter(
            radius: 2.5,
            color: Colors.white,
            strokeWidth: 1,
            strokeColor: Colors.black,
          );
        },
      ),
      belowBarData: BarAreaData(
        show: true,
        spotsLine: BarAreaSpotsLine(
          show: true,
          flLineStyle: FlLine(
            color: Colors.grey,
            dashArray: [2, 3],
          ),
        ),
        gradient: LinearGradient(
          colors: [
            Colors.pink.withOpacity(0.9),
            Colors.purple.withOpacity(0.9)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    ),
  ];
}

// [End] LineChartBar section

// [Start] Titles section

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


// [End] Titles section
