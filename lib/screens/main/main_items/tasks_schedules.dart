import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Center(
            child: RotatedBox(
              quarterTurns: -1,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: languageFun(
                    ar: 20.0, en: 25.0)),
                child: Text(text,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: languageFun(ar: 17.0, en: 14.0),
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
            text: "today".tr.toUpperCase(),
            index: 0,
        ),
        const SizedBox(height: 10,),
        ScheduleTaskText(
            cubit: cubit,
            text: "tomorrow".tr.toUpperCase(),
            index: 1,
        ),
        const SizedBox(height: 10,),
        ScheduleTaskText(
            cubit: cubit,
            text: "thisMonth".tr.toUpperCase(),
            index: 2,
        ),
      ],
    );
  }
}