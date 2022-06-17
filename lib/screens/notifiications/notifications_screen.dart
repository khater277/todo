import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/screens/home/home_screen.dart';
import 'package:todo/screens/notifiications/notifications_items/NotificationsHead.dart';
import 'package:todo/screens/notifiications/notifications_items/notifications_show_tasks.dart';
import 'package:todo/styles/icons_broken.dart';

import '../../shared/constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit,TodoStates>(
      listener: (context,state){},
      builder: (context,state){
        TodoCubit cubit = TodoCubit.get(context);
        return WillPopScope(
          onWillPop: ()async {
            Get.offAll(()=>const HomeScreen());
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){Get.offAll(()=>const HomeScreen());},
                icon: Icon(
                    languageFun(ar: IconBroken.Arrow___Right_2, en: IconBroken.Arrow___Left_2)
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NotificationsHead(),
                NotificationsShowTasks(cubit: cubit),
              ],
            ),
          ),
        );
      },
    );
  }
}
