import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';


class EditTasksHead extends StatelessWidget {
  const EditTasksHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 60,
          left: languageFun(ar: 10.0, en: 20.0),
          right: languageFun(ar: 20.0, en: 10.0),
          bottom: 50
      ),
      child: Row(
        children: [
          Text("editTasks".tr,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 35),

          ),
          const Spacer(),
          IconButton(
              onPressed: ()async{
                tasksBox!.deleteAll(tasksBox!.keys);
                TodoCubit.get(context).getAllTasks();
                await FlutterLocalNotificationsPlugin().cancelAll();
              },
              icon: const Icon(IconBroken.Delete,
              color: Colors.red,size: 22,)
          )
        ],
      ),
    );
  }
}
