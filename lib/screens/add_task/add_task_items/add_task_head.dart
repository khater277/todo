import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/default_widgets.dart';

class AddTaskHead extends StatelessWidget {
  final TextEditingController taskController;
  const AddTaskHead({Key? key, required this.taskController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.55.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 11.17.h,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.8.h),
            child: Text("addNew".tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 33.33.sp),
            ),
          ),
          DefaultTextFormFiled(
            formatters: [NoLeadingSpaceFormatter()],
                controller: taskController,
                validateText: "taskError".tr,
                heightPadding: 2.8.h,
                widthPadding: 4.16.w,
                textColor: !isDarkMode!?blue:Colors.white,
                textSize: 16.66.sp,
                inputType: TextInputType.text,
                hint: "enterTask".tr,
                hintColor: Colors.grey.withOpacity(0.7),
                focusBorder: !isDarkMode!?
                blue.withOpacity(0.55):Colors.white60,
                border: Colors.grey.withOpacity(0.7),
                rounded: 5.sp,
              )
        ],
      ),
    );
  }
}
