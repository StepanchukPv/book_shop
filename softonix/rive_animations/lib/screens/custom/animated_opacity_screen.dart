import 'package:flutter/material.dart';
import 'package:rive_animations/widgets/custom_scaffold.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  bool _triggered = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Animated Opacity',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _triggered ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: Container(
              width: double.infinity,
              height: 250.0,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 12.0),
          ElevatedButton(
            onPressed: () => setState(() {
              _triggered = !_triggered;
            }),
            child: const Text('Animate'),
          )
        ],
      ),
    );
  }
}
