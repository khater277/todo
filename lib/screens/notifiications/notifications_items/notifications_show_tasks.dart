import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.08),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              )),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: cubit.notificationTasks.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      TaskModel task = cubit.notificationTasks[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: NotificationsTaskInfo(
                            cubit: cubit, index: index, task: task),
                      );
                    },
                    itemCount: cubit.notificationTasks.length)
                : NoItemsFounded(
                    text: "there is no notifications yet",
                    widget: Icon(
                      IconBroken.Notification,
                      size: 60,
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
        ? DateFormatter().time(task.dateTime!.toString())
        : DateFormatter()
        .dateFormat(task.dateTime!.toString())!['date']!;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Today at $date",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    letterSpacing: 0.5,
                    fontFamily: "Avenir-Medium",
                    decoration: task.isCompleted!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: pink,
                  )),
              const SizedBox(
                width: 5,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                task.name!,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    decoration: task.isCompleted!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: pink,
                    decorationThickness: 2,
                    fontSize: 20,
                    letterSpacing: 0.5),
              ),
            ],
          ),
        ),
        if (task.isPending!)
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                  onTap: () {
                    cubit.removeFromPend(index: index, task: task);
                  },
                  child: const Icon(
                    IconBroken.Bookmark,
                    size: 20,
                    color: pink,
                  )),
              //SizedBox(width: 8,)
            ],
          ),
        if (task.isCompleted!)
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                  onTap: () {
                    cubit.removeFromCompleted(index: index, task: task);
                  },
                  child: const Icon(
                    IconBroken.Shield_Done,
                    size: 20,
                    color: Colors.green,
                  )),
              //SizedBox(width: 8,)
            ],
          ),
        IconButton(
            onPressed: (){
              cubit.removeFromNotifications(index: index, task: task);
            },
            icon: const Icon(IconBroken.Delete,size: 20,color: Colors.red,))
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
          const SizedBox(
            height: 10,
          ),
        NotificationsTaskText(
          cubit: cubit,
          task: task,
          index: index,
        ),
        if (index == tasksBox!.length - 1)
          const SizedBox(
            height: 60,
          )
      ],
    );
  }
}
