import 'package:flutter/material.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(DateFormatter()
            .dateFormat(task.dateTime!.toString())!['date']!,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey,
              letterSpacing: 0.5,
              fontFamily: "Avenir-Medium",
              decoration:
                  task.isCompleted! ? TextDecoration.lineThrough : TextDecoration.none,
              decorationColor: pink,
            )),
        const SizedBox(
          height: 2,
        ),
        Text(
          task.name!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              decoration:
                  task.isCompleted! ? TextDecoration.lineThrough : TextDecoration.none,
              decorationColor: pink,
              fontSize: 20,
              color: Colors.black87,
              letterSpacing: 0.5),
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
          const SizedBox(
            height: 10,
          ),
        DashboardTaskText(task: task,),
        if (index == tasksBox!.length - 1)
          const SizedBox(
            height: 60,
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
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
              )
          ),
        child: Padding(
            padding: const EdgeInsets.only(right: 10,left: 15,bottom: 10,top: 10),
            child: cubit.dashboardTasks[cubit.dashboardTaskIndex].isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      TaskModel task =
                          cubit.dashboardTasks[cubit.dashboardTaskIndex][index];
                      return DashboardTaskInfo(cubit: cubit, index: index, task: task);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 30,
                        ),
                    itemCount: cubit.dashboardTasks[cubit.dashboardTaskIndex].length)
                : NoItemsFounded(
                    text: "Empty",
                    widget: Icon(
                      IconBroken.Document,
                      size: 60,
                      color: Colors.grey[500],
                    ),
                  )),
      ),
    );
  }
}
