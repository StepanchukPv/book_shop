import 'package:flutter/material.dart';
import 'package:rive_animations/widgets/custom_scaffold.dart';

class AnimatedIconScreen extends StatelessWidget {
  const AnimatedIconScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Animated Icon',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(width: double.infinity),
          PlayerButton(),
        ],
      ),
    );
  }
}

class PlayerButton extends StatefulWidget {
  const PlayerButton({Key? key}) : super(key: key);

  @override
  State<PlayerButton> createState() => _PlayerButtonState();
}

class _PlayerButtonState extends State<PlayerButton>
    with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFF4713),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          if (_animationController.status == AnimationStatus.completed) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: _animationController,
            color: Colors.white,
            size: 64.0,
          ),
        ),
      ),
    );
  }
}
