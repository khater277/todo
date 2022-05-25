import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/screens/opening/opening_items/head_image.dart';
import 'package:todo/screens/opening/opening_items/next_button.dart';
import 'package:todo/screens/opening/opening_items/welcome_text.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xffFE4775),
        child: Padding(
          padding: EdgeInsets.only(bottom: 7.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadImage(),
              SizedBox(height: 7.h,),
              const WelcomeText(),
              const NextButton(),
            ],
          ),
        ),
      ),
    );
  }
}
