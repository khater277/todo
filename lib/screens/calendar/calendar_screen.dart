import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: const Icon(IconBroken.Arrow___Left_2)
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
              child: Text("Calendar",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 35),

              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 40,
                    left: 10,right: 10),
                child: SfDateRangePicker(
                  headerHeight: 80,
                  view: DateRangePickerView.year,
                  showNavigationArrow: true,
                  headerStyle: DateRangePickerHeaderStyle(
                    textAlign: TextAlign.center,
                    textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: blue,
                      fontSize: 22
                    ),
                  ),
                  yearCellStyle: DateRangePickerYearCellStyle(
                    textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: blue,
                        fontSize: 20,
                    ),
                    todayTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: blue,
                      fontSize: 18,
                    ),
                  ),
                  monthCellStyle: DateRangePickerMonthCellStyle(
                    textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: blue,
                        fontSize: 20
                    ),
                  ),
                  selectionColor: pink.withOpacity(0.7),
                  selectionTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white,
                      fontSize: 18
                  ),
                  todayHighlightColor: pink.withOpacity(0.7),
                  showTodayButton: true,
                  //startRangeSelectionColor:Colors.red,
                  //selectionMode: DateRangePickerSelectionMode.single,
                  //showActionButtons: true,
                ),
              ),
            ),
          ],
        )
      ),
      );
  }
}
