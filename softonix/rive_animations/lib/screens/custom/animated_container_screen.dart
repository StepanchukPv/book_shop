import 'package:flutter/material.dart';
import 'package:rive_animations/widgets/custom_scaffold.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  bool _tapped = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Animated Container',
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _tapped = !_tapped;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                if (_tapped)
                  const BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                    spreadRadius: 0.2,
                    offset: Offset(0, 2),
                    blurStyle: BlurStyle.solid,
                  )
              ],
            ),
            padding: const EdgeInsets.all(12.0),
            child: const Icon(
              Icons.apple_rounded,
              size: 42.0,
            ),
          ),
        ),
      ),
    );
  }
}
