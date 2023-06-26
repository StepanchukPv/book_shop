import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class SlashAnimationScreen extends StatefulWidget {
  const SlashAnimationScreen({Key? key}) : super(key: key);

  @override
  State<SlashAnimationScreen> createState() => _SlashAnimationScreenState();
}

class _SlashAnimationScreenState extends State<SlashAnimationScreen> {
  Artboard? _artboard;
  SMIBool? _progress;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  Future<void> _initAnimation() async {
    final bytes = await rootBundle.load('assets/animations/slash_music.riv');
    final file = RiveFile.import(bytes);
    final artboard = file.mainArtboard;

    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');

    if (controller != null) {
      artboard.addController(controller);

      _progress = (controller.inputs.firstWhere(
        (element) => element.name == 'isHidden',
      ) as SMIBool);

      _progress!.value = false;

      setState(() {
        _artboard = artboard;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('Slash Animation'),
      ),
      body: _artboard == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(height: 260, child: Rive(artboard: _artboard!)),
                ElevatedButton(
                  onPressed: () {
                    _progress!.value = !_progress!.value;
                  },
                  child: const Text('Change'),
                )
              ],
            ),
    );
  }
}
