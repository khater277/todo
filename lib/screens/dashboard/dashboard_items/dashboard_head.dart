import 'package:flutter/material.dart';
import 'package:todo/shared/date_format.dart';

class DashboardHead extends StatelessWidget {
  const DashboardHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String date = DateFormatter().
    dateFormat(DateTime.now().toString())!['date']!;

    int atIndex = date.indexOf('at');
    date = date.substring(0,atIndex);
    return Padding(
      padding: const EdgeInsets.only(top: 60,left: 20,right: 10,bottom: 50),
      child: Row(
        children: [
          Expanded(
            child: Text("Dashboard",
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
