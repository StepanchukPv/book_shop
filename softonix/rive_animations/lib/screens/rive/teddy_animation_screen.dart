import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class TeddyAnimationScreen extends StatefulWidget {
  const TeddyAnimationScreen({Key? key}) : super(key: key);

  @override
  State<TeddyAnimationScreen> createState() => _TeddyAnimationScreenState();
}

class _TeddyAnimationScreenState extends State<TeddyAnimationScreen> {
  Artboard? _artboard;
  SMIBool? _handUp;
  SMINumber? _eyesProgress;

  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  Future<void> _initAnimation() async {
    final bytes = await rootBundle.load('assets/animations/teddy.riv');
    final file = RiveFile.import(bytes);
    final artboard = file.mainArtboard;

    final controller =
        StateMachineController.fromArtboard(artboard, 'Login Machine');

    if (controller != null) {
      artboard.addController(controller);

      _handUp = (controller.inputs.firstWhere(
        (element) => element.name == 'isHandsUp',
      ) as SMIBool);

      controller.inputs
          .firstWhere((element) => element.name == 'isChecking')
          .value = true;

      _eyesProgress = (controller.inputs.firstWhere(
        (element) => element.name == 'numLook',
      ) as SMINumber);

      focusNode.addListener(() {
        _handUp!.value = focusNode.hasFocus;
      });

      setState(() {
        _artboard = artboard;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6E2EA),
      appBar: AppBar(
        title: const Text('Teddy animation'),
      ),
      body: _artboard == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              children: [
                Rive(
                  artboard: _artboard!,
                  useArtboardSize: true,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                        ),
                        onChanged: (value) {
                          _eyesProgress!.value = value.length * 1.8;
                        },
                      ),
                      const SizedBox(height: 12.0),
                      TextField(
                        focusNode: focusNode,
                        obscureText: true,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
