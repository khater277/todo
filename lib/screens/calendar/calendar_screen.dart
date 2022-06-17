import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/default_widgets.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<TodoCubit,TodoStates>(
      listener: (context,state){},
      builder: (context,state){
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                leading: const DefaultBackButton(),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text("${100.w}"),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5.6.h, left: 5.5.w, right: 5.5.w,),
                    child: Text("calendar".tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 29.sp),

                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.8.h,bottom: 11.17.h,
                          left: 2.77.w,right: 2.77.w),
                      child: SfDateRangePicker(
                        cancelText: "cancel".tr,
                        confirmText: 'ok'.tr,
                        headerHeight: 11.17.h,
                        view: DateRangePickerView.year,
                        showNavigationArrow: true,
                        headerStyle: DateRangePickerHeaderStyle(
                          textAlign: TextAlign.center,
                          textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: !isDarkMode!?blue:Colors.white,
                              fontSize: 18.33.sp
                          ),
                        ),
                        yearCellStyle: DateRangePickerYearCellStyle(
                          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: !isDarkMode!?blue:Colors.white,
                            fontSize: 16.66.sp,
                          ),
                          todayTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: !isDarkMode!?blue:Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                        monthCellStyle: DateRangePickerMonthCellStyle(
                          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: !isDarkMode!?blue:Colors.white,
                              fontSize: 16.66.sp
                          ),
                        ),
                        selectionColor: pink.withOpacity(0.7),
                        selectionTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                            fontSize: 15.sp
                        ),
                        todayHighlightColor: pink.withOpacity(0.7),
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
      },
    );
  }
}
