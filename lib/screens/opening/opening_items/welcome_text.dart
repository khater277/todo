import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "hello".tr,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white, fontSize: 32),
          ),
          Text(
            "welcome".tr,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white, fontSize: 32),
          ),
        ],
      ),
    );
  }
}