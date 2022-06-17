import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/shared/constants.dart';


class SidebarText extends StatelessWidget {
  final TodoCubit cubit;
  final String text;
  final int index;
  const SidebarText({Key? key, required this.text, required this.index, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){cubit.setDashboardTask(index);},
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Center(
            child: RotatedBox(
              quarterTurns: -1,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: languageFun(
                    ar: 2.8.h, en: 3.5.h)),
                child: Text(text,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: languageFun(ar: 14.16.sp, en: 11.66.sp),
                    color: cubit.dashboardTaskIndex==index?pink:Colors.grey.withOpacity(0.7),
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

class DashboardSidebar extends StatelessWidget {
  final TodoCubit cubit;
  const DashboardSidebar({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SidebarText(
          cubit: cubit,
          text: "completedTasks".tr.toUpperCase(),
          index: 0,
        ),
        SizedBox(height: 1.4.h,),
        SidebarText(
          cubit: cubit,
          text: "pending".tr.toUpperCase(),
          index: 1,
        ),
        SizedBox(height: 1.4.h,),
        SidebarText(
          cubit: cubit,
          text: "allTasks".tr.toUpperCase(),
          index: 2,
        ),
      ],
    );
  }
}