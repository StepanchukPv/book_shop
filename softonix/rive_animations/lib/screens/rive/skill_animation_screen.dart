import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class SkillAnimationScreen extends StatefulWidget {
  const SkillAnimationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SkillAnimationScreen> createState() => _SkillAnimationScreenState();
}

class _SkillAnimationScreenState extends State<SkillAnimationScreen> {
  Artboard? _artboard;
  SMINumber? _progress;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  ButtonStyle _buttonStyle(int index) {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: index == _progress!.value
            ? Theme.of(context).primaryColor
            : Colors.grey,
      ),
    );
  }

  Future<void> _initAnimation() async {
    final bytes = await rootBundle.load('assets/animations/skills_demo.riv');
    final file = RiveFile.import(bytes);
    final artboard = file.mainArtboard;

    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine ');

    if (controller != null) {
      artboard.addController(controller);

      _progress = (controller.inputs.firstWhere(
        (element) => element.name == 'Level',
      ) as SMINumber);

      setState(() {
        _artboard = artboard;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skill animation'),
      ),
      body: _artboard == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Rive(
                    artboard: _artboard!,
                    useArtboardSize: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      style: _buttonStyle(0),
                      child: const Text('Beginner'),
                      onPressed: () {
                        _progress?.value = 0;
                        setState(() {});
                      },
                    ),
                    OutlinedButton(
                      style: _buttonStyle(1),
                      child: const Text('Intermediate'),
                      onPressed: () {
                        _progress?.value = 1;
                        setState(() {});
                      },
                    ),
                    OutlinedButton(
                      style: _buttonStyle(2),
                      child: const Text('Expert'),
                      onPressed: () {
                        _progress?.value = 2;
                        setState(() {});
                      },
                    )
                  ],
                )
              ],
            ),
    );
  }
}
