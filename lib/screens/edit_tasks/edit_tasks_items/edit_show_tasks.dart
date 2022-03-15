import 'package:flutter/material.dart';
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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.08),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
            )
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20,bottom: 10),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder:(context,index){
                  TaskModel task =
                  cubit.tasks[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: EditTaskInfo(cubit: cubit, index: index, task: task),
                  );
                },
                itemCount: cubit.tasks.length
            ),
          ),
        ),
      ),
    );
  }
}

class EditTaskText extends StatelessWidget {
  final String text;
  final String dateTime;
  final bool isCompleted;

  const EditTaskText(
      {Key? key,
        required this.text,
        required this.isCompleted,
        required this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
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
                    fontSize: 20,
                    color: Colors.black87,
                    letterSpacing: 0.5),
              ),
            ],
          ),
        ),
        const PopupMenu()
      ],
    );
  }
}

class EditTaskInfo extends StatelessWidget {
  final TodoCubit cubit;
  final int index;
  final TaskModel task;

  const EditTaskInfo(
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
        EditTaskText(
            text: "${task.name}",
            dateTime: DateFormatter()
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


