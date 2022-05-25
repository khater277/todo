import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sizer/sizer.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "hello".tr,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white, fontSize: 27.sp),
          ),
          Text(
            "welcome".tr,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white, fontSize: 27.sp),
          ),
        ],
      ),
    );
  }
}