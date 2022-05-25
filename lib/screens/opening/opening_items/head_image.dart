import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HeadImage extends StatelessWidget {
  const HeadImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 97.w,
        height: 42.h,
        child: Image.asset(
          'assets/images/opening.png',
          matchTextDirection: true,
          fit: BoxFit.cover,
        ));
  }
}