import 'package:flutter/material.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/shared/constants.dart';


class ScheduleTaskText extends StatelessWidget {
  final TodoCubit cubit;
  final String text;
  final int index;
  const ScheduleTaskText({Key? key, required this.text, required this.index, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){cubit.setScheduledTask(index);},
        child: Container(
          color: Colors.white,
          child: Center(
            child: RotatedBox(
              quarterTurns: -1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(text,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14,
                    color: cubit.scheduleTaskIndex==index?pink:Colors.grey.withOpacity(0.7),
                    letterSpacing: 1,
                  ),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TasksSchedules extends StatelessWidget {
  final TodoCubit cubit;
  const TasksSchedules({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScheduleTaskText(
          cubit: cubit,
            text: "TODAY",
            index: 0,
        ),
        const SizedBox(height: 10,),
        ScheduleTaskText(
            cubit: cubit,
            text: "TOMORROW",
            index: 1,
        ),
        const SizedBox(height: 10,),
        ScheduleTaskText(
            cubit: cubit,
            text: "THIS MONTH",
            index: 2,
        ),
      ],
    );
  }
}