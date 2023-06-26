import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:rive_animations/widgets/custom_scaffold.dart';

class ListViewAnimationScreen extends StatelessWidget {
  const ListViewAnimationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'List View Animation',
      body: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 1)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return AnimationLimiter(
              child: ListView.builder(
                itemCount: 100,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: const SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Card(
                          elevation: 10.0,
                          child: SizedBox(
                            width: double.infinity,
                            height: 100.0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
