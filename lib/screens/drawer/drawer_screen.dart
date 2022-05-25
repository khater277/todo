import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/screens/calendar/calendar_screen.dart';
import 'package:todo/screens/dashboard/dashboard_screen.dart';
import 'package:todo/screens/edit_tasks/edit_tasks_screen.dart';
import 'package:todo/screens/settings/settings_screen.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';

// ignore: must_be_immutable
class DrawerItem extends StatelessWidget {
  final String text;
  bool? isSub;
  IconData? icon;

  DrawerItem({Key? key, required this.text, this.isSub ,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isSub!=true?2.8.h:1.7.h),
      child: SizedBox(
        width: MediaQuery.of(context)
            .size.width-(MediaQuery.of(context).size.width * languageFun(
            ar: 0.1, en: 0.45)),
        child: Row(
          children: [
            if(icon!=null)
            Row(
              children: [
                Icon(icon!,
                size: 18.sp,
                color: Colors.white,),
                SizedBox(width: 1.5.w,),
              ],
            ),
            Flexible(
              child: Text(text,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: isSub!=true?16.sp:11.5.sp,
                    color: Colors.white,
                    letterSpacing: 0.5
                ),),
            ),
          ],
        ),
      ),
    );
  }
}


class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: EdgeInsets.only(top: 17.h,left: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'agenda'.tr,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: Colors.white,
                fontSize: 25.sp,
                letterSpacing: 2
              ),
            ),
            SizedBox(height: 4.h,),
            GestureDetector(
                onTap: (){Get.to(()=>const DashboardScreen());},
                child: DrawerItem(text: "dashboard".tr,icon: IconBroken.Category,)
            ),
            GestureDetector(
              onTap: (){Get.to(()=>const CalendarScreen());},
                child: DrawerItem(text: "calendar".tr,icon: IconBroken.Calendar,)
            ),
            GestureDetector(
                onTap: (){Get.to(()=>const EditTasksScreen());},
                child: DrawerItem(text: "editTasks".tr,icon: IconBroken.Edit_Square,)
            ),
            GestureDetector(
                onTap: (){Get.to(()=>const SettingsScreen());},
                child: DrawerItem(text: "settings".tr,icon: IconBroken.Setting,)
            ),
            SizedBox(height: 4.h,),
            DrawerItem(text: "about".tr,isSub: true,),
            DrawerItem(text: "privacy".tr,isSub: true,),
            DrawerItem(text: "contactUs".tr,isSub: true,),
          ],
        ),
      ),
    );
  }
}
