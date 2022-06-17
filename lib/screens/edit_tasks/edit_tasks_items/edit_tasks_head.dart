import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';


class EditTasksHead extends StatelessWidget {
  const EditTasksHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 8.28.h,
          left: languageFun(ar: 2.77.w, en: 5.55.w),
          right: languageFun(ar: 5.55.w, en: 2.77.w),
          bottom: 7.h
      ),
      child: Row(
        children: [
          Text("editTasks".tr,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 29.16.sp),

          ),
          const Spacer(),
          IconButton(
              onPressed: ()async{
                tasksBox!.deleteAll(tasksBox!.keys);
                TodoCubit.get(context).getAllTasks();
                // TodoCubit.get(context).getAllTasks();
                await FlutterLocalNotificationsPlugin().cancelAll();
              },
              icon: Icon(IconBroken.Delete,
              color: Colors.red,size: 18.33.sp,)
          )
        ],
      ),
    );
  }
}
