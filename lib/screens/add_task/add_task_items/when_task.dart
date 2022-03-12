import 'package:flutter/material.dart';
import 'package:todo/shared/constants.dart';

class WhenTask extends StatelessWidget {
  const WhenTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text("When",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16,
                    letterSpacing: 1,
                  ),),
              ),
            ),
            const SizedBox(height: 8,),
            Container(
              width: double.infinity,
              color: Colors.grey.withOpacity(0.08),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const TaskTime(text: "Today",color: pink,),
                    TaskTime(text: "Tomorrow",color: Colors.grey.withOpacity(0.8),),
                    TaskTime(text: "Select Date",color: Colors.grey.withOpacity(0.8),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TaskTime extends StatelessWidget {
  final String text;
  final Color color;
  const TaskTime({Key? key, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: 17,
        color: color,
        letterSpacing: 1,
      ),);
  }
}
