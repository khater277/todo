import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/default_widgets.dart';
import 'package:todo/styles/icons_broken.dart';

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
        TodoCubit cubit = TodoCubit.get(context);
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                leading: const DefaultBackButton(),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 20, right: 20,),
                    child: Text("calendar".tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 35),

                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 80,
                          left: 10,right: 10),
                      child: SfDateRangePicker(
                        cancelText: "cancel".tr,
                        confirmText: 'ok'.tr,
                        headerHeight: 80,
                        view: DateRangePickerView.year,
                        showNavigationArrow: true,
                        headerStyle: DateRangePickerHeaderStyle(
                          textAlign: TextAlign.center,
                          textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: !isDarkMode!?blue:Colors.white,
                              fontSize: 22
                          ),
                        ),
                        yearCellStyle: DateRangePickerYearCellStyle(
                          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: !isDarkMode!?blue:Colors.white,
                            fontSize: 20,
                          ),
                          todayTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: !isDarkMode!?blue:Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        monthCellStyle: DateRangePickerMonthCellStyle(
                          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: !isDarkMode!?blue:Colors.white,
                              fontSize: 20
                          ),
                        ),
                        selectionColor: pink.withOpacity(0.7),
                        selectionTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                            fontSize: 18
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
