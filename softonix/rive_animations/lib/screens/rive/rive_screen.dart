import 'package:flutter/material.dart';

import 'skill_animation_screen.dart';
import 'slash_animation_screen.dart';
import 'teddy_animation_screen.dart';
import 'toggle_animation_screen.dart';

class RiveScreen extends StatelessWidget {
  const RiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: double.infinity, height: 4.0),
        ElevatedButton(
          onPressed: () {
            final route = MaterialPageRoute(
              builder: (context) => const SkillAnimationScreen(),
            );

            Navigator.push(context, route);
          },
          child: const Text('Skill Animation'),
        ),
        const SizedBox(height: 6.0),
        ElevatedButton(
          onPressed: () {
            final route = MaterialPageRoute(
              builder: (context) => const ToggleAnimationScreen(),
            );

            Navigator.push(context, route);
          },
          child: const Text('Toggle Animation'),
        ),
        const SizedBox(height: 6.0),
        ElevatedButton(
          onPressed: () {
            final route = MaterialPageRoute(
              builder: (context) => const TeddyAnimationScreen(),
            );

            Navigator.push(context, route);
          },
          child: const Text('Teddy Animation'),
        ),
        const SizedBox(height: 6.0),
        ElevatedButton(
          onPressed: () {
            final route = MaterialPageRoute(
              builder: (context) => const SlashAnimationScreen(),
            );

            Navigator.push(context, route);
          },
          child: const Text('Slash Animation'),
        ),
        const SizedBox(height: 6.0),
      ],
    );
  }
}
