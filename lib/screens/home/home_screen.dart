import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/add_task/add_task_screen.dart';
import 'package:todo/screens/home/home_items/home_head.dart';
import 'package:todo/screens/home/home_items/show_tasks.dart';
import 'package:todo/screens/home/home_items/tasks_schedules.dart';
import 'package:todo/shared/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            const HomeHead(),
            Expanded(
              child: Row(
                children: const [
                  TasksSchedules(),
                  ShowTasks(),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Get.to(()=>const AddTaskScreen());},
        backgroundColor: pink,
        elevation: 0,
        child: const Icon(Icons.add,),
        shape:  const RoundedRectangleBorder(),
      ),
    );
  }
}