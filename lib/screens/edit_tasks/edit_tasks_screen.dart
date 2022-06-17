import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/screens/edit_tasks/edit_tasks_items/edit_show_tasks.dart';
import 'package:todo/screens/edit_tasks/edit_tasks_items/edit_tasks_head.dart';
import 'package:todo/shared/default_widgets.dart';

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
            leading: const DefaultBackButton()
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
