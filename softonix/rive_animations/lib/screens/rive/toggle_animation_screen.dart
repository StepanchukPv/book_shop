import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class ToggleAnimationScreen extends StatefulWidget {
  const ToggleAnimationScreen({Key? key}) : super(key: key);

  @override
  State<ToggleAnimationScreen> createState() => _ToggleAnimationScreenState();
}

class _ToggleAnimationScreenState extends State<ToggleAnimationScreen> {
  Artboard? _artboard;
  SMIBool? _progress;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  Future<void> _initAnimation() async {
    final bytes = await rootBundle.load('assets/animations/toggle.riv');
    final file = RiveFile.import(bytes);
    final artboard = file.mainArtboard;

    final controller =
        StateMachineController.fromArtboard(artboard, 'Remember Start SM');

    if (controller != null) {
      artboard.addController(controller);

      _progress = (controller.inputs.firstWhere(
        (element) => element.name == 'Toggle',
      ) as SMIBool);

      setState(() {
        _artboard = artboard;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text('Toggle Animation')),
      body: _artboard == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GestureDetector(
              onTap: () {
                _progress!.value = !_progress!.value;
              },
              child: Rive(
                useArtboardSize: true,
                artboard: _artboard!,
              ),
            ),
    );
  }
}
