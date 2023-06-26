import 'package:flutter/material.dart';
import 'package:rive_animations/screens/custom/animated_align_screen.dart';
import 'package:rive_animations/screens/custom/animated_container_screen.dart';
import 'package:rive_animations/screens/custom/animated_icon_screen.dart';
import 'package:rive_animations/screens/custom/animated_list_screen.dart';
import 'package:rive_animations/screens/custom/animated_opacity_screen.dart';
import 'package:rive_animations/screens/custom/animated_positioned_screen.dart';
import 'package:rive_animations/screens/custom/animated_size_screen.dart';
import 'package:rive_animations/screens/custom/animated_text_screen.dart';
import 'package:rive_animations/screens/custom/cross_fade_screen.dart';
import 'package:rive_animations/screens/custom/selected_list_screen.dart';

import 'bounce_animation_screen.dart';

class _ItemModel {
  _ItemModel({
    required this.title,
    required this.screen,
  });

  final String title;
  final Widget screen;
}

class CustomAnimationScreen extends StatelessWidget {
  const CustomAnimationScreen({Key? key}) : super(key: key);

  List<_ItemModel> get _items {
    return [
      _ItemModel(
        title: 'Cross Fade',
        screen: const CrossFadeScreenDat(),
      ),
      _ItemModel(
        title: 'Animated Text',
        screen: const AnimatedTextScreen(),
      ),
      _ItemModel(
        title: 'Animated Icon',
        screen: const AnimatedIconScreen(),
      ),
      _ItemModel(
        title: 'Animated Align',
        screen: const AnimatedAlignScreen(),
      ),
      _ItemModel(
        title: 'Animated Opacity',
        screen: const AnimatedOpacityScreen(),
      ),
      _ItemModel(
        title: 'Animated Container',
        screen: const AnimatedContainerScreen(),
      ),
      _ItemModel(
        title: 'Animated Positioned',
        screen: const AnimatedPositionedScreen(),
      ),
      _ItemModel(
        title: 'Animated Size',
        screen: const AnimatedSizeScreen(),
      ),
      _ItemModel(
        title: 'Animated List',
        screen: const AnimatedListScreen(),
      ),
      _ItemModel(
        title: 'Bounce Animation',
        screen: const BounceAnimationScreen(),
      ),
      _ItemModel(
        title: 'Animated Selection',
        screen: const SelectedListScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _items.length,
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 30.0,
      ),
      separatorBuilder: (_, int index) {
        return const SizedBox(height: 6.0);
      },
      itemBuilder: (_, int index) {
        return ElevatedButton(
          onPressed: () {
            Route route = MaterialPageRoute(
              builder: (context) => _items[index].screen,
            );

            if (_items[index].screen is AnimatedPositionedScreen) {
              route = PageRouteBuilder(
                pageBuilder: (_, __, ___) {
                  return _items[index].screen;
                },
                transitionDuration: const Duration(seconds: 1),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              );
            }

            Navigator.push(context, route);
          },
          child: Text(_items[index].title),
        );
      },
    );
  }
}
