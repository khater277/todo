import 'package:flutter/material.dart';
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
          color: Colors.white,
          child: Center(
            child: RotatedBox(
              quarterTurns: -1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(text,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14,
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
          text: "COMPLETED TASKS",
          index: 0,
        ),
        const SizedBox(height: 10,),
        SidebarText(
          cubit: cubit,
          text: "PENDING",
          index: 1,
        ),
        const SizedBox(height: 10,),
        SidebarText(
          cubit: cubit,
          text: "ALL TASKS",
          index: 2,
        ),
      ],
    );
  }
}