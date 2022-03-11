import 'package:flutter/material.dart';

class HeadImage extends StatelessWidget {
  const HeadImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 350,
        height: 300,
        child: Image.asset(
          'assets/images/opening.png',
          fit: BoxFit.cover,
        ));
  }
}