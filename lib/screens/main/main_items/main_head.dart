import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/screens/notifiications/notifications_screen.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';

class HomeHead extends StatelessWidget {
  final TodoCubit cubit;
  const HomeHead({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: languageFun(ar: 2.w, en: 6.w),
        right: languageFun(ar: 6.w, en: 2.w)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                Text("tasks".tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 37.sp),

                ),
                const Spacer(),
                IconButton(
                    onPressed: (){
                      Get.to(()=>const NotificationsScreen());
                      // NotificationsHelper.showNotification();
                      //NotificationsHelper.zonedScheduleNotification();
                    },
                    icon: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Icon(
                          IconBroken.Notification,
                          size: 20.sp,
                        ),
                        if(cubit.notificationTasks.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0.8.w),
                            child: CircleAvatar(
                              radius: 3.5.sp,
                              backgroundColor: pink,
                            ),
                          )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
