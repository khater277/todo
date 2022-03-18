import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo/cubit/cubit.dart';
import 'package:todo/cubit/states.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/styles/icons_broken.dart';

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
            leading: IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: const Icon(IconBroken.Arrow___Left_2)
            ),),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            child: SfDateRangePicker(
              controller: _dateRangePickerController,
              showNavigationArrow: true,
              view: DateRangePickerView.year,
              headerHeight: 80,
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
              showTodayButton: true,
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
