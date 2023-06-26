import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:landlord/ui/common/button.dart';
import 'package:landlord/ui/pages/main/main_page.dart';
import 'package:landlord/ui/resource/images.dart';
import 'package:landlord/ui/resource/styles.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  Widget buildTextFieldCard({
    required FocusNode focusNode,
    required TextEditingController controller,
    required String label,
    required String imageAsset,
    required bool obsureText,
    required TextInputType textInputType,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: GestureDetector(
        onTap: () {
          focusNode.requestFocus();
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Text(
                  label,
                  style: ResourceTextStyle.light,
                ),
              ),
              TextField(
                scrollPadding: EdgeInsets.zero,
                maxLines: 1,
                controller: controller,
                focusNode: focusNode,
                keyboardType: textInputType,
                style: ResourceTextStyle.medium.copyWith(height: 1),
                obscureText: obsureText,
                cursorColor: ResourceTextStyle.COLOR,
                decoration: InputDecoration(
                  isDense: true,
                  constraints: BoxConstraints(maxHeight: 30),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: SvgPicture.asset(
                      imageAsset,
                      height: 10,
                      width: 10,
                      color: ResourceTextStyle.COLOR,
                    ),
                  ),
                  suffix: const SizedBox(width: 8),
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: RightAnglePainter(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                Text(
                  'Login',
                  style: ResourceTextStyle.mainTitle.copyWith(fontSize: 38),
                ),
                SizedBox(height: 10),
                Text(
                  'Please sign in to continue.',
                  style: ResourceTextStyle.medium,
                ),
                SizedBox(height: 40),
                buildTextFieldCard(
                  focusNode: emailFocus,
                  controller: emailController,
                  label: 'Email adress',
                  imageAsset: ResoureImage.ic_email,
                  obsureText: false,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                buildTextFieldCard(
                    focusNode: passwordFocus,
                    controller: passwordController,
                    label: 'Password',
                    imageAsset: ResoureImage.ic_password,
                    obsureText: true,
                    textInputType: TextInputType.visiblePassword),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button.outlineWIdget(
                      Row(
                        children: [
                          Text('Continue', style: ResourceTextStyle.medium),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                      onTap: () {
                        final route = MaterialPageRoute(builder: (_) => MainPage());
                        Navigator.of(context).pushReplacement(route);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 55),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      'or connect with',
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                        indent: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Container(
                        height: 35,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Color(0xfffe4935),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: ResourceTextStyle.COLOR,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(width: 5),
                            Image.asset(ResoureImage.ic_google),
                            const SizedBox(width: 5),
                            Text(
                              'Google',
                              style: ResourceTextStyle.bold.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        height: 35,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Color(0xff4267b2),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: ResourceTextStyle.COLOR,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(width: 5),
                            Image.asset(ResoureImage.ic_facebook),
                            const SizedBox(width: 5),
                            Text(
                              'Facebook',
                              style: ResourceTextStyle.bold.copyWith(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RightAnglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = ResourceTextStyle.PRIMARY_1
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    Path path = Path()..moveTo(size.width - 53, 0);
    path.conicTo(
      size.width - 160,
      45,
      size.width - 125,
      105,
      2,
    );

    path.moveTo(size.width - 125, 105);
    path.conicTo(size.width - 115, 122, size.width - 40, 92, 2);
    path.moveTo(size.width - 40, 92);
    path.conicTo(size.width - 20, 85, size.width, 82, 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(RightAnglePainter oldDelegate) => false;
}
