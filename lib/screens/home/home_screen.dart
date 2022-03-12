import 'package:flutter/material.dart';
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
        backgroundColor: pink,
        elevation: 0,
        onPressed: (){},
        child: const Icon(Icons.add,),
        shape:  const RoundedRectangleBorder(),
      ),
    );
  }
}
// ElevatedButton(
// onPressed:(){},
// child:const Icon(IconBroken.Edit,color: Colors.white,size: 25,),
// style: ElevatedButton.styleFrom(
// elevation: 0,
// primary:pink,
// shape: const RoundedRectangleBorder(
// borderRadius:BorderRadius.only(
// topLeft: Radius.circular(5)
// ),
// ),
// minimumSize: const Size(70,60)
// ),
// ),