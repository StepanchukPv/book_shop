import 'package:flutter/material.dart';
import 'package:rive_animations/widgets/custom_scaffold.dart';

class AnimatedAlignScreen extends StatefulWidget {
  const AnimatedAlignScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedAlignScreen> createState() => _AnimatedAlignScreenState();
}

class _AnimatedAlignScreenState extends State<AnimatedAlignScreen> {
  bool _triggered = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Animated Align',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 250.0,
            color: Colors.deepPurple.shade200,
            child: AnimatedAlign(
              duration: const Duration(seconds: 1),
              alignment: _triggered ? Alignment.topRight : Alignment.bottomLeft,
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(
                size: 68.0,
              ),
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
