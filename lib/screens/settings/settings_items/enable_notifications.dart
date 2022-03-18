import 'package:flutter/material.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/shared/constants.dart';

class DisableNotifications extends StatelessWidget {
  final TodoCubit cubit;
  const DisableNotifications({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Disable Notifications",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 18),
        ),
        const Spacer(),
        Switch(
            value: disableNotifications!,
            activeTrackColor: isDarkMode!?Colors.white:Colors.black54,
            activeColor: isDarkMode!?Colors.white:Colors.black54,
            inactiveThumbColor: isDarkMode!?Colors.white38:Colors.black54,
            inactiveTrackColor: isDarkMode!?Colors.white38:Colors.black54,
            onChanged: (value){
              cubit.disableAppNotifications();
            }
        ),
      ],
    );
  }
}
