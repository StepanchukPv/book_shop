import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_inv/core/home_bloc/home_bloc.dart';
import 'package:sentry_inv/core/home_bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sentry Inv'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: double.maxFinite),
                ElevatedButton(
                  onPressed: () async {
                    await Sentry.captureException('Error');
                  },
                  child: const Text('Log Error'),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>().load();
                  },
                  child: const Text('Call load on bloc'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
