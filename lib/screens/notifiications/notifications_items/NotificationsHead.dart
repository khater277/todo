import 'package:flutter/material.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';


class NotificationsHead extends StatelessWidget {
  const NotificationsHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60,left: 20,right: 10,bottom: 50),
      child: Row(
        children: [
          Text("Notifications",
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 32),
          ),
          const Spacer(),
          const Icon(IconBroken.Notification, size: 22,)
        ],
      ),
    );
  }
}
