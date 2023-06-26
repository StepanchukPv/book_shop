import 'package:flutter/material.dart';
import 'package:rive_animations/screens/charts/bar_charts/bar_chart_screen.dart';
import 'package:rive_animations/screens/charts/bar_charts/bar_example_screen.dart';
import 'package:rive_animations/screens/charts/circle_charts/circle_chart_screen.dart';
import 'package:rive_animations/screens/charts/circle_charts/circle_example_screen.dart';
import 'package:rive_animations/screens/charts/linear_charts/linear_charts_screen.dart';
import 'package:rive_animations/screens/charts/linear_charts/linear_example_screen.dart';

class _ItemModel {
  _ItemModel({
    required this.title,
    required this.screen,
  });

  final String title;
  final Widget screen;
}

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  List<_ItemModel> get _items {
    return [
      _ItemModel(
        title: 'Example Linear Chart',
        screen: const LinearExampleScreen(),
      ),
      _ItemModel(
        title: 'Custom Linear Chart',
        screen: const LinearChartsScreen(),
      ),
      _ItemModel(
        title: 'Example Bar Chart',
        screen: const BarExampleScreen(),
      ),
      _ItemModel(
        title: 'Custom Bar Chart',
        screen: const BarChartScreen(),
      ),
      _ItemModel(
        title: 'Example Pie Chart',
        screen: const CircleExampleScreen(),
      ),
      _ItemModel(
        title: 'Sync Chart',
        screen: const CircleChartScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _items.length,
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 30.0,
      ),
      separatorBuilder: (_, int index) {
        return const SizedBox(height: 6.0);
      },
      itemBuilder: (_, int index) {
        return ElevatedButton(
          onPressed: () {
            Route route = MaterialPageRoute(
              builder: (context) => _items[index].screen,
            );

            Navigator.push(context, route);
          },
          child: Text(_items[index].title),
        );
      },
    );
  }
}
