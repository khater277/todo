import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/screens/add_task/add_task_screen.dart';
import 'package:todo/screens/main/main_items/main_head.dart';
import 'package:todo/screens/main/main_items/show_tasks.dart';
import 'package:todo/screens/main/main_items/tasks_schedules.dart';
import 'package:todo/shared/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        zoomDrawerController.close!();
      },
      child: BlocConsumer<TodoCubit,TodoStates>(
        listener: (context,state){},
        builder: (context,state){
          TodoCubit cubit = TodoCubit.get(context);
          return Builder(
            builder: (context) {
              //cubit.getNotificationTasks();
              return Scaffold(
                appBar: AppBar(
                  toolbarHeight: 15.5.h,
                  elevation: 0,
                  leading: Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: GestureDetector(
                      onTap: () {
                        zoomDrawerController.toggle!();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: RotatedBox(
                          quarterTurns: languageFun(ar: 2, en: 0),
                          child: ImageIcon(
                            const AssetImage("assets/images/menu.png",),
                            size: 40.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  leadingWidth: 20.w,
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      HomeHead(cubit: cubit,),
                      Expanded(
                        child: Row(
                          children: [
                            TasksSchedules(cubit: cubit,),
                            ShowTasks(cubit: cubit,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Get.to(() => const AddTaskScreen());
                  },
      //            backgroundColor: Colors.black87,
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              );
            }
          );
        },
      ),
    );
  }
}