import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/models/TaskModel.dart';
import 'package:todo/screens/edit_tasks/edit_tasks_items/popup_menu.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/date_format.dart';
import 'package:todo/shared/default_widgets.dart';
import 'package:todo/styles/icons_broken.dart';


class EditShowTasks extends StatelessWidget {
  final TodoCubit cubit;
  const EditShowTasks({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // List<TaskModel> tasks = cubit.tasks;
    // tasks.sort((a,b) => a.dateTime!.compareTo(b.dateTime!));


    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          right: languageFun(ar: 5.55.w, en: 0.0),
          left: languageFun(ar: 0.0, en: 5.55.w),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.08),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(languageFun(ar: 0.0, en: 10.0.sp)),
                topRight: Radius.circular(languageFun(ar: 10.0.sp, en: 0.0))
            )
          ),
          child: Padding(
            padding: EdgeInsets.only(
                right: languageFun(ar: 5.55.w, en: 2.77.w),
                left: languageFun(ar: 2.77.w, en: 5.55.w),
            ),
            child: cubit.sortedTasks.isNotEmpty?
            ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder:(context,index){
                  TaskModel task = cubit.sortedTasks[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.1.h),
                    child: EditTaskInfo(
                        cubit: cubit,
                        order: index,
                        index: cubit.tasks.indexOf(task),
                        task: task),
                  );
                },
                itemCount: cubit.sortedTasks.length
            )
            :NoItemsFounded(
              text: "empty".tr,
              widget: Icon(
                IconBroken.Document,
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

class EditTaskText extends StatelessWidget {
  final TodoCubit cubit;
  final TaskModel task;
  final int index;


  const EditTaskText(
      {Key? key,
        required this.cubit,
        required this.task,
        required this.index,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              SizedBox(width: 1.4.w,),
              SizedBox(height: 0.28.h,),
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
        if(task.isPending!)
          Row(
            children: [
              SizedBox(width: 4.16.w,),
              GestureDetector(
                onTap: (){
                  cubit.removeFromPend(index: index, task: task);
                },
                  child: Icon(IconBroken.Bookmark,size: 16.66.sp,color: pink,)),
              //SizedBox(width: 8,)
            ],
          ),
        if(task.isCompleted!)
          Row(
            children: [
              SizedBox(width: 4.16.w,),
              GestureDetector(
                  onTap: (){
                    cubit.removeFromCompleted(index: index, task: task);
                  },
                  child: Icon(IconBroken.Shield_Done,
                    size: 16.66.sp,color: Colors.green,)),
              //SizedBox(width: 8,)
            ],
          ),
        PopupMenu(cubit: cubit,index: index,task: task,)
      ],
    );
  }
}

class EditTaskInfo extends StatelessWidget {
  final TodoCubit cubit;
  final int index;
  final int order;
  final TaskModel task;

  const EditTaskInfo(
      {Key? key, required this.cubit, required this.index, required this.task, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (order == 0)
          SizedBox(height: 1.4.h,),
        EditTaskText(
            cubit: cubit,
          task: task,
          index: index,
        ),
        if (order == tasksBox!.length - 1)
          SizedBox(height: 8.38.h,)
      ],
    );
  }
}


