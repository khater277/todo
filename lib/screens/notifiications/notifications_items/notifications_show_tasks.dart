import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/models/TaskModel.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/date_format.dart';
import 'package:todo/shared/default_widgets.dart';
import 'package:todo/styles/icons_broken.dart';

class NotificationsShowTasks extends StatelessWidget {
  final TodoCubit cubit;

  const NotificationsShowTasks({Key? key, required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.16.w),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.08),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.sp),
                topRight: Radius.circular(20.sp)
              )),
          child: Padding(
            padding: EdgeInsets.only(
                left: languageFun(ar: 0.0, en: 5.55.w),
                right: languageFun(ar: 5.55.w, en: 0.0),
                bottom: 2.8.h
            ),
            child: cubit.notificationTasks.isNotEmpty
                ?
            ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  TaskModel task = cubit.notificationTasks[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.1.h),
                    child: Column(
                      children: [
                        // Text("${cubit.notificationTasks.length}"),
                        NotificationsTaskInfo(
                            cubit: cubit, index: index, task: task),
                      ],
                    ),
                  );
                },
                itemCount: cubit.notificationTasks.length)
                :
            NoItemsFounded(
              text: "noNotifications".tr,
              widget: Icon(
                IconBroken.Notification,
                size: 50.sp,
                color: Colors.grey[500],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationsTaskText extends StatelessWidget {
  final TodoCubit cubit;
  final TaskModel task;
  final int index;

  const NotificationsTaskText(
      {Key? key, required this.cubit, required this.task, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    DateTime todayDate = DateTime(DateTime.now().year,DateTime.now().month,
        DateTime.now().day);

    DateTime taskDayDate = DateTime(task.dateTime!.year,task.dateTime!.month,
        task.dateTime!.day);

    String date = todayDate==taskDayDate
        ? "Today at ${DateFormatter().time(task.dateTime!.toString())}"
        : DateFormatter()
        .dateFormat(task.dateTime!.toString())!['date']!;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date,
                  style: TextStyle(
                    fontSize: 10.8.sp,
                    color: Colors.grey,
                    letterSpacing: 0.5,
                    fontFamily: "Avenir-Medium",
                    decoration: task.isCompleted!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: pink,
                  )),
              SizedBox(
                width: 1.39.w,
              ),
              SizedBox(
                height: 0.28.h,
              ),
              Text(
                task.name!,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    decoration: task.isCompleted!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: pink,
                    decorationThickness: 2,
                    fontSize: 16.66.sp,
                    letterSpacing: 0.5),
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: (){
              cubit.removeFromNotifications(index: index, task: task);
            },
            icon: Icon(IconBroken.Delete,size: 16.66.sp,color: Colors.red,))
      ],
    );
  }
}

class NotificationsTaskInfo extends StatelessWidget {
  final TodoCubit cubit;
  final int index;
  final TaskModel task;

  const NotificationsTaskInfo(
      {Key? key, required this.cubit, required this.index, required this.task})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (index == 0)
          SizedBox(
            height: 1.4.h,
          ),
        NotificationsTaskText(
          cubit: cubit,
          task: task,
          index: index,
        ),
        if (index == tasksBox!.length - 1)
          SizedBox(
            height: 8.38.h,
          )
      ],
    );
  }
}
