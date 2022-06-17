import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/default_widgets.dart';

class SelectDateScreen extends StatelessWidget {
  const SelectDateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final DateRangePickerController _dateRangePickerController = DateRangePickerController();

    return BlocConsumer<TodoCubit,TodoStates>(
      listener: (context,state){},
      builder: (context,state){
        TodoCubit cubit = TodoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: const DefaultBackButton()
            ,),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.8.h,horizontal: 2.77.w),
            child: SfDateRangePicker(
              controller: _dateRangePickerController,
              showNavigationArrow: true,
              view: DateRangePickerView.year,
              headerHeight: 11.17.h,
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
              confirmText: 'ok'.tr,
              cancelText: 'cancel'.tr,
              selectionMode: DateRangePickerSelectionMode.single,
              showActionButtons: true,
              onSubmit: (dynamic value){
                Get.back();
                DateTime dateTime = value;
                cubit.selectedDateTime(dateTime);
              },
              onCancel: (){
                Get.back();
              },
            ),
          ),
        );
      },
    );
  }
}
