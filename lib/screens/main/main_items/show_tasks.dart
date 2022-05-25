import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/models/TaskModel.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/date_format.dart';
import 'package:todo/shared/default_widgets.dart';
import 'package:todo/styles/icons_broken.dart';

class TaskText extends StatelessWidget {
  final String text;
  final String dateTime;
  final bool isCompleted;

  const TaskText(
      {Key? key,
      required this.text,
      required this.isCompleted,
      required this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dateTime,
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey,
              letterSpacing: 0.5,
              fontFamily: "Avenir-Medium",
              decoration:
                  isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              decorationColor: pink,
            )),
        SizedBox(
          height: 0.4.h,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              decoration:
              isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              decorationColor: pink,
              decorationThickness: 2,
              fontSize: 16.5.sp,
              letterSpacing: 0.5),
        ),
      ],
    );
  }
}

class TaskInfo extends StatelessWidget {
  final TodoCubit cubit;
  final int index;
  final TaskModel task;

  const TaskInfo(
      {Key? key, required this.cubit, required this.index, required this.task})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (index == 0)
          SizedBox(height: 1.5.h,),
        TaskText(
            text: "${task.name}",
            dateTime: cubit.scheduleTaskIndex != 2
                ? DateFormatter().time(task.dateTime!.toString())
                : DateFormatter()
                    .dateFormat(task.dateTime!.toString())!['date']!,
            isCompleted: task.isCompleted!),
        if (index == tasksBox!.length - 1)
          SizedBox(height: 8.5.h,)
      ],
    );
  }
}

class ShowTasks extends StatelessWidget {
  final TodoCubit cubit;

  const ShowTasks({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.08),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(languageFun(ar: 0.0, en: 10.sp)),
              topRight: Radius.circular(languageFun(ar: 10.sp, en: 0.0))
            )
        ),
        child: Padding(
            padding: EdgeInsets.only(
                right: languageFun(ar: 4.2.w, en: 3.5.w),
                left: languageFun(ar: 3.5.w, en: 4.2.w),
                bottom: 1.4.h,
                top: 1.4.h
            ),
            child: cubit.allTasks[cubit.scheduleTaskIndex].isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      TaskModel task =
                          cubit.allTasks[cubit.scheduleTaskIndex][index];
                      return TaskInfo(cubit: cubit, index: index, task: task);
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 4.2.h,
                        ),
                    itemCount: cubit.allTasks[cubit.scheduleTaskIndex].length)
                : NoItemsFounded(
                    text: "empty".tr,
                    widget: Icon(
                      IconBroken.Document,
                      size: 50.sp,
                      color: Colors.grey[500],
                    ),
                  )),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  final TodoCubit cubit;
  final int index;
  final TaskModel task;

  const DeleteButton(
      {Key? key, required this.index, required this.cubit, required this.task})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (index == 0)
          SizedBox(height: 1.4.h,),
        GestureDetector(
            onTap: () {
              cubit.deleteTask(index: index, task: task);
              //tasks.deleteAt(index);
            },
            child: Icon(
              IconBroken.Delete,
              size: 16.sp,
              color: Colors.red,
            )),
        if (index == tasksBox!.length - 1)
           SizedBox(height: 8.4.h,)
      ],
    );
  }
}
