import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/screens/add_task/add_task_items/add_task_head.dart';
import 'package:todo/screens/add_task/add_task_items/when_task.dart';
import 'package:todo/shared/default_widgets.dart';
import 'package:todo/styles/icons_broken.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final TextEditingController _taskController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          appBar: AppBar(
            leading: IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: const Icon(IconBroken.Arrow___Left_2)
            ),
          ),
          body: Form(
            key: _formKey,
            child: Column(
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
                            WhenTask(cubit: cubit,),
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
                    color: Colors.black87,
                    rounded: 0,
                    height: 70,
                    width: double.infinity,
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        if(cubit.taskDateTime==null) {
                          Get.snackbar("warning", "please set time first");
                        }
                      }
                    }
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
