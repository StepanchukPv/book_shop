import 'package:flutter/material.dart';

class AnimatedTextScreen extends StatefulWidget {
  const AnimatedTextScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedTextScreen> createState() => _AnimatedTextScreenState();
}

class _AnimatedTextScreenState extends State<AnimatedTextScreen> {
  bool _largeText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Text'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          AnimatedDefaultTextStyle(
            curve: Curves.easeInBack,
            textAlign: TextAlign.center,
            style: _largeText
                ? const TextStyle(fontSize: 68.0, color: Colors.blueAccent)
                : const TextStyle(fontSize: 24.0, color: Colors.amber),
            duration: const Duration(milliseconds: 600),
            child: const Text('Custom\nText'),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _largeText = !_largeText;
              });
            },
            child: const Text('Animate'),
          )
        ],
      ),
    );
  }
}
