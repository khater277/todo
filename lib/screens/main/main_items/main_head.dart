import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/screens/notifiications/notifications_screen.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';

class HomeHead extends StatelessWidget {
  final TodoCubit cubit;
  const HomeHead({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                Text("tasks".tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 45),

                ),
                const Spacer(),
                IconButton(
                    onPressed: (){
                      Get.to(()=>const NotificationsScreen());
                      // NotificationsHelper.showNotification();
                      //NotificationsHelper.zonedScheduleNotification();
                    },
                    icon: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        const Icon(
                          IconBroken.Notification,
                          size: 25,
                        ),
                        if(cubit.notificationTasks.isNotEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: CircleAvatar(
                            radius: 4.5,
                            backgroundColor: pink,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
