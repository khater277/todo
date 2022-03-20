import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/default_widgets.dart';

class AddTaskHead extends StatelessWidget {
  final TextEditingController taskController;
  const AddTaskHead({Key? key, required this.taskController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text("addNew".tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 40),
            ),
          ),
          DefaultTextFormFiled(
            formatters: [NoLeadingSpaceFormatter()],
                controller: taskController,
                validateText: "taskError".tr,
                heightPadding: 20,
                widthPadding: 15,
                textColor: !isDarkMode!?blue:Colors.white,
                textSize: 20,
                inputType: TextInputType.text,
                hint: "enterTask".tr,
                hintColor: Colors.grey.withOpacity(0.7),
                focusBorder: !isDarkMode!?
                blue.withOpacity(0.55):Colors.white60,
                border: Colors.grey.withOpacity(0.7),
                rounded: 5,
              )
        ],
      ),
    );
  }
}
