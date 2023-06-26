import 'package:flutter/material.dart';

class BounceAnimationScreen extends StatefulWidget {
  const BounceAnimationScreen({Key? key}) : super(key: key);

  @override
  State<BounceAnimationScreen> createState() => _BounceAnimationScreenState();
}

class _BounceAnimationScreenState extends State<BounceAnimationScreen>
    with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double bigLogo = 100;
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Bounce Animation '),
          ),
        ),
        PositionedTransition(
          rect: RelativeRectTween(
            begin: RelativeRect.fromSize(
              const Rect.fromLTWH(150, 140, bigLogo, bigLogo),
              size,
            ),
            end: RelativeRect.fromSize(
              Rect.fromLTWH(
                150,
                size.height - bigLogo - 140,
                bigLogo,
                bigLogo,
              ),
              size,
            ),
          ).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.bounceOut,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset('assets/images/ball.png'),
          ),
        ),
        const Positioned(
          bottom: -240,
          left: 0.0,
          right: 0.0,
          child: EarthAnimation(),
        ),
      ],
    );
  }
}

class EarthAnimation extends StatefulWidget {
  const EarthAnimation({Key? key}) : super(key: key);

  @override
  State<EarthAnimation> createState() => _EarthAnimationState();
}

class _EarthAnimationState extends State<EarthAnimation>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset('assets/images/planet.png'),
    );
  }
}
