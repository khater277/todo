import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/shared/constants.dart';

class DisableNotifications extends StatelessWidget {
  final TodoCubit cubit;
  const DisableNotifications({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("disableNotifications".tr,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 15.sp),
        ),
        const Spacer(),
        Switch(
            value: disableNotifications!,
            activeTrackColor: pink.withOpacity(0.4),
            inactiveTrackColor: Colors.grey.withOpacity(0.5),
            activeColor: pink.withOpacity(0.8),
            inactiveThumbColor: Colors.grey,
            onChanged: (value){
              cubit.disableAppNotifications();
            }
        ),
      ],
    );
  }
}
