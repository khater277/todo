import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/shared/constants.dart';

class DarkMode extends StatelessWidget {
  final TodoCubit cubit;
  const DarkMode({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "darkMode".tr,
          style:
              Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 15.sp),
        ),
        const Spacer(),
        Switch(
            value: isDarkMode!,
            activeTrackColor: pink.withOpacity(0.4),
            inactiveTrackColor: Colors.grey.withOpacity(0.5),
            activeColor: pink.withOpacity(0.8),
            inactiveThumbColor: Colors.grey,
            onChanged: (value) {
              cubit.changeTheme();
            }),
      ],
    );
  }
}
