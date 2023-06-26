import 'package:flutter/material.dart';

class CrossFadeScreenDat extends StatefulWidget {
  const CrossFadeScreenDat({Key? key}) : super(key: key);

  @override
  State<CrossFadeScreenDat> createState() => _CrossFadeScreenDatState();
}

class _CrossFadeScreenDatState extends State<CrossFadeScreenDat> {
  final _animationDuration = const Duration(seconds: 1);

  bool _signInMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cross Fade'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 30.0,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: AnimatedCrossFade(
            firstCurve: Curves.easeOutBack,
            secondCurve: Curves.easeInBack,
            duration: _animationDuration,
            crossFadeState: _signInMode
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: LogIn(
              onTap: () {
                setState(() {
                  _signInMode = false;
                });
              },
            ),
            secondChild: SignUp(
              onTap: () {
                setState(() {
                  _signInMode = true;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  InputDecoration _fieldDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8.0),
        const Text(
          'Sign In',
          style: TextStyle(fontSize: 24.0),
        ),
        const SizedBox(height: 10.0),
        TextField(
          decoration: _fieldDecoration('Name'),
        ),
        const SizedBox(height: 10.0),
        TextField(
          decoration: _fieldDecoration('Password'),
        ),
        const SizedBox(height: 30.0),
        TextButton(
          onPressed: onTap,
          child: const Text('Create an account'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Sign In'),
        )
      ],
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  InputDecoration _fieldDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8.0),
        const Text(
          'Sign In',
          style: TextStyle(fontSize: 24.0),
        ),
        const SizedBox(height: 10.0),
        TextField(
          decoration: _fieldDecoration('Name'),
        ),
        const SizedBox(height: 10.0),
        TextField(
          decoration: _fieldDecoration('Password'),
        ),
        const SizedBox(height: 10.0),
        TextField(
          decoration: _fieldDecoration('Confirm'),
        ),
        const SizedBox(height: 30.0),
        TextButton(
          onPressed: onTap,
          child: const Text('Sign Up'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Create'),
        )
      ],
    );
  }
}
