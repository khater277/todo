import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/styles/icons_broken.dart';


class NotificationsHead extends StatelessWidget {
  const NotificationsHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.38.h,left: 5.55.w,right: 2.77.w,bottom: 7.h),
      child: Row(
        children: [
          Text("notifications".tr,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 26.66.sp),
          ),
          const Spacer(),
          Icon(IconBroken.Notification, size: 18.33.sp,)
        ],
      ),
    );
  }
}
