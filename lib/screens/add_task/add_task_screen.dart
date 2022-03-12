import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/screens/add_task/add_task_items/add_task_head.dart';
import 'package:todo/screens/add_task/add_task_items/when_task.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/default_widgets.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit,TodoStates>(
      listener: (context,state){},
      builder: (context,state){
        TodoCubit cubit = TodoCubit.get(context);
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          AddTaskHead(taskController: _taskController),
                          const SizedBox(height: 20,),
                          const WhenTask(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              DefaultElevatedButton(
                  child:Text(
                    "Add Task",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 21,
                        color: Colors.white
                    ),),
                  color: pink,
                  rounded: 0,
                  height: 70,
                  width: double.infinity,
                  onPressed: (){}
              )
            ],
          ),
        );
      },
    );
  }
}
