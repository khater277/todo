import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';

class SelectLanguage extends StatelessWidget {
  final TodoCubit cubit;

  const SelectLanguage({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "language".tr,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 15.sp,),
        ),
        const Spacer(),
        DropdownButton(
          dropdownColor: Theme.of(context).scaffoldBackgroundColor,
            focusColor: Theme.of(context).scaffoldBackgroundColor,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 13.33.sp,
            ),
            underline: const Text(""),
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.85.w),
              child: Icon(IconBroken.Arrow___Down_2,
              color: !isDarkMode!?Colors.black87:Colors.white,),
            ),
            iconSize: 13.33.sp,
            value: lang!,
            items: const [
              DropdownMenuItem(
                child: Text(
                    "English",
                ),
                value: "en",
              ),
              DropdownMenuItem(
                child: Text("العربية"),
                value: "ar",
              ),
            ],
            onChanged: (value) {
            cubit.changeAppLanguage(value.toString());
            }),
      ],
    );
  }
}
