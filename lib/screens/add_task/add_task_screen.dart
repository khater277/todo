import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/screens/add_task/add_task_items/add_task_head.dart';
import 'package:todo/screens/add_task/add_task_items/when_task.dart';
import 'package:todo/shared/constants.dart';
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
                  cubit.clearTaskTime();
                },
                icon: Icon(
                  languageFun(ar: IconBroken.Arrow___Right_2, en: IconBroken.Arrow___Left_2)
                )
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
                            SizedBox(height: 2.8.h,),
                            WhenTask(cubit: cubit,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                DefaultElevatedButton(
                    child:Text(
                      "addTask".tr,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 17.5.sp,
                          color: !isDarkMode!?Colors.white:Colors.black87
                      ),),
                    color: !isDarkMode!?Colors.black87:Colors.white,
                    rounded: 0,
                    height: 9.77.h,
                    width: double.infinity,
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        if(cubit.taskDateTime==null) {
                          showSnackBar(
                              title: "warning".tr,
                              content: "timeError".tr,
                              context: context,
                              color: Colors.black87,
                              fontColor: Colors.white,
                              icon: IconBroken.Danger
                          );
                        }else{
                          FocusScope.of(context).unfocus();
                          showSnackBar(
                              title: "done".tr,
                              content: "taskAdded".tr,
                              context: context,
                              color: Colors.black87,
                              fontColor: Colors.white,
                              icon: IconBroken.Upload
                          );
                          cubit.addNewTask(
                            context: context,
                              name: _taskController.text,
                              dateTime: cubit.taskDateTime
                          );
                          _taskController.clear();
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
