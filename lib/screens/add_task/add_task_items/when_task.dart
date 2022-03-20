import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/date_format.dart';
import 'package:todo/shared/default_widgets.dart';


class WhenTask extends StatelessWidget {
  final TodoCubit cubit;
  const WhenTask({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            left: languageFun(ar: 0.0, en: 20.0),
          right: languageFun(ar: 20.0, en: 0.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text("when".tr,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: languageFun(ar: 20.0, en: 16.0),
                    letterSpacing: 1,
                  ),),
              ),
            ),
            const SizedBox(height: 8,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.08),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(languageFun(ar: 0.0, en: 10.0)),
                  bottomLeft: Radius.circular(languageFun(ar: 0.0, en: 10.0)),
                  topRight: Radius.circular(languageFun(ar: 10.0, en: 0.0)),
                  bottomRight: Radius.circular(languageFun(ar: 10.0, en: 0.0)),
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){cubit.setWhenColor(context,0);},
                    child: Container(
                      color: Colors.grey.withOpacity(0.0),
                      child: Center(
                        child: TaskDate(
                          text: "today".tr,color: cubit.currentIndex==0?
                        pink:Colors.grey.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){cubit.setWhenColor(context,1);},
                    child: Container(
                      color: Colors.grey.withOpacity(0.0),
                      child: Center(
                        child: TaskDate(
                          text: "tomorrow".tr,color: cubit.currentIndex==1?
                        pink:Colors.grey.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){cubit.setWhenColor(context,2);},
                    child: Container(
                      color: Colors.grey.withOpacity(0.0),
                      child: Center(
                        child: TaskDate(
                          text: "selectDate".tr,color: cubit.currentIndex==2?
                        pink:Colors.grey.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ],
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: languageFun(ar: 22.0, en: 25.0)),
      child: Text(text,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 17,
          color: color,
          letterSpacing: 1,
        ),),
    );
  }
}

class TimeButton extends StatelessWidget {
  final TodoCubit cubit;
  const TimeButton({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: languageFun(ar: 20.0, en: 5.0),
          left: languageFun(ar: 5.0, en: 20.0)
      ),
      child: DefaultElevatedButton(
          child: Text(
            "time".tr,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: !isDarkMode!?Colors.white:Colors.black87,
                fontSize: 16
            ),
          ),
          color: !isDarkMode!?Colors.black87:Colors.white,
          rounded: 20,
          height: 40,
          width: 120,
          onPressed: (){
            FocusScope.of(context).unfocus();
            timePicker(context, cubit);
          }
      ),
    );
  }
}
