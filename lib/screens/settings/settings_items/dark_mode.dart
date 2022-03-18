import 'package:flutter/material.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/shared/constants.dart';


class DarkMode extends StatelessWidget {
  final TodoCubit cubit;
  const DarkMode({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Dark Mode",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 18),
        ),
        const Spacer(),
        Switch(
            value: isDarkMode!,
            activeTrackColor: Colors.white,
            activeColor: Colors.white,
            inactiveThumbColor: Colors.black54,
            inactiveTrackColor: Colors.black54,
            onChanged: (value){
              cubit.changeTheme();
            }
        ),
      ],
    );
  }
}
