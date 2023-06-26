import 'package:flutter/material.dart';
import 'package:rive_animations/widgets/custom_scaffold.dart';

class AnimatedSizeScreen extends StatefulWidget {
  const AnimatedSizeScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedSizeScreen> createState() => _AnimatedSizeScreenState();
}

class _AnimatedSizeScreenState extends State<AnimatedSizeScreen> {
  bool _triggered = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Animated Sized Box',
      body: GestureDetector(
        onTap: () => setState(() {
          _triggered = !_triggered;
        }),
        child: Container(
          color: Colors.purple,
          child: AnimatedSize(
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: FlutterLogo(
              size: _triggered ? 300 : 100,
            ),
          ),
        ),
      ),
    );
  }
}
