import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';


class SettingsHead extends StatelessWidget {
  const SettingsHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 8.4.h,
          left: languageFun(ar: 4.16.w, en: 5.55.w),
          right: languageFun(ar: 5.55.w, en: 2.77.w),
          bottom: 7.h
      ),
      child: Row(
        children: [
          Text("settings".tr,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 29.16.sp),

          ),
          const Spacer(),
          const Icon(IconBroken.Setting, size: 18.33,)
        ],
      ),
    );
  }
}
