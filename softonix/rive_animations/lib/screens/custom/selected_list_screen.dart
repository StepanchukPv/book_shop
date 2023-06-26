import 'package:flutter/material.dart';
import 'package:rive_animations/widgets/custom_scaffold.dart';

class SelectedListScreen extends StatefulWidget {
  const SelectedListScreen({Key? key}) : super(key: key);

  @override
  State<SelectedListScreen> createState() => _SelectedListScreenState();
}

class _SelectedListScreenState extends State<SelectedListScreen> {
  final List<int> _selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Select Animation',
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (_, int i) {
          final isSelected = _selectedIndexes.contains(i);

          return GestureDetector(
            onLongPress: () {
              if (isSelected) {
                _selectedIndexes.remove(i);
              } else {
                _selectedIndexes.add(i);
              }

              setState(() {});
            },
            child: AnimatedPadding(
              duration: const Duration(
                milliseconds: 200,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isSelected ? 16 : 32,
                vertical: isSelected ? 8 : 16,
              ),
              child: AnimatedOpacity(
                duration: const Duration(
                  milliseconds: 200,
                ),
                opacity: isSelected ? 0.7 : 1,
                child: Container(
                  color: Colors.blue,
                  height: 100,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
