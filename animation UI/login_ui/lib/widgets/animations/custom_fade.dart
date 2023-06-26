import 'package:flutter/material.dart';

class CustomFade extends StatefulWidget {
  const CustomFade({Key? key, required this.delay, required this.child})
      : super(key: key);

  final double delay;
  final Widget child;

  @override
  State<CustomFade> createState() => _CustomFadeState();
}

class _CustomFadeState extends State<CustomFade> with TickerProviderStateMixin {
  final _animationDuration = const Duration(milliseconds: 500);

  late final Animation<double> _opacity;
  late final Animation<double> _translateY;

  @override
  void initState() {
    final opacityController = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );

    final translateController = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );

    _opacity = Tween(begin: 0.0, end: 1.0).animate(opacityController);
    _translateY = Tween(begin: -30.0, end: 0.0).animate(
      CurvedAnimation(parent: translateController, curve: Curves.easeInOut),
    );

    Future.delayed(
      Duration(milliseconds: (300 * widget.delay).round()),
    ).then((value) {
      opacityController.forward();
      translateController.forward();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: AnimatedBuilder(
        animation: _translateY,
        child: widget.child,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _translateY.value),
            child: child,
          );
        },
      ),
    );
  }
}
