import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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
              cubit.getNotificationTasks();
              return Scaffold(
                appBar: AppBar(
                  toolbarHeight: 110,
                  elevation: 0,
                  leading: Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: GestureDetector(
                      onTap: () {
                        zoomDrawerController.toggle!();
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ImageIcon(
                          AssetImage("assets/images/menu.png"),
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  leadingWidth: 100,
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
                  backgroundColor: Colors.black87,
                  elevation: 0,
                  child: const Icon(
                    Icons.add,
                  ),
                  shape: const RoundedRectangleBorder(),
                ),
              );
            }
          );
        },
      ),
    );
  }
}