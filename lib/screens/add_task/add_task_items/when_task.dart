import 'package:flutter/material.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/date_format.dart';
import 'package:todo/shared/default_widgets.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';


class WhenTask extends StatelessWidget {
  final TodoCubit cubit;
  const WhenTask({Key? key, required this.cubit}) : super(key: key);

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
                    GestureDetector(
                      onTap: (){cubit.setWhenColor(context,0);},
                        child: TaskDate(
                          text: "Today",color: cubit.currentIndex==0?
                        pink:Colors.grey.withOpacity(0.8),
                        )
                    ),
                    GestureDetector(
                      onTap: (){cubit.setWhenColor(context,1);},
                        child: TaskDate(
                          text: "Tomorrow",color: cubit.currentIndex==1?
                        pink:Colors.grey.withOpacity(0.8),
                        )
                    ),
                    GestureDetector(
                      onTap: (){cubit.setWhenColor(context,2);},
                        child: TaskDate(
                          text: "Select Date",color: cubit.currentIndex==2?
                          pink:Colors.grey.withOpacity(0.8),
                        )
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                    child: cubit.taskDateTime!=null?
                    Text(
                      DateFormatter()
                          .dateFormat(cubit.taskDateTime!.toString())!['date']!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        letterSpacing: 1,
                        color: pink
                      ),
                    ):const Text(""),
                ),
                TimeButton(cubit: cubit),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TaskDate extends StatelessWidget {
  final String text;
  final Color color;
  const TaskDate({Key? key, required this.text, required this.color}) : super(key: key);

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

class TimeButton extends StatelessWidget {
  final TodoCubit cubit;
  const TimeButton({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5,left: 20),
      child: DefaultElevatedButton(
          child: Text(
            "Time",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: Colors.white,
                fontSize: 16
            ),
          ),
          color: Colors.black87,
          rounded: 20,
          height: 40,
          width: 120,
          onPressed: (){
            FocusScope.of(context).unfocus();
            Navigator.of(context).push(
              showPicker(
                context: context,
                accentColor: Colors.black87,
                unselectedColor: Colors.black26,
                value: TimeOfDay.now(),
                onChange: (value){},
                //iosStylePicker: true,
                minuteInterval: MinuteInterval.FIVE,
                // Optional onChange to receive value as DateTime
                onChangeDateTime: (DateTime dateTime) {
                  //print(dateTime);
                  cubit.setTaskTime(dateTime);
                },
                okStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                cancelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            );
          }
      ),
    );
  }
}
