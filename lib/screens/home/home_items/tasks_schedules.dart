import 'package:flutter/material.dart';
import 'package:todo/shared/constants.dart';

class ScheduleText extends StatelessWidget {
  final String text;
  final Color color;
  const ScheduleText({Key? key, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: const AlwaysStoppedAnimation(-90 / 360),
        child: Text(text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 14,
              color: color,
            //letterSpacing: 1
          ),)
    );
  }
}


class TasksSchedules extends StatelessWidget {
  const TasksSchedules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const ScheduleText(text: "TODAY", color: pink),
        ScheduleText(text: "TOMORROW", color: Colors.grey.withOpacity(0.7)),
        ScheduleText(text: "THIS WEEK", color: Colors.grey.withOpacity(0.7)),
      ],
    );
  }
}
