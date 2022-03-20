import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              fontSize: 11,
              color: Colors.grey,
              letterSpacing: 0.5,
              fontFamily: "Avenir-Medium",
              decoration:
                  isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              decorationColor: pink,
            )),
        const SizedBox(
          height: 2,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              decoration:
              isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              decorationColor: pink,
              decorationThickness: 2,
              fontSize: 20,
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
          const SizedBox(
            height: 10,
          ),
        TaskText(
            text: "${task.name}",
            dateTime: cubit.scheduleTaskIndex != 2
                ? DateFormatter().time(task.dateTime!.toString())
                : DateFormatter()
                    .dateFormat(task.dateTime!.toString())!['date']!,
            isCompleted: task.isCompleted!),
        if (index == tasksBox!.length - 1)
          const SizedBox(
            height: 60,
          )
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
              topLeft: Radius.circular(languageFun(ar: 0.0, en: 10.0)),
              topRight: Radius.circular(languageFun(ar: 10.0, en: 0.0))
            )
        ),
        child: Padding(
            padding: EdgeInsets.only(
                right: languageFun(ar: 15.0, en: 10.0),
                left: languageFun(ar: 10.0, en: 15.0),
                bottom: 10,
                top: 10
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
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 30,
                        ),
                    itemCount: cubit.allTasks[cubit.scheduleTaskIndex].length)
                : NoItemsFounded(
                    text: "empty".tr,
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
          const SizedBox(
            height: 10,
          ),
        GestureDetector(
            onTap: () {
              cubit.deleteTask(index: index, task: task);
              //tasks.deleteAt(index);
            },
            child: const Icon(
              IconBroken.Delete,
              size: 20,
              color: Colors.red,
            )),
        if (index == tasksBox!.length - 1)
          const SizedBox(
            height: 60,
          )
      ],
    );
  }
}
