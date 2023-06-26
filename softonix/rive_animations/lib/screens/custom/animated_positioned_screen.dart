import 'package:flutter/material.dart';
import 'package:rive_animations/widgets/custom_scaffold.dart';

class AnimatedPositionedScreen extends StatefulWidget {
  const AnimatedPositionedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionedScreen> createState() =>
      _AnimatedPositionedScreenState();
}

class _AnimatedPositionedScreenState extends State<AnimatedPositionedScreen> {
  bool _triggered = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Animated Positioned',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Stack(
          children: [
            AnimatedPositioned(
              width: _triggered ? 200.0 : 50.0,
              height: _triggered ? 50.0 : 200.0,
              top: _triggered ? 50.0 : 200.0,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: GestureDetector(
                onTap: () => setState(() {
                  _triggered = !_triggered;
                }),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
