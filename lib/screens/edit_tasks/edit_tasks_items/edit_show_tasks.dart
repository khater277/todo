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
            child: cubit.tasks.isNotEmpty?
            ListView.builder(
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
            )
            :NoItemsFounded(
              text: "Empty",
              widget: Icon(
                IconBroken.Document,
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

class EditTaskText extends StatelessWidget {
  final TodoCubit cubit;
  final TaskModel task;
  final int index;


  const EditTaskText(
      {Key? key,
        required this.cubit,
        required this.task,
        required this.index})
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
                    fontSize: 11,
                    color: Colors.grey,
                    letterSpacing: 0.5,
                    fontFamily: "Avenir-Medium",
                    decoration:
                    task.isCompleted! ? TextDecoration.lineThrough : TextDecoration.none,
                    decorationColor: pink,
                  )),
              const SizedBox(width: 5,),
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
          ),
        ),
        if(task.isPending!)
          Row(
            children: [
              const SizedBox(width: 15,),
              GestureDetector(
                onTap: (){
                  cubit.removeFromPend(index: index, task: task);
                },
                  child: const Icon(IconBroken.Bookmark,size: 20,color: pink,)),
              //SizedBox(width: 8,)
            ],
          ),
        if(task.isCompleted!)
          Row(
            children: [
              const SizedBox(width: 15,),
              GestureDetector(
                  onTap: (){
                    cubit.removeFromCompleted(index: index, task: task);
                  },
                  child: const Icon(IconBroken.Shield_Done,
                    size: 20,color: Colors.green,)),
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


