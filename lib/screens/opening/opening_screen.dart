import 'package:flutter/material.dart';
import 'package:todo/screens/opening/opening_items/head_image.dart';
import 'package:todo/screens/opening/opening_items/next_button.dart';
import 'package:todo/screens/opening/opening_items/welcome_text.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: const Color(0xffFE4775),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HeadImage(),
                SizedBox(
                  height: 50,
                ),
                WelcomeText(),
                NextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
