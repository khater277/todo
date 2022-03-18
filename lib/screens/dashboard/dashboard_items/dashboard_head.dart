import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          top: 60,
          left: languageFun(ar: 10.0, en: 20.0),
          right: languageFun(ar: 20.0, en: 10.0),
          bottom: 50
      ),
      child: Row(
        children: [
          Expanded(
            child: Text("dashboard".tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 35),

            ),
          ),
          Text(date,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 15,color: Colors.grey),

          ),
        ],
      ),
    );
  }
}
