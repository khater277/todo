import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/models/TaskModel.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/date_format.dart';
import 'package:todo/shared/default_widgets.dart';
import 'package:todo/styles/icons_broken.dart';

class DashboardTaskText extends StatelessWidget {
  final TaskModel task;

  const DashboardTaskText({Key? key, required this.task,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoCubit cubit = TodoCubit.get(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormatter()
                  .dateFormat(task.dateTime!.toString())!['date']!,
                  style: TextStyle(
                    fontSize: 9.16.sp,
                    color: Colors.grey,
                    letterSpacing: 0.5,
                    fontFamily: "Avenir-Medium",
                    decoration:
                        task.isCompleted! ? TextDecoration.lineThrough : TextDecoration.none,
                    decorationColor: pink,
                  )),
              SizedBox(
                height: 0.28.h,
              ),
              Text(
                task.name!,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    decoration:
                    task.isCompleted! ? TextDecoration.lineThrough : TextDecoration.none,
                    decorationColor: pink,
                    decorationThickness: 2,
                    fontSize: 16.66.sp,
                    letterSpacing: 0.5),
              ),
            ],
          ),
        ),
        if(cubit.dashboardTaskIndex==0&&task.isCompleted==true)
          GestureDetector(
              onTap: (){
                cubit.removeFromCompleted(index: cubit.tasks.indexOf(task), task: task);
              },
              child: Icon(IconBroken.Shield_Done,size: 16.66.sp,color: Colors.green,))
        else if(cubit.dashboardTaskIndex==1&&task.isPending==true)
          GestureDetector(
              onTap: (){
                cubit.removeFromPend(index: cubit.tasks.indexOf(task), task: task);
              },
              child: Icon(IconBroken.Bookmark,
                size: 16.66.sp,color: pink,))
        else
            Row(
              children: [
                if(task.isPending==true)
                Row(
                  children: [
                    SizedBox(width: 4.16.w,),
                    GestureDetector(
                        onTap: (){
                          cubit.removeFromPend(index: cubit.tasks.indexOf(task), task: task);
                        },
                        child: Icon(IconBroken.Bookmark,size: 16.66.sp,color: pink,)),
                    //SizedBox(width: 8,)
                  ],
                ),
                if(task.isCompleted==true)
                Row(
                  children: [
                    SizedBox(width: 4.16.w,),
                    GestureDetector(
                        onTap: (){
                          cubit.removeFromCompleted(index: cubit.tasks.indexOf(task), task: task);
                        },
                        child: Icon(IconBroken.Shield_Done,
                          size: 16.66.sp,color: Colors.green,)),
                    //SizedBox(width: 8,)
                  ],
                ),
              ],
            ),

      ],
    );
  }
}

class DashboardTaskInfo extends StatelessWidget {
  final TodoCubit cubit;
  final int index;
  final TaskModel task;

  const DashboardTaskInfo(
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
        DashboardTaskText(task: task,),
        if (index == tasksBox!.length - 1)
          SizedBox(
            height: 8.4.h,
          )
      ],
    );
  }
}

class DashboardShowTasks extends StatelessWidget {
  final TodoCubit cubit;

  const DashboardShowTasks({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.08),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(languageFun(ar: 0.0, en: 10.0.sp)),
                  topRight: Radius.circular(languageFun(ar: 10.0.sp, en: 0.0))
              )
          ),
        child: Padding(
            padding: EdgeInsets.only(
                right: languageFun(ar: 4.16.w, en: 2.77.w),
                left: languageFun(ar: 2.77.w, en: 4.16.w),
                bottom: 1.4.h,
                top: 1.4.h
            ),
            child: cubit.dashboardTasks[cubit.dashboardTaskIndex].isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      TaskModel task =
                          cubit.dashboardTasks[cubit.dashboardTaskIndex][index];
                      return DashboardTaskInfo(cubit: cubit, index: index, task: task);
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 4.19.h,
                        ),
                    itemCount: cubit.dashboardTasks[cubit.dashboardTaskIndex].length)
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
