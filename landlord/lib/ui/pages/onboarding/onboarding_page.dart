import 'package:flutter/material.dart';

import 'package:landlord/ui/common/button.dart';
import 'package:landlord/ui/pages/auth/auth.dart';
import 'package:landlord/ui/resource/images.dart';
import 'package:landlord/ui/resource/styles.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: Image.asset(ResoureImage.img_main_logo),
            ),
            SizedBox(height: 40),
            Text(
              'LandLord helper',
              style: ResourceTextStyle.mainTitle,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'If you want to increase the efficiency of your real estate business then this application is for you',
                style: TextStyle(
                  color: Color(0xff333333),
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
            Button.outline(
              'Continue',
              onTap: () {
                final route = MaterialPageRoute(builder: (_) => AuthPage());
                Navigator.of(context).push(route);
              },
              constraints: BoxConstraints(maxWidth: 130, maxHeight: 50),
            ),
          ],
        ),
      ),
    );
  }
}
