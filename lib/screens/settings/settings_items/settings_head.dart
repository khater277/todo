import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';


class SettingsHead extends StatelessWidget {
  const SettingsHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 60,
          left: languageFun(ar: 15.0, en: 20.0),
          right: languageFun(ar: 20.0, en: 10.0),
          bottom: 50
      ),
      child: Row(
        children: [
          Text("settings".tr,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 35),

          ),
          const Spacer(),
          const Icon(IconBroken.Setting, size: 22,)
        ],
      ),
    );
  }
}
