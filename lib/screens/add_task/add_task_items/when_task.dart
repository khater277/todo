import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
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
            left: languageFun(ar: 0.0, en: 5.55.w),
          right: languageFun(ar: 5.55.w, en: 0.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.39.w),
                child: Text("when".tr,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: languageFun(ar: 16.66.sp, en: 13.33.sp),
                    letterSpacing: 1,
                  ),),
              ),
            ),
            SizedBox(height: 1.117.h,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.08),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(languageFun(ar: 0.0, en: 10.0.sp)),
                  bottomLeft: Radius.circular(languageFun(ar: 0.0, en: 10.0.sp)),
                  topRight: Radius.circular(languageFun(ar: 10.0.sp, en: 0.0)),
                  bottomRight: Radius.circular(languageFun(ar: 10.0.sp, en: 0.0)),
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
            SizedBox(height: 1.4.h,),
            Row(
              children: [
                Expanded(
                    child: cubit.taskDateTime!=null?
                    Text(
                      DateFormatter()
                          .dateFormat(cubit.taskDateTime!.toString())!['date']!,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 13.33.sp,
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
      padding: EdgeInsets.symmetric(vertical: languageFun(ar: 3.07.h, en: 3.5.h)),
      child: Text(text,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 14.16.sp,
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
          right: languageFun(ar: 5.55.w, en: 1.38.w),
          left: languageFun(ar: 1.38.w, en: 5.55.w)
      ),
      child: DefaultElevatedButton(
          child: Text(
            "time".tr,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: !isDarkMode!?Colors.white:Colors.black87,
                fontSize: 13.33.sp
            ),
          ),
          color: !isDarkMode!?Colors.black87:Colors.white,
          rounded: 20.sp,
          height: 5.59.h,
          width: 33.33.w,
          onPressed: (){
            FocusScope.of(context).unfocus();
            timePicker(context, cubit);
          }
      ),
    );
  }
}
