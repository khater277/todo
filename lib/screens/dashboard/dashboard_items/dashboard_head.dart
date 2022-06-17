import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/date_format.dart';

class DashboardHead extends StatelessWidget {
  const DashboardHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String date = DateFormatter().
    dateFormat(DateTime.now().toString())!['date']!;

    int atIndex = languageFun(ar: date.indexOf('في'), en: date.indexOf('at'));
    date = date.substring(0,atIndex);
    return Padding(
      padding: EdgeInsets.only(
          top: 8.37.h,
          left: languageFun(ar: 2.77.w, en: 5.55.w),
          right: languageFun(ar: 5.55.w, en: 2.77.w),
          bottom: 7.h
      ),
      child: Row(
        children: [
          Expanded(
            child: Text("dashboard".tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 29.16.sp),

            ),
          ),
          Text(date,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 12.5.sp,color: Colors.grey),

          ),
        ],
      ),
    );
  }
}
