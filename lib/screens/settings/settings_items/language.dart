import 'package:flutter/material.dart';
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
          "Language",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 18,),
        ),
        const Spacer(),
        DropdownButton(
          dropdownColor: Theme.of(context).scaffoldBackgroundColor,
            focusColor: Theme.of(context).scaffoldBackgroundColor,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 16,
            ),
            underline: const Text(""),
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Icon(IconBroken.Arrow___Down_2,
              color: !isDarkMode!?Colors.black87:Colors.white,),
            ),
            iconSize: 16,
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