import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/models/TaskModel.dart';
import 'package:todo/screens/edit_tasks/edit_tasks_items/edit_show_tasks.dart';
import 'package:todo/screens/edit_tasks/edit_tasks_items/edit_tasks_head.dart';
import 'package:todo/styles/icons_broken.dart';

class EditTasksScreen extends StatelessWidget {
  const EditTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit,TodoStates>(
      listener: (context,state){},
      builder: (context,state){
        TodoCubit cubit = TodoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: const Icon(IconBroken.Arrow___Left_2)
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EditTasksHead(),
              EditShowTasks(cubit: cubit),
            ],
          )
        );
      },
    );
  }
}
