import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rive_animations/widgets/custom_scaffold.dart';

class _ListItem {
  _ListItem({
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;
}

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  final _listKey = GlobalKey<AnimatedListState>();
  final _items = <_ListItem>[];

  final _animationOffset = Tween(
    begin: const Offset(1, 0),
    end: const Offset(0, 0),
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final rand = Random();

      for (int i = 0; i <= 20; i++) {
        final newItem = _ListItem(
          title: 'Item $i',
          color: Color.fromRGBO(
            rand.nextInt(256),
            rand.nextInt(256),
            rand.nextInt(256),
            rand.nextDouble(),
          ),
        );

        _items.add(newItem);
        await Future.delayed(const Duration(milliseconds: 60));
        _listKey.currentState?.insertItem(
          i,
          duration: const Duration(milliseconds: 400),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Animated List',
      fab: FloatingActionButton(
        onPressed: () {
          final rand = Random();

          final newItem = _ListItem(
            title: 'headline6',
            color: Color.fromRGBO(
              rand.nextInt(256),
              rand.nextInt(256),
              rand.nextInt(256),
              rand.nextDouble(),
            ),
          );

          _items.insert(0, newItem);
          _listKey.currentState?.insertItem(
            0,
            duration: const Duration(milliseconds: 400),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: AnimatedList(
        key: _listKey,
        itemBuilder: (_, index, animation) {
          return SlideTransition(
            position: animation.drive(_animationOffset),
            child: Card(
              elevation: 4.0,
              color: _items[index].color,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                alignment: Alignment.center,
                child: Text(
                  'Item $index',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
